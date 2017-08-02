--p_0010_MAINT_103_Append_records_into_T009_G_Drive_Permissions_ARCHIVE.sql
/*
	************************************************************************************
	NOTE: The table was created by: p_0010_MAINT_102_SELECT_INTO_T009_G_Drive_Permissions_ARCHIVE
		  This script then appends records to it.
	Uses: 
	Created: 7/26/17
	By: glenn garson
	************************************************************************************
*/


use d1_IT
go

INSERT INTO T009_G_Drive_Permissions_ARCHIVE
	(
		[DataSource]
		,[User]
		,[Access]
		,[Folder]
	)
SELECT 
	 'G_Drive_2017_07_26' as [DataSource]
	  ,[User]
      ,[Access]
      ,[Folder]
  FROM [d1_IT].[dbo].[zzz_G_Drive_2017_07_26]
