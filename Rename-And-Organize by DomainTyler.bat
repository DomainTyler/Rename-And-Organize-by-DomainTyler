@echo off
title Rename And Organize by DomainTyler

:: Clear screen and display banner
cls
echo ===================================================
echo              Rename And Organize by DomainTyler
echo ===================================================
echo.

setlocal enabledelayedexpansion

:: Prompt user for folder
set /p "folder=Enter the full path to the folder: "
set "folder=%folder:"=%"

if not exist "%folder%" (
    echo.
    echo Folder does not exist.
    pause
    exit /b
)

cd /d "%folder%"

:: Count total files
set /a totalFiles=0
for %%F in (*.*) do set /a totalFiles+=1

if %totalFiles%==0 (
    echo No files found in the folder.
    pause
    exit /b
)

echo Found %totalFiles% file(s) to process.
echo.

:: Initialize counter
set /a fileCount=0

for %%F in (*.*) do (
    set /a fileCount+=1
    set "filepath=%%~fF"
    set "filename=%%~nxF"

    :: Get creation date/time parts from PowerShell
    for /f "delims=" %%D in ('powershell -NoLogo -NoProfile -Command ^
      "(Get-Item -LiteralPath '%%~fF').CreationTime.ToString('dddd MMMM dd yyyy hh-mm tt')"') do (
        set "fullDateTime=%%D"
    )

    :: Extract folder name: "Thursday May 15 2025"
    for /f "tokens=1-4" %%a in ("!fullDateTime!") do (
        set "folderName=%%a %%b %%c %%d"
    )

    :: Ensure folder exists
    if not exist "!folderName!" mkdir "!folderName!"

    :: Build new filename (same as fullDateTime + original extension)
    set "newname=!fullDateTime!%%~xF"

    :: Check for name conflict and add counter if needed
    set "targetPath=!folderName!\!newname!"
    set /a count=1
    :checkexists
    if exist "!targetPath!" (
        set "targetPath=!folderName!\!fullDateTime!_!count!%%~xF"
        set /a count+=1
        goto checkexists
    )

    echo Processing file !fileCount! of %totalFiles%:
    echo   Original: %%F
    echo   Moving to: !targetPath!
    echo.

    move "%%F" "!targetPath!" >nul
)

echo ===================================================
echo All %totalFiles% file(s) have been sorted successfully.
echo ===================================================
pause
