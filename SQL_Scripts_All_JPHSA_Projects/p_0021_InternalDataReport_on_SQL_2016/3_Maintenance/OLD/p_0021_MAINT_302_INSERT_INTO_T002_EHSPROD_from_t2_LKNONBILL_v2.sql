--p_0021_MAINT_302_INSERT_INTO_T002_EHSPROD_from_t2_LKNONBILL_v2.sql
/*
	************************************************************************************
	NOTE: This takes the data that was uploaded from the Access Database (.mdb), which came from the .csv export file from SQL 2000
			and inserts it into the table with the correct field and field name definitions
	Uses: 
	Created: 03/1/2017
	By: glenn garson
	************************************************************************************
*/
USE [Success]
GO

INSERT INTO [Success].[dbo].[T002_NonBillServices_for_IDR_LOOKUP]
	(
		[Encounter_Reasons],	-- [nvarchar](50) NULL,
		[NB]	-- [nvarchar](1) NULL,
	)
SELECT 
	[Encounter Reasons],
	[NB]
FROM [Success].[dbo].[t2_LKNONBILL]
GO