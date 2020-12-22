@ECHO OFF 
setlocal EnableDelayedExpansion

if not exist "FOLDER\TEST" (
  mkdir "FOLDER\TEST"
  if "!errorlevel!" EQU "0" (
    echo Folder created successfully
  ) else (
    echo Error while creating folder
  )
) else (
  echo Folder already exists
)

pause
exit