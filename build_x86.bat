@echo off

set CURRENT_DIR=%~dp0
set CMAKE_BUILD_TYPE=RelWithDebInfo
set PLATFORM=x86
set OUTPUT_PATH=%CURRENT_DIR%/x86/bin
set CMAKE_PATH=%CURRENT_DIR%/../../

call do_build.bat %CMAKE_BUILD_TYPE% %PLATFORM% %OUTPUT_PATH% %CMAKE_PATH%

@pause