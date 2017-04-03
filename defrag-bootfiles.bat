@echo off
pushd "%~dp0"
cls
echo Diese Batch-Datei muss mit administrativen Rechten ausgefuehrt werden
echo um fehlerfrei zu funktionieren. Die Batch-Datei ueberprueft die Rechte
echo nicht selbst.
echo.
echo Der Prozess zum Defragmentieren der Boot-Dateien kann im Extremfall
echo mehrere Stunden dauern.
echo.
CHOICE /C JN /N /M "Fortfahren? (J/N)"
IF ERRORLEVEL 2 goto :end

echo Schritt 1/3: Prefetch-Dateien loeschen
del %systemroot%\prefetch\*.* /q /f 


echo Schritt 2/3: ProcessIdleTasks ausfuehren (10x)
echo    Lauf 1
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks 
echo    Lauf 2
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks 
echo    Lauf 3
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks 
echo    Lauf 4
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks 
echo    Lauf 5
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks 
echo    Lauf 6
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks 
echo    Lauf 7
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks 
echo    Lauf 8
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks 
echo    Lauf 9
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks 
echo    Lauf 10
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks 


echo Schritt 3/3: Boot-Dateien defragmentieren (5x)
echo    Lauf 1
defrag %systemdrive% -b 
echo    Lauf 2
defrag %systemdrive% -b 
echo    Lauf 3
defrag %systemdrive% -b 
echo    Lauf 4
defrag %systemdrive% -b
echo    Lauf 5
defrag %systemdrive% -b


:end