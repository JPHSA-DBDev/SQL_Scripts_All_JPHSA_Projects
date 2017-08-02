-- p_0004_MAINT_305_Backup_Job_T_TH_S.sql
-- This overwrites the .bak files with a similar name
-- These are the steps of the job: Backup_Job_T_TH_S

-- WAREHOUSE Instance =======================================================================================

BACKUP DATABASE [d1_Success] TO DISK = N'F:\Local_Backup\WAREHOUSE\ScheduledBackups\d1_Success_T_TH_S.bak' WITH FORMAT, INIT, NAME = N'd1_Success-Full Database Backup (T_TH_S)',
NOREWIND, SKIP, NOUNLOAD,  COMPRESSION, STATS = 10
GO

-- PROD Instance =======================================================================================

BACKUP DATABASE [d1_IT] TO DISK = N'F:\Local_Backup\PROD\ScheduledBackups\d1_IT_T_TH_S.bak' WITH FORMAT, INIT, NAME = N'd1_IT-Full Database Backup (T_TH_S)',
NOREWIND, SKIP, NOUNLOAD,  COMPRESSION, STATS = 10
GO


BACKUP DATABASE [d2_SysAid] TO DISK = N'F:\Local_Backup\PROD\ScheduledBackups\d2_SysAid_T_TH_S.bak' WITH FORMAT, INIT, NAME = N'd2_SysAid-Full Database Backup (T_TH_S)',
NOREWIND, SKIP, NOUNLOAD,  COMPRESSION, STATS = 10
GO


BACKUP DATABASE [d3_JPHSA_All_Users] TO DISK = N'F:\Local_Backup\PROD\ScheduledBackups\d3_JPHSA_All_Users_T_TH_S.bak' WITH FORMAT, INIT, NAME = N'd3_JPHSA_All_Users-Full Database Backup (T_TH_S)',
NOREWIND, SKIP, NOUNLOAD,  COMPRESSION, STATS = 10
GO