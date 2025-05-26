@echo off
title Auth Offset Dumper - Updater

set "url=https://example.com/file.zip"

set /p name="Enter output file name (no extension, .zip, .exe): "
set "output=%name%.zip"

echo.
echo Downloading "%url%" as "%output%" ...
echo.

:: Download bar is fake, for visuals.
setlocal enabledelayedexpansion
set "bar="
for /L %%i in (1,1,50) do (
    set "bar=!bar!█"
    cls
    echo Downloading: !bar!
    timeout /nobreak /t 1 >nul
)

powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%output%'"

:: Confirm success
if exist "%output%" (
    echo.
    echo Download complete: %output%
) else (
    echo.
    echo Download failed.
)

pause
