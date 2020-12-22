@ECHO OFF 
SETLOCAL

REM FUNC SIMPLE
CALL :FuncImprimeInteger

REM FUNC CON PARAMETRO DE ENTRADA
SET txt="Hola mundo"
ECHO %txt%
CALL :FuncImprimeStr %txt%

PAUSE
EXIT

:FuncImprimeInteger
SET /A index=2 
ECHO index = %index% 
EXIT /B 0

:FuncImprimeStr
ECHO %~1
EXIT /B 0

