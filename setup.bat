@echo off

echo • | Welcome to the Unifier Instant Setup script!
echo • | Hang tight while we install some things.

echo • | Creating folder for the bot. This can be moved if needed.
set "main=%USERPROFILE%\unifierbot"
mkdir "%main%"

echo • | Downloading Unifier files.
git clone https://github.com/UnifierHQ/unifier "%main%"

echo • | Finishing things up.
rmdir /s /q "%temp%"  :: Make sure you DO NOT set this to "%USERPROFILE%", scary....

echo • | Here's a brief tutorial on how to start Unifier etc.
echo ◦ | The script to start Unifier is in: %USERPROFILE%\unifierbot\run.bat
echo ◦ | More info on how to use Unifier is in the wiki: https://wiki.unifierhq.org
pause
