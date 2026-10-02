"""Release boundaries, shared-source assembly and conflict-safe migration."""
import importlib.util
import json
from contextlib import ExitStack
from pathlib import Path
import sys
import subprocess
import tempfile
import unittest
from unittest.mock import patch
from types import SimpleNamespace
import zipfile

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
import import_sources
import source_tree

spec = importlib.util.spec_from_file_location("monobuild", ROOT / "build.py")
builder = importlib.util.module_from_spec(spec)
spec.loader.exec_module(builder)


class ImportTests(unittest.TestCase):
    def test_three_way_updates_preserve_local_edits(self):
        base = {"local.lua": source_tree.digest(b"old"), "upstream.lua": source_tree.digest(b"old")}
        merged, conflicts = import_sources.reconcile(base,
            {"local.lua": b"local fix", "upstream.lua": b"old"},
            {"local.lua": b"old", "upstream.lua": b"upstream fix", "new.lua": b"new"})
        self.assertFalse(conflicts)
        self.assertEqual(merged, {"local.lua": b"local fix", "upstream.lua": b"upstream fix", "new.lua": b"new"})

    def test_conflicting_updates_and_deletions_fail(self):
        base = {"both.lua": source_tree.digest(b"old")}
        for incoming in ({"both.lua": b"upstream fix"}, {}):
            _, conflicts = import_sources.reconcile(base, {"both.lua": b"local fix"}, incoming)
            self.assertEqual(conflicts, ["both.lua"])

    def test_upstream_deletion_and_local_deletion_are_preserved(self):
        base = {"a.lua": source_tree.digest(b"a"), "b.lua": source_tree.digest(b"b")}
        merged, conflicts = import_sources.reconcile(base, {"a.lua": b"a"}, {"b.lua": b"b"})
        self.assertEqual((merged, conflicts), ({}, []))

    def test_flavor_change_splits_shared_source(self):
        planned, count = import_sources.partition({
            "forever": {"Shared.lua": b"shared", "Compat.lua": b"old", "Code-Retail/a.lua": b"same"},
            "retail": {"Shared.lua": b"shared", "Compat.lua": b"new", "Code-Retail/a.lua": b"same"},
        })
        self.assertEqual(count, 1)
        self.assertEqual(planned["core/Shared.lua"], b"shared")
        self.assertNotIn("core/Compat.lua", planned)
        self.assertEqual(planned["flavors/retail/files/Compat.lua"], b"new")
        self.assertNotIn("core/Code-Retail/a.lua", planned)


class BuildTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.write("core/Shared.lua", b"-- common\n")
        for flavor, addon in source_tree.FLAVORS.items():
            interface = 16001 if flavor == "forever" else 120100
            self.write(f"flavors/{flavor}/files/{addon}.toc",
                       f"## Interface: {interface}\n## Version: 1.2.3\nShared.lua\nFlavor.lua\n".encode())
            self.write(f"flavors/{flavor}/files/Flavor.lua", flavor.encode())

    def write(self, name, data):
        path = self.root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
        return path

    def assemble(self, flavor):
        with patch.object(builder, "ROOT", self.root), patch.object(builder, "source_files",
                side_effect=lambda f: source_tree.source_files(f, self.root)):
            return builder.assemble(flavor)

    def build_context(self):
        stack = ExitStack()
        stack.enter_context(patch.object(builder, "ROOT", self.root))
        stack.enter_context(patch.object(builder, "source_files",
            side_effect=lambda f: source_tree.source_files(f, self.root)))
        stack.enter_context(patch.object(builder, "release_module", side_effect=lambda tree: SimpleNamespace(
            version=lambda: "1.2.3",
            release_files=lambda: [(tree.name + "/" + p.name, p) for p in sorted(tree.iterdir())])))
        return stack

    def complete_release(self):
        with self.build_context():
            archives = {f: builder.package(f, builder.assemble(f), True) for f in source_tree.FLAVORS}
            builder.write_release_metadata(archives)
        return json.loads((self.root / "dist/release.json").read_text())

    def test_common_edit_reaches_both_flavors_and_rebuild_removes_stale_files(self):
        forever = self.assemble("forever")
        (forever / "stale.lua").write_bytes(b"stale")
        self.write("core/Shared.lua", b"-- fixed once\n")
        for flavor, addon in source_tree.FLAVORS.items():
            tree = self.assemble(flavor)
            self.assertEqual((tree / "Shared.lua").read_bytes(), b"-- fixed once\n")
            self.assertEqual((tree / "Flavor.lua").read_bytes(), flavor.encode())
            self.assertFalse((tree / "stale.lua").exists())
            self.assertEqual([p.name for p in tree.glob("*.toc")], [addon + ".toc"])

    def test_shadowed_common_file_is_rejected(self):
        self.write("flavors/retail/files/Shared.lua", b"unexpected override")
        with self.assertRaisesRegex(ValueError, "Ambiguous"):
            source_tree.source_files("retail", self.root)

    def test_private_files_and_traversal_rejected(self):
        for name in ["Licence.lua", "nested/LICENSE.lua", "../outside", "C:/outside", "a\\b"]:
            with self.subTest(name=name), self.assertRaises(ValueError):
                source_tree.relative_path(name)
        self.write("core/nested/Licence.lua", b"synthetic test only")
        with self.assertRaises(ValueError):
            source_tree.source_files("retail", self.root)

    def test_recursive_cleanup_is_confined_to_generated_children(self):
        for name in ["", "core", "build", "dist", "build/../../outside"]:
            with self.subTest(name=name), self.assertRaises(ValueError):
                source_tree.remove_generated(self.root / name, self.root)

    def test_load_graph_requires_every_packaged_dependency(self):
        tree = self.assemble("retail")
        names = {"GoatQuestRetail.toc", "Shared.lua", "Flavor.lua"}
        self.assertEqual(builder.validate_load_graph(tree, names, "retail"), 2)
        with self.assertRaisesRegex(ValueError, "missing load dependency"):
            builder.validate_load_graph(tree, names - {"Shared.lua"}, "retail")
        (tree / "GoatQuestRetail.toc").write_text("Locale.lua [AllowLoadTextLocale deDE]\n")
        with self.assertRaisesRegex(ValueError, "Locale.lua"):
            builder.validate_load_graph(tree, names, "retail")

    def test_retail_private_dependency_is_external_but_forever_cannot_load_it(self):
        tree = self.assemble("retail")
        (tree / "GoatQuestRetail.toc").write_text("Licence.lua\n")
        names = {"GoatQuestRetail.toc"}
        self.assertEqual(builder.validate_load_graph(tree, names, "retail"), 0)
        with self.assertRaises(ValueError):
            builder.validate_load_graph(tree, names, "forever")

    def test_xml_parent_references_must_stay_inside_addon(self):
        tree = self.assemble("forever")
        (tree / "GoatQuest.toc").write_text("Libs/lib.xml\n")
        (tree / "Libs").mkdir()
        xml = tree / "Libs/lib.xml"
        xml.write_text('<Ui><Script file="../Shared.lua"/></Ui>')
        names = {"GoatQuest.toc", "Libs/lib.xml", "Shared.lua"}
        self.assertEqual(builder.validate_load_graph(tree, names, "forever"), 2)
        xml.write_text('<Ui><Script file="../../outside.lua"/></Ui>')
        with self.assertRaisesRegex(ValueError, "External load dependency"):
            builder.validate_load_graph(tree, names, "forever")

    def test_reproducible_zip_matches_installable_folder(self):
        tree = self.assemble("forever")
        class Release:
            @staticmethod
            def version():
                return "1.2.3"

            @staticmethod
            def release_files():
                return [("GoatQuest/" + p.name, p) for p in sorted(tree.iterdir())]
        with patch.object(builder, "ROOT", self.root), patch.object(builder, "release_module", return_value=Release):
            archive = builder.package("forever", tree, True)
            first = archive.read_bytes()
            self.assertEqual(builder.package("forever", tree, True).read_bytes(), first)
            with zipfile.ZipFile(archive) as output:
                for name in output.namelist():
                    self.assertEqual(output.read(name), (self.root / "dist" / name).read_bytes())

    def test_release_metadata_selects_correct_zip_and_interface(self):
        metadata = self.complete_release()
        self.assertEqual(metadata, {"releases": [
            {"filename": "GoatQuest-1.2.3-forever.zip", "nolib": False,
             "metadata": [{"flavor": "forever", "interface": 16001}]},
            {"filename": "GoatQuestRetail-1.2.3.zip", "nolib": False,
             "metadata": [{"flavor": "mainline", "interface": 120100}]},
        ]})
        self.write("dist/GoatQuest-obsolete.zip", b"old build")
        assets = builder.verify_release(self.root / "dist")
        self.assertEqual(len(assets), 5)
        self.assertNotIn("GoatQuest-obsolete.zip", [p.name for p in assets])
        # A downloaded release needs only the five assets, not assembled addon folders.
        source_tree.remove_generated(self.root / "dist/GoatQuest", self.root)
        source_tree.remove_generated(self.root / "dist/GoatQuestRetail", self.root)
        self.assertEqual(builder.verify_release(self.root / "dist"), assets)

    def test_release_verifier_rejects_incorrect_metadata(self):
        metadata = self.complete_release()
        for kind in ("interface", "duplicate", "nolib", "traversal", "missing_flavor"):
            bad = json.loads(json.dumps(metadata))
            first = bad["releases"][0]
            if kind == "interface":
                first["metadata"][0]["interface"] = 99999
            elif kind == "duplicate":
                bad["releases"][1] = first
            elif kind == "nolib":
                first["nolib"] = True
            elif kind == "traversal":
                first["filename"] = "../outside.zip"
            else:
                bad["releases"].pop()
            with self.subTest(kind=kind), self.assertRaises(ValueError):
                builder.verify_release(self.root / "dist", bad)

    def test_release_verifier_rejects_untested_tampered_or_missing_assets(self):
        self.complete_release()
        archive = self.root / "dist/GoatQuest-1.2.3-forever.zip"
        manifest_path = archive.with_suffix(".manifest.json")
        manifest = json.loads(manifest_path.read_text())
        bad = dict(manifest, offline_tests_passed=False)
        source_tree.write_json(manifest_path, bad)
        with self.assertRaisesRegex(ValueError, "Offline tests"):
            builder.verify_release(self.root / "dist")
        source_tree.write_json(manifest_path, manifest)
        archive.write_bytes(archive.read_bytes() + b"tampered")
        with self.assertRaisesRegex(ValueError, "Archive checksum"):
            builder.verify_release(self.root / "dist")
        archive.unlink()
        with self.assertRaises(FileNotFoundError):
            builder.verify_release(self.root / "dist")

    def test_interface_list_is_read_from_packaged_toc(self):
        self.write("flavors/retail/files/GoatQuestRetail.toc",
                   b"## Interface: 120100, 120101\n## Version: 1.2.3\nShared.lua\nFlavor.lua\n")
        metadata = self.complete_release()
        self.assertEqual(metadata["releases"][1]["metadata"], [
            {"flavor": "mainline", "interface": 120100},
            {"flavor": "mainline", "interface": 120101},
        ])

    def test_partial_and_untested_builds_remove_old_release_metadata(self):
        for args in (["all", "--assemble-only"], ["all", "--skip-tests"], ["retail"]):
            self.write("dist/release.json", b"old release")
            with self.subTest(args=args), self.build_context(), patch.object(builder.subprocess, "run",
                    return_value=SimpleNamespace(returncode=0)):
                builder.main(args)
            self.assertFalse((self.root / "dist/release.json").exists())

    def test_validation_failure_removes_metadata_and_does_not_package(self):
        self.write("dist/release.json", b"old release")
        with self.build_context(), patch.object(builder.subprocess, "run",
                side_effect=[SimpleNamespace(returncode=0), SimpleNamespace(returncode=0),
                             SimpleNamespace(returncode=1)]), patch.object(builder, "package") as package:
            with self.assertRaisesRegex(SystemExit, "validation failed: retail"):
                builder.main(["all"])
            package.assert_not_called()
        self.assertFalse((self.root / "dist/release.json").exists())

    def test_packaging_failure_cannot_advertise_partial_release(self):
        self.write("dist/release.json", b"old release")
        with self.build_context(), patch.object(builder.subprocess, "run",
                return_value=SimpleNamespace(returncode=0)), patch.object(builder, "package",
                side_effect=[self.root / "dist/GoatQuest-1.2.3-forever.zip", ValueError("packaging failure")]):
            with self.assertRaisesRegex(ValueError, "packaging failure"):
                builder.main(["all"])
        self.assertFalse((self.root / "dist/release.json").exists())


class RetailRunnerTests(unittest.TestCase):
    def test_optional_skip_is_success_but_nonzero_exit_still_fails(self):
        runner = ROOT / "flavors/retail/files/tests/validate.py"
        script = (
            "import runpy,sys; from pathlib import Path; "
            "ns=runpy.run_path(sys.argv[1]); context=ns['main'].__globals__; "
            "context['ROOT']=Path(sys.argv[2]); context['CHECKS']=[]; ns['main']()"
        )
        with tempfile.TemporaryDirectory() as temp:
            tests = Path(temp) / "tests"
            tests.mkdir()
            (tests / "test_z_continue.py").write_text("print('FOLLOWING_CHECK_RAN')")
            for code, expected in [(0, 0), (4, 1)]:
                with self.subTest(exit_code=code):
                    (tests / "test_a_optional.py").write_text(f"raise SystemExit({code})")
                    result = subprocess.run([sys.executable, "-X", "utf8", "-c", script, str(runner), temp],
                                            capture_output=True, text=True)
                    self.assertEqual(result.returncode, expected, result.stdout + result.stderr)
                    self.assertIn("FOLLOWING_CHECK_RAN", result.stdout)


if __name__ == "__main__":
    unittest.main()
