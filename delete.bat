@echo off
echo Welcome to the Deleter!!! 

echo  I will not be responsible for any data loss! Use at your own risk.
choice /c YN /m "Press Y to continue and N to close"

if errorlevel 2 (
    echo Cancelled. Exiting...
    timeout /t 2 /nobreak > NUL
    exit /b
)

cls

echo Chrome will be force shutdown. Please save your files or tasks. You have infinite time to save, then press Y to continue
choice /c YN /m "Press Y to continue and N to close"

if errorlevel 2 (
    echo Cancelled. Exiting...
    timeout /t 2 /nobreak > NUL
    exit /b
)

taskkill /f /im chrome.exe > NUL 2>&1

cls

cd /d "%localappdata%\Google\Chrome\User Data\OptGuideOnDeviceModel\"

for /d %%a in (*) do cd "%%a"

if exist "weights.bin" del /f /q "weights.bin"

echo. > "weights.txt"

ren "weights.txt" "weights.bin"

attrib +r "weights.bin"

echo Done! Right now, it is deleted and write only. Now you only need to go to chrome and disable the flags.
timeout /t 5 /nobreak > NUL
echo To do this, open chrome (which i will open) then type "chrome://flags" and then find "Enables optimization guide on device"  (i copy and paste to your clipboard ) and set it to disabled.
timeout /t 5 /nobreak > NUL
start chrome
echo now type "chrome://flags"
timeout /t 3 /nobreak > NUL
echo now in the search bar copy paste the word, and disable that feature and restart chrome.
echo Enables optimization guide on device | clip
pause