@ECHO OFF
:: Dette program er et midlertidigt fix til røde krydser på billeder i Outlook
TITLE Outlook fix

:: Tjekker om outlook kører før vi nulstiller IE indstillinger
SETLOCAL EnableExtensions
set EXE=OUTLOOK.EXE
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto NOTIFY

ECHO ============================
ECHO Fjerner IE Cache
ECHO ============================
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351

ECHO Nulstiller IE indstillinger til standard
ECHO ============================
RunDll32.exe InetCpl.cpl,ResetIEtoDefaults

ECHO Faerdig
ECHO ============================
GOTO DONE

:NOTIFY
ECHO Luk venligst OUTLOOK ned foerst

:DONE
PAUSE