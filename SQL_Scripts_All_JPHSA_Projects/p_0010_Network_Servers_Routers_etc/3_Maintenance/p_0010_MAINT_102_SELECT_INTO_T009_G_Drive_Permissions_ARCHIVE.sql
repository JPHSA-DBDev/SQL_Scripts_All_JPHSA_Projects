--p_0010_MAINT_102_SELECT_INTO_T009_G_Drive_Permissions_ARCHIVE.sql
/*
	************************************************************************************
	NOTE: This is the first one, so it creates the table
	Uses: 
	Created: 7/26/17
	By: glenn garson
	************************************************************************************
*/


use d1_IT
go

--INSERT INTO T009_G_Drive_Permissions_ARCHIVE (
--	  [DataSource] 												--<== Already existing table
--	  ,[User]
--      ,[Access]
--      ,[Folder]
							  --)
SELECT  
	  'G_Drive_2017_07_06' as [DataSource]
	  ,[User]
      ,[Access]
      ,[Folder]
INTO T009_G_Drive_Permissions_ARCHIVE
FROM [d1_IT].[dbo].[zzz_G_Drive_2017_07_06]
go