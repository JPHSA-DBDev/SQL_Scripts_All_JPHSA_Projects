--p_0021_MAINT_302_INSERT_INTO_T002_EHSPROD_from_t2_LKNONBILL.sql
/*
	************************************************************************************
	NOTE: This takes the data that was uploaded from the Access Database (.mdb), which came from the .csv export file from SQL 2000
			and inserts it into the table with the correct field and field name definitions
	Uses: 
	Created: 03/1/2017
	By: glenn garson
	************************************************************************************
*/
USE [d1_Success]
GO

INSERT INTO [d1_Success].[dbo].[T002_LKNONBILL]
	(
		[Encounter_Reasons],	-- [nvarchar](50) NULL,
		[NB]	-- [nvarchar](1) NULL,
	)
SELECT 
	[Encounter Reasons],
	[NB]
FROM [d1_Success].[dbo].[t2_LKNONBILL]
GO