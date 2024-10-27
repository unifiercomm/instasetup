@echo off
cls

for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"&goto :SetEsc
:SetEsc
set "<=%ESC%["
set ">=%ESC%[0m"

set "Green=32m"
set "Gray=90m"
set "Reset=0m"

:mainMenu
cls
echo %<%%Green%==========================================
echo =     Welcome to the Unifier Setup!      =
echo ==========================================%>%
echo.
echo Select an option:
echo 1. Install
echo 2. Remove
echo 3. Exit

set /p "choice=Enter your choice (1-3): "

if "%choice%"=="1" goto :install
if "%choice%"=="2" goto :remove
if "%choice%"=="3" exit

goto :mainMenu

:install
cls
set "main=%USERPROFILE%\unifierbot"
if exist "%main%\*" (
    echo %<%%Gray%The installation is already set up!%>%
    pause
    goto :mainMenu
)

echo %<%%Green%Beginning installation...%>%
mkdir "%main%"
git clone https://github.com/UnifierHQ/unifier "%main%"
echo Installation complete.
pause
exit

:remove
cls
set "main=%USERPROFILE%\unifierbot"
if not exist "%main%\*" (
    echo %<%%Gray%The unifierbot preset directory has no files in it!%>%
    pause
    goto :mainMenu
)

echo Removing installation...
rd /s /q "%main%"
set "tempDir=%temp%"
if exist "%tempDir%" (
    for /d %%i in ("%tempDir%\*") do (
        rd /s /q "%%i" >nul 2>&1
    )
    for %%i in ("%tempDir%\*") do (
        del /f /q "%%i" >nul 2>&1
    )
)
echo Removal complete.
pause
exit
