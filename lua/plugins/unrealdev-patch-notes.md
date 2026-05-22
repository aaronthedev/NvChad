# UnrealDev.nvim Linux Patches

## 1. USX.nvim Queries (after/queries/cpp/highlights.scm)
**File:** `~/.local/share/nvim/lazy/USX.nvim/after/queries/cpp/highlights.scm`  
**Issue:** Node types `umeta_macro`, `unreal_argument_list`, `unreal_specifier_content` don't exist in the pinned parser revision `e2b94d3bd3ce359ff732116cc21f34ecbecfca50`.  
**Fix:** Commented out all references to these node types. If USX.nvim updates (lazy sync), re-apply the patch.

## 2. Engine Path
**File:** `~/.config/nvim/lua/plugins/unrealdev.lua`  
**Issue:** `engine_path = "/TremEn"` didn't exist.  
**Fix:** Changed to `"/home/aaron/TremEn"` on lines 15 and 19.

## 3. UBT Linux Clang Support (GenerateClangDatabase)
**File:** `/home/aaron/TremEn/Engine/Source/Programs/UnrealBuildTool/Modes/GenerateClangDatabase.cs`  
**Line 66-67:** Changed from hardcoded `WindowsCompiler.Clang` + `VCEnvironment` to a check for `UnrealTargetPlatform.Linux` that uses the in-tree clang toolchain path.  
**Important:** `Build.sh` rebuilds UBT from source, which would wipe this patch. `InstalledBuild.txt` was created at `/home/aaron/TremEn/Engine/Build/InstalledBuild.txt` to prevent that.  
**Regeneration script:** `~/temr/gen_compile_db.sh`
