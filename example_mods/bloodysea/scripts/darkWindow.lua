                      -----------------------------
                      -- WINDOW DARK MODE IN LUA --
                      -----------------------------                   
-- Script and code made by T-Bar: https://www.youtube.com/@tbar7460 --
--    (please leave this message in the script, acts as credits)    --
--                                :D                                --

local ffi = require("ffi");
local dwmapi = ffi.load("dwmapi");
ffi.cdef([[
	typedef void* CONST;
    typedef void* HWND;
    typedef unsigned long DWORD;
	typedef const void *LPCVOID;
	typedef int BOOL;
	
	typedef long LONG;
	typedef LONG HRESULT;
	
	HWND GetActiveWindow();
	HRESULT DwmSetWindowAttribute(HWND hwnd, DWORD dwAttribute, LPCVOID pvAttribute, DWORD cbAttribute);
	void UpdateWindow(HWND hWnd);
]])

local S_OK = 0x00000000;
local windowColorMode = {
	0x7ffec8f410bf, --Dark mode
	000000 --Light mode
};

function setWindowColorMode(isDark)
	local window = ffi.C.GetActiveWindow();
	local isColorMode = dwmapi.DwmSetWindowAttribute(window, 19, ffi.new("int[1]", windowColorMode[(isDark and 1 or 2)]), ffi.sizeof(ffi.cast("DWORD", (isDark and 1 or 0))));

	if isColorMode == 0 or isColorMode ~= S_OK then
		dwmapi.DwmSetWindowAttribute(window, 20, ffi.new("int[1]", windowColorMode[(isDark and 1 or 2)]), ffi.sizeof(ffi.cast("DWORD", (isDark and 1 or 0))));
	end
	
	ffi.C.UpdateWindow(window);
end

function redrawWindowHeader()
	setPropertyFromClass('flixel.FlxG', 'stage.window.borderless', true);
	setPropertyFromClass('flixel.FlxG', 'stage.window.borderless', false);
end

function onCreate()
	setWindowColorMode(true);
	
	--Only redraws the window header if your using Windows 10, since Windows 11 redraws it automatically.
	if string.find(getPropertyFromClass("lime.system.System", "platformLabel"), "10") then redrawWindowHeader() end
	
	setPropertyFromClass('flixel.FlxG', 'stage.window.title', "Bloody Sea Bottom");
end

function onDestroy()
	setWindowColorMode(false);
	if string.find(getPropertyFromClass("lime.system.System", "platformLabel"), "10") then redrawWindowHeader() end
	
	setPropertyFromClass('flixel.FlxG', 'stage.window.title', "Friday Night Funkin': Psych Engine");
end