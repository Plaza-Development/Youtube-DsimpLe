@ECHO OFF
	REM ______________________=Development Info=______________________
	REM Youtube-DsimpLe
	REM Version 0.2.0
	REM Developed by Joris Van Duyse
	REM A plugin feature for the youtube-dl function to simplify use.
	REM ==============================================================

GOTO _settings

:_settings
	REM This is the settings tab, any possible changes in source can
	REM occure here by the end user. (or else if you are that stubborn)
	
	ECHO Settings
	ECHO -------------------------------
	SET _verbose=False
	ECHO Verbose mode %_verbose%
	
	SET _namingscheme=Default
	
	SET _dldirectory=""

	SET _dlhistory=True
	ECHO -------------------------------
	
	ECHO Settings can be predefined and configuered in the Youtube-DsimpLe.bat file.
	TIMEOUT /t 5
	GOTO _startupbuild

:_startupbuild
	REM checks that the program runs, looking over predefined settings.

	IF %_verbose%==True (
		@ECHO ON
		ECHO Verbose mode %_verbose%
	)
	REM ______________________=Work In Progress=______________________
	REM	IF %_namingscheme%==Default
	REM		SET _defaultNamingScheme=%(title)ss-%(id)s.%(ext)s
	REM
	REM	IF DEFINED %_dldirectory%  (
	REM		youtube-dl.exe -o %CD%\Complete\%_defaultNamingScheme%
	REM	)
	REM ==============================================================
	
	GOTO _downloadscript

:_downloadscript
	REM The main download script that runs the bulk of the functionality of this code.

	SET /p _link= Link: 
	youtube-dl.exe -F %_link%
	SET /p _downloadtype= "File number: 
	youtube-dl.exe -f %_downloadtype% %_link%
	IF %_dlhistory%==True (
		ECHO Download type: %_downloadtype% Download link: %_link%> Youtube-DsimpLe-history.txt
	)
	ECHO Donwload Completed
	GOTO _chose

:_chose
	REM Chose script that allows the end user to keep downloading other files or leave the software.
	
	SET /p _continue= Download more (y/n): 

	IF %_continue%==y GOTO _downloadscript
	IF %_continue%==n GOTO _exit
	goto _downloadscript

:_exit
	ECHO ----------------------------------------------------------------
	ECHO Thanks for using the Youtube-DsimpLe function.
	ECHO Any positive or negative feedback is welcome on the github page.
	ECHO ----------------------------------------------------------------
	TIMEOUT /t 30