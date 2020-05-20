declare @dbname varchar(50) ='database1'
declare @dbfilename varchar(50)
declare @dbfilepostfix varchar(50)= replace(CAST(getdate() AS date),':','_')
+'_'+replace(replace(CAST(CONVERT (time, GETDATE())  AS varchar(50)),':','_'),'.','-')

select @dbfilepostfix

declare @dbfilepath varchar(500) ='C:\SQLDB_Backup\Backup\Temp\'+@dbname+'_'+@dbfilepostfix+'.BAK'
select 'Database Backup Saved As '+@dbfilepath
 
BACKUP DATABASE @dbname
TO
DISK =@dbfilepath

go