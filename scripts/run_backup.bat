cd/


@echo on -------------Add file path----------------------------
set fileroot=C:\SQLDB_Backup
set rarfilepath=C:\Program Files (x86)\WinRAR
set backupto=C:\Users\Administrator\Dropbox



cd %fileroot%\Backup\Temp\
del *.bak
del bak_filename.txt


@echo on -------------Add sql query----------------------------
sqlcmd -S DESKTOP-HCGHU5P\SQLEXPRESS -U sp -P 1234 -i %fileroot%\sql_queries\query_backup.sql -o %fileroot%\sql_queries\report.txt


path=%rarfilepath%



@echo off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)
echo %mydate%_%mytime%


DIR /B /ON *.bak > bak_filename.txt

set /p filename=<bak_filename.txt

rar a -r  %backupto%\%filename%.rar *.bak


del *.bak
del bak_filename.txt

exit
