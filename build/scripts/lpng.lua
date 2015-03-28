	project "lpng"
        location ("../" .. _ACTION .. "/lib/")

		targetname "lpng"
		language "C++"
		kind "StaticLib"

		includedirs {
			"../../engine/source",
            "../../engine/lib/lpng",
            "../../engine/lib/zlib",
		}

		files {
			"../../engine/lib/lpng/**.h",
            "../../engine/lib/lpng/**.c",
		}

        removefiles {
			
        }

		configuration "Debug"
			defines     { "TORQUE_DEBUG" }
            flags       { "Symbols" }

		configuration "Release"
			defines     {  }

		configuration "vs*"
			defines     { "_CRT_SECURE_NO_WARNINGS" }

		configuration "windows"
			targetdir   "../bin/windows"
			links { "ole32" }

		configuration "linux"
			targetdir   "../bin/linux"
			links       { "dl" }

		configuration "bsd"
			targetdir   "../bin/bsd"

		configuration "linux or bsd"
			defines     {  }
			links       { "m" }
			linkoptions { "-rdynamic" }

		configuration "macosx"
			targetdir   "../bin/darwin"
			defines     {  }
			links       { "CoreServices.framework" }

		configuration { "macosx", "gmake" }
			buildoptions { "-mmacosx-version-min=10.4" }
			linkoptions  { "-mmacosx-version-min=10.4" }
