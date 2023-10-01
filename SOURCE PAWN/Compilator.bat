@echo off
spcomp.exe %*

set ERON=%ERRORLEVEL%

if %ERON% EQU 1 (
	start play.exe sound/DliftE2.wav
)
if %ERON% EQU 0 (
	start play.exe sound/item_respawn.wav
)