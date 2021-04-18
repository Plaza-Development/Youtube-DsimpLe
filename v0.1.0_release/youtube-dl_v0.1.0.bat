@ECHO OFF
	REM ______________________=Development Info=______________________
	REM Youtube-DsimpLe
	REM Version 0.1.0
	REM Developed by Joris Van Duyse
	REM A plugin feature for the youtube-dl function to simplify use.
	REM ==============================================================

cd C:\Users\Qwert\Bureaublad\youtube-dl\
goto _downloadscript

:_downloadscript
	SET /p _link= Link: 
	youtube-dl.exe -F %_link%
	SET /p _downloadtype= "File number: 
	youtube-dl.exe -f %_downloadtype% %_link%
	ECHO Donwload Completed
	GOTO _chose
:_chose
	SET /p _continue= Download more (y/n): 

	IF %_continue%==y GOTO _downloadscript
	IF %_continue%==n GOTO _exit
	goto _downloadscript

:_exit
	ECHO Thanks for using the Youtube-DsimpLe function.
	ECHO Any positive or negative feedback is welcome on the githubpage.