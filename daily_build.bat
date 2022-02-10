SETLOCAL EnableDelayedExpansion

:: Get the current date & time and format it for the log filename
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

(
	echo =============================================================================================================================
	echo Starting build ^(!date! !time!^)
	echo =============================================================================================================================
	cd "%userprofile%\Desktop\godot source"
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo Fetch upstream ^(!date! !time!^)
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	git fetch upstream
	timeout /t 5 /nobreak 1>NUL
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo Pull upstream master ^(!date! !time!^)
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	git pull upstream master
	timeout /t 20 /nobreak 1>NUL
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo Scons build ^(!date! !time!^)
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	scons profile=build_editor_default.py
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo Sync to github ^(!date! !time!^)
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	git push
	echo =============================================================================================================================
	echo Build completed ^(!date! !time!^)
	echo =============================================================================================================================
) >> "build logs/build_%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%.log" 2>&1
