@echo off
if not exist ".\release\" mkdir release
if not exist ".\lib\" mkdir lib

set RaylibSrc=C:\raylib\raylib\src\
set StartFile=main.c
set CompilerFlagsRelease= /O2 /MD /nologo /MP /fp:fast /Oi /Gm- /GL


pushd release

cl   %CompilerFlagsRelease% /c /DPLATFORM_DESKTOP /DGRAPHICS_API_OPENGL_33  %RaylibSrc%*.c   /I %RaylibSrc%external\glfw\include
lib *.obj /out:..\lib\raylib.lib
cl   %CompilerFlagsRelease% ..\src\%StartFile% /MD /I %RaylibSrc% /link  /SUBSYSTEM:CONSOLE ..\lib\raylib.lib gdi32.lib User32.lib shell32.lib  winmm.lib


popd

REM lib C:\Users\YOUR\source\repos\PROJECT\build\*.obj