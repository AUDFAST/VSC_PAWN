@echo off
cd pawno
start play.exe sound/l_health.wav
pawncc.exe %* > 1.txt 2>&1

set ERROR=%ERRORLEVEL%

if exist rus.txt ( type rus.txt
del rus.txt
) else type 1.txt

for /f "delims=" %%x in (1.txt) do set VAR=%%x
set WARNING=0
echo.%VAR%|findstr /C:"Warning" >nul 2>&1 && set WARNING=1

del 1.txt
chcp 65001
if %ERROR% EQU 0 ( if %WARNING% EQU 1 ( start play.exe sound/ControlSound.wav
) else start play.exe sound/item_respawn.wav
  echo Запускаю сервер!
  cd ..
  samp-server.exe
) else if %ERROR% EQU -1073741819 ( echo Pawn Compiler can't compile: script error
start play.exe sound/DliftE2.wav
) else if %ERROR% EQU 2 ( start play.exe sound/ControlSound.wav
  echo Не стоит. Почитай документацию для исправления проблем выше
) else if %WARNING% EQU 1 ( start play.exe sound/ControlSound.wav
  echo Не стоит. Советую почитать документацию по исправлению проблем указанных выше
) else (
start play.exe sound/DliftE2.wav
echo У вас ошибка в скрипте!
echo Если у вас не получается исправить её, обратитесь к другим разработчикам.
)
