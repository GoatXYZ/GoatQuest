"""The one name transform used to derive GoatQuestRetail files from the installed Zygor source.

Every tool that copies upstream files (guide sync, licence refresh, settings import) must use
these functions so that re-imported files match the files already in the repository.
"""
import re
from pathlib import Path

ADDON = "GoatQuestRetail"
UPSTREAM = Path(r"C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns\ZygorGuidesViewer")

_PAIRS = (
    ("ZygorGuidesViewerClassic", "GoatQuest"),
    ("ZygorGuidesViewer", "GoatQuest"),
    ("ZGV", "GQ"),
    ("Zygor", "GoatQuest"),
    ("zygor", "goatquest"),
)
_ADDON_PATH = re.compile(r"(?i)(Interface(?:\\\\|\\|/)+AddOns(?:\\\\|\\|/)+)GoatQuest(?=\\\\|\\|/)")
TEXT_SUFFIXES = {".lua", ".xml", ".toc", ".txt", ".md", ".json", ".html"}


def transform_name(relative_path: str) -> str:
    """Rename an upstream relative path (forward slashes) to its GoatQuestRetail path."""
    for old, new in _PAIRS:
        relative_path = relative_path.replace(old, new)
    return relative_path


def transform_text(text: str) -> str:
    """Apply the namespace rename and point texture paths at the GoatQuestRetail folder."""
    for old, new in _PAIRS:
        text = text.replace(old, new)
    return _ADDON_PATH.sub(lambda match: match.group(1) + ADDON, text)


def transform_bytes(data: bytes, suffix: str) -> bytes:
    """Transform a file's bytes, preserving a UTF-8 BOM and undecodable bytes."""
    if suffix.lower() not in TEXT_SUFFIXES:
        return data
    bom = data.startswith(b"\xef\xbb\xbf")
    text = data.removeprefix(b"\xef\xbb\xbf").decode("utf-8", errors="surrogateescape")
    return (b"\xef\xbb\xbf" if bom else b"") + transform_text(text).encode("utf-8", errors="surrogateescape")
