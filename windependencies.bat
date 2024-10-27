@echo off
setlocal

echo Installing Git and Curl...

REM Function to show download progress
set "progress_script=powershell -Command "$progress = [System.Progress]::new(); $progress.Maximum = 100; while ($progress.Value -lt $progress.Maximum) { Write-Progress -Activity 'Downloading' -Status 'In Progress' -PercentComplete $progress.Value; Start-Sleep -Milliseconds 200; $progress.Increment(5) }""

REM Install Git
echo Checking for Git installation...
git --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Git is not installed. Downloading and installing Git...
    %progress_script%
    powershell -Command "Invoke-WebRequest -Uri 'https://github.com/git-for-windows/git/releases/latest/download/Git-2.41.0-64-bit.exe' -OutFile '%TEMP%\GitInstaller.exe'"
    start /wait %TEMP%\GitInstaller.exe /VERYSILENT /NORESTART
    del %TEMP%\GitInstaller.exe
) else (
    echo Git is already installed.
)

REM Install Curl
echo Checking for Curl installation...
curl --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Curl is not installed. Downloading and installing Curl...
    %progress_script%
    powershell -Command "Invoke-WebRequest -Uri 'https://curl.se/windows/dl-7.85.0/curl-7.85.0-win64-mingw.zip' -OutFile '%TEMP%\CurlInstaller.zip'"
    powershell -Command "Expand-Archive -Path '%TEMP%\CurlInstaller.zip' -DestinationPath 'C:\Program Files\Curl' -Force"
    setx PATH "%PATH%;C:\Program Files\Curl\curl-7.85.0-win64-mingw\bin"
    del %TEMP%\CurlInstaller.zip
) else (
    echo Curl is already installed.
)

echo Installation complete.
endlocal
pause
