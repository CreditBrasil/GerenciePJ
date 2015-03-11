REM CommandInterpreter: cmd.exe
@echo off
echo Gerando arquivos .RC
call "%gitcmd%\git" rev-list HEAD --count > Debug\UltimaRevisaoGit.txt
call "%gitcmd%\git" rev-parse HEAD >> Debug\UltimaRevisaoGit.txt
wscript bin\VersionInfo.wsf

echo.
echo Compilando arquivo VersionInfoFactor.rc
brcc32 ..\VersionInfoFactor.rc

echo.
echo Compilando arquivo VersionInfoSecuritizacao.rc
brcc32 ..\VersionInfoSecuritizacao.rc

echo.
echo Compilando arquivo VersionInfoSecuritizacaoFIDC.rc
brcc32 ..\VersionInfoSecuritizacaoFIDC.rc

echo.
echo Compilando arquivo VersionInfoConsultoriaFIDC.rc
brcc32 ..\VersionInfoConsultoriaFIDC.rc

echo.
echo Compilando arquivo VersionInfoFIDC.rc
brcc32 ..\VersionInfoFIDC.rc

echo.
echo Compilando arquivo VersionInfoRecebiveis.rc
brcc32 ..\VersionInfoRecebiveis.rc
