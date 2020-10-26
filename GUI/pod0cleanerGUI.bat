rem =================================================================================================
rem = Sorry for my shitcoding and my English... This is my first program, and yea... batch language =
rem =================================================================================================

mode 96,30>nul
@ECHO OFF>nul
@title p0dcleaner - by Amir Bekov
@chcp 866
cls
@COLOR 0b
:ask
cls
REM Admin perms check
NET SESSION >nul 2>&1
	IF %ERRORLEVEL% EQU 0 (goto ask1) else (goto errNoAdmin)
:ask1
cls
Batbox /h 0

:Loop
Call Button  41 8 "Cleaner" 38 12 "Secret Folder" 42 16 "Exit" # Press
Getinput /m %Press% /h 50

:: Check for the pressed button 
if %errorlevel%==1 (goto da)
if %errorlevel%==2 (goto hider)
if %errorlevel%==3 (exit)
goto Loop
:da	
cls
title p0dcleaner - Cleaning...
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                           Cleaning...
REM I think there are all windows history directories...
    (
	FOR /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
	REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /va /f
	REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f
	REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\BagMRU" /f
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Bags" /f
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /va /f
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\FirstFolder" /va /f
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /va /f
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRULegacy" /va /f
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f
	REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU"
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f
	REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist"
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\AppCompatCache" /va /f
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\AppCompatCache" /va /f
	REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications" /f
	REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications" /f
	REG DELETE "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Search\RecentApps" /f
	REG ADD "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Search\RecentApps" /f
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bam\UserSettings\%usersid%" /va /f
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\UserSettings\%usersid%" /va /f
	REG DELETE "HKEY_USERS\%usersid%\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /va /f
	REG DELETE  "HKEY_USERS\%usersid%\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /va /f
	REG DELETE "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /f
	REG ADD "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /f
	DEL /f /q %APPDATA%\Microsoft\Windows\Recent\*.*
	DEL /f /q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*.*
	DEL /f /q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*.*
	DEL /f /q %systemroot%\Panther\*.*
	DEL /f /q %systemroot%\appcompat\Programs\*.txt
	DEL /f /q %systemroot%\appcompat\Programs\*.xml
	DEL /f /q %systemroot%\appcompat\Programs\Install\*.txt
	DEL /f /q %systemroot%\appcompat\Programs\Install\*.xml
	DEL /f /q %systemroot%\Prefetch\*.pf
	DEL /f /q %systemroot%\Prefetch\*.ini
	DEL /f /q %systemroot%\Prefetch\*.7db
	DEL /f /q %systemroot%\Prefetch\*.ebd
	DEL /f /q %systemroot%\Prefetch\*.bin
	DEL /f /q %systemroot%\Prefetch\*.db
	DEL /f /q %systemroot%\Prefetch\ReadyBoot\*.fx
	DEL /f /q %systemroot%\Minidump\*.*
	cls
	)>nul 2>&1
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                             Done
PAUSE>nul
goto ask
:hider
title p0dcleaner - Secret Folder
cls
(
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 0 /f
)>nul 2>&1
@if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
@if NOT EXIST Secret goto MDPrivate
:CONFIRM2
cls
Batbox /h 0

:Loop2
set %errorlevel% = 0
Call Button  39 8 "Hide Folder" 39 12 "Show Folder" 42 16 "Exit" # Press
Getinput /m %Press% /h 50

:: Check for the pressed button 
if %errorlevel%==1 (goto lock)
if %errorlevel%==2 (goto unlock)
if %errorlevel%==3 (goto ask1)
goto Loop
:LOCK
(
ren Secret "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
)>nul 2>&1
echo                                    Folder was hidden.
goto CONFIRM2
:UNLOCK
cls
echo                                      Enter password:
set/p "pass=>"
if NOT %pass%==topsecret goto FAIL
@attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
@ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Secret
cls
echo                             PASSWORD IS CORRECT! Folder was showed
pause>nul
cls
goto Loop2
:FAIL
echo                     PASSWORD IS INCORRECT! Folder wasn't showed, try again...
pause>nul
goto unlock
:MDPrivate
md Secret
goto CONFIRM2
:do_clear
cls
@ECHO OFF
ECHO Clearing the log. %1
wevtutil.exe cl %1
GOTO :eof
:errNoAdmin
title !!!!!!!!!!!!!!!ERROR!!!!!!!!!!!!!!!
cls
COLOR 4
ECHO                         You need to run the program as administrator.
ECHO.
PAUSE
exit