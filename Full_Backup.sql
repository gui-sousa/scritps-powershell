use lansweeperdb
go
EXECUTE dbo.DatabaseBackup
@Databases = 'USER_DATABASES',
@Directory = 'C:\Backup',
@BackupType = 'FULL',
@Compress = 'N',
@CheckSum = 'Y',
@NumberOfFiles = 8,
@MinBackupSizeForMultipleFiles = 10240