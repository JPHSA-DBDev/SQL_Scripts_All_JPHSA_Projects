-- p_0004_MAINT_304_Backup_Job_M_W_F.sql
-- This overwrites the .bak files with a similar name
-- These are the steps of the job: Backup_Job_M_W_F

-- WAREHOUSE Instance =======================================================================================

BACKUP DATABASE [d1_Success] TO DISK = N'F:\Local_Backup\WAREHOUSE\ScheduledBackups\d1_Success_M_W_F.bak' WITH FORMAT, INIT, NAME = N'd1_Success-Full Database Backup (M_W_F)',
NOREWIND, SKIP, NOUNLOAD,  COMPRESSION, STATS = 10
GO

-- PROD Instance =======================================================================================

BACKUP DATABASE [d1_IT] TO DISK = N'F:\Local_Backup\PROD\ScheduledBackups\d1_IT_M_W_F.bak' WITH FORMAT, INIT, NAME = N'd1_IT-Full Database Backup (M_W_F)',
NOREWIND, SKIP, NOUNLOAD,  COMPRESSION, STATS = 10
GO


BACKUP DATABASE [d2_SysAid] TO DISK = N'F:\Local_Backup\PROD\ScheduledBackups\d2_SysAid_M_W_F.bak' WITH FORMAT, INIT, NAME = N'd2_SysAid-Full Database Backup (M_W_F)',
NOREWIND, SKIP, NOUNLOAD,  COMPRESSION, STATS = 10
GO


BACKUP DATABASE [d3_JPHSA_All_Users] TO DISK = N'F:\Local_Backup\PROD\ScheduledBackups\d3_JPHSA_All_Users_M_W_F.bak' WITH FORMAT, INIT, NAME = N'd3_JPHSA_All_Users-Full Database Backup (M_W_F)',
NOREWIND, SKIP, NOUNLOAD,  COMPRESSION, STATS = 10
GO