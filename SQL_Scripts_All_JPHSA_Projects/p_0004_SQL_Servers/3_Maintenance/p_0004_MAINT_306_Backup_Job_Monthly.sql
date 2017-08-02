-- p_0004_MAINT_306_Backup_Job_Monthly.sql
-- This overwrites the .bak files with a similar name
-- These are the steps of the job: Backup_Job_Monthly


-- WAREHOUSE Instance =======================================================================================

BACKUP DATABASE [d1_Success] TO DISK = N'F:\Local_Backup\WAREHOUSE\ScheduledBackups\d1_Success_Monthly.bak' WITH FORMAT, INIT, NAME = N'd1_Success-Full Database Backup (Monthly)',
NOREWIND, SKIP, NOUNLOAD,  COMPRESSION, STATS = 10
GO

-- PROD Instance =======================================================================================

BACKUP DATABASE [d1_IT] TO DISK = N'F:\Local_Backup\PROD\ScheduledBackups\d1_IT_Monthly.bak' WITH FORMAT, INIT, NAME = N'd1_IT-Full Database Backup (Monthly)',
NOREWIND, SKIP, NOUNLOAD,  COMPRESSION, STATS = 10
GO


BACKUP DATABASE [d2_SysAid] TO DISK = N'F:\Local_Backup\PROD\ScheduledBackups\d2_SysAid_Monthly.bak' WITH FORMAT, INIT, NAME = N'd2_SysAid-Full Database Backup (Monthly)',
NOREWIND, SKIP, NOUNLOAD,  COMPRESSION, STATS = 10
GO


BACKUP DATABASE [d3_JPHSA_All_Users] TO DISK = N'F:\Local_Backup\PROD\ScheduledBackups\d3_JPHSA_All_Users_Monthly.bak' WITH FORMAT, INIT, NAME = N'd3_JPHSA_All_Users-Full Database Backup (Monthly)',
NOREWIND, SKIP, NOUNLOAD,  COMPRESSION, STATS = 10
GO