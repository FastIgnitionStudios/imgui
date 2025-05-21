project "ImGui"
	kind "StaticLib"
	language "C"

	targetdir ("%{wks.location}/Binaries/%{cfg.buildcfg}")
	objdir ("%{wks.location}/%{cfg.buildcfg}")

	files
	{
        "imstb_truetype.h",
        "imstb_textedit.h",
        "imstb_rectpack.h",
        "imgui_widgets.cpp",
        "imgui_tables.cpp",
        "imgui_internal.h",
        "imgui_draw.cpp",
        "imgui_demo.cpp",
        "imgui.h",
        "imgui.cpp",
        "imconfig.h",
        "backends/imgui_impl_glfw.h",
        "backends/imgui_impl_glfw.cpp",
        "backends/imgui_impl_vulkan.h",
        "backends/imgui_impl_vulkan.cpp"
	}

    includedirs
    {
        "",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.VulkanSDK}"
        }

    links
    {
        "%{Library.Vulkan}"
        }

	filter "system:windows"
		systemversion "latest"
		staticruntime "On" --staticly linking the runtime libraries

		defines
		{
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
