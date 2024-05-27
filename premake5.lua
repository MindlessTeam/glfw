project "GLFW"
    filename "GLFW"

    kind "StaticLib"
    language "C"
    staticruntime "off"

    targetdir ("%{wks.location}/out/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/out/obj/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/**.h",
		"src/**.c"
    }

    filter "system:windows"
		systemversion "latest"

		files
		{
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_module.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
		}

		defines 
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

		links
		{
			"Dwmapi.lib"
		}
    
    filter "configurations:Debug"
		defines { "CFG_DEBUG" }
		symbols "On"
		optimize "Off"
	
	filter "configurations:PreRelease"
		defines { "CFG_PRERELEASE" }
		symbols "On"
		optimize "On"
		
	filter "configurations:Release"
		defines { "CFG_RELEASE" }
		symbols "Off"
		optimize "On"