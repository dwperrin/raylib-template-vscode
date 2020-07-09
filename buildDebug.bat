@echo off
if not exist ".\build\" mkdir build
if not exist ".\lib\" mkdir lib

set RaylibSrc=C:\raylib\raylib\src\
set StartFile=main.c
set CompilerFlagsDebug= /Zi /Od /MD /nologo /MP /fp:fast /Oi /Gm- /GL


pushd build

cl   %CompilerFlagsDebug% /c /DPLATFORM_DESKTOP /DGRAPHICS_API_OPENGL_33  %RaylibSrc%*.c   /I %RaylibSrc%external\glfw\include
lib *.obj /out:..\lib\raylib.lib
cl   %CompilerFlagsDebug% ..\src\%StartFile% /MD /I %RaylibSrc% /link  /SUBSYSTEM:CONSOLE ..\lib\raylib.lib gdi32.lib User32.lib shell32.lib  winmm.lib

popd

REM lib  C:\dwp\dev\perso\raylib-play\build\*.obj