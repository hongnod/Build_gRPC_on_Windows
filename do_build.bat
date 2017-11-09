@echo off
::Release,Debug,RelWithDebInfo
set CMAKE_BUILD_TYPE=%1%
::x86,x64
set PLATFORM=%2%
set OUTPUT_PATH=%3%
set CMAKE_PATH=%4%

if not exist %PLATFORM% (
    mkdir %PLATFORM%
)
cd %PLATFORM%

if %PLATFORM% == x86 (
    call "%VS140COMNTOOLS%..\..\VC\vcvarsall.bat" x86
)
if %PLATFORM% == x64 (
    call "%VS140COMNTOOLS%..\..\VC\vcvarsall.bat" amd64
)

echo cmake -G "NMake Makefiles" -D CMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -D EXECUTABLE_OUTPUT_PATH=%OUTPUT_PATH% -D LIBRARY_OUTPUT_PATH=%OUTPUT_PATH% -D CMAKE_C_FLAGS_RELEASE="/MT /WX-" -D CMAKE_CXX_FLAGS_RELEASE="/MT /WX-" -D BUILD_SHARED_LIBS=0 %CMAKE_PATH%
::CMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% build target type (Release,Debug,RelWithDebInfo)
::EXECUTABLE_OUTPUT_PATH=%OUTPUT_PATH%    where to put executable target
::LIBRARY_OUTPUT_PATH=%OUTPUT_PATH%         Where to put LIB target
::CMAKE_C_FLAGS_RELEASE="/MT /WX-"       don not treat warning as error
::CMAKE_CXX_FLAGS_RELEASE="/MT /WX-"    don not treat warning as error
::BUILD_SHARED_LIBS=0                    generate static LIB
cmake -G "NMake Makefiles" -D CMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -D EXECUTABLE_OUTPUT_PATH=%OUTPUT_PATH% -D LIBRARY_OUTPUT_PATH=%OUTPUT_PATH% -D CMAKE_C_FLAGS_RELEASE="/MT /WX-" -D CMAKE_CXX_FLAGS_RELEASE="/MT /WX-" -D BUILD_SHARED_LIBS=0 %CMAKE_PATH%
nmake grpc grpc++ grpc_cpp_plugin protoc
:: use “nmake” build all targets
