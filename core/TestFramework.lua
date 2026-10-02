local name,GQ = ...

GQ.TestFramework.FailText = "|cFFFF0000FAIL|r"
GQ.TestFramework.PassText = "|cFF00FF00PASS|r"

GQ.TestFramework.numTests = 0
GQ.TestFramework.failTests = 0
GQ.TestFramework.passTests = 0

if GQ.UseUnitTesting then

	-- Put locals here for testing.
	-- Please put them into tables by name.
	GQ.TestFramework.locals = {}
	
	-- Check loading
	GQ.TestFramework.CheckLoad = function()
	end

	-- Name: String to identify test
	-- rethrowErrors: true if you want to throw errors the test receives,
	-- 	false if you want the test to fail silently
	-- testFunction: The function you want to test
	-- ...: Arguments passed to the function being tested
	function GQ.TestFramework.test(name, rethrowErrors, testFunction, ...)
		if name == nil then
			error("BAD TEST: NO NAME")
		end
		
		if testFunction == nil then
			error("BAD TEST: NO FUNCTION")
		end
		
		GQ.TestFramework.numTests = GQ.TestFramework.numTests + 1
		local status, err = pcall(testFunction, ...)
		if status == false then
			GQ.TestFramework.failTests = GQ.TestFramework.failTests + 1
			print(name..": "..GQ.TestFramework.FailText.."|r "..(err or ""))
			print(debugstack() or "")
			if rethrowErrors then
				error("Unit test: "..name.." failed. "..err)
			end
		else
			if err==nil then
				-- Technically, an empty test is a fail.
				-- Return a value to make a test not fail.
				print(name..": "..GQ.TestFramework.FailText.."|r ".."Empty test")
			else
				GQ.TestFramework.passTests = GQ.TestFramework.passTests + 1
				print(name..": "..GQ.TestFramework.PassText)
			end
		end
	end

	-- This test must throw an error.
	function GQ.TestFramework.assertError(testFunction, ...)
		if testFunction == nil then
			error("BAD ASSERTION: NO FUNCTION")
		end
		local status, err = pcall(testFunction, ...)
		if status == true then
			error("Unit test failed: This must be an error.")
		end
	end

	-- This test must not throw an error.
	function GQ.TestFramework.assertSuccess(testFunction, ...)
		if testFunction == nil then
			error("BAD ASSERTION: NO FUNCTION")
		end
		local status, err = pcall(testFunction, ...)
		if status == false then
			error("Unit test failed: This must not throw an error.\n----------------\n" ..err.."\n".. debugstack().."\n----------------\n")
		end
	end
	
	function GQ.TestFramework.fail(text)
		error(text or "Failed test.")
	end

end

