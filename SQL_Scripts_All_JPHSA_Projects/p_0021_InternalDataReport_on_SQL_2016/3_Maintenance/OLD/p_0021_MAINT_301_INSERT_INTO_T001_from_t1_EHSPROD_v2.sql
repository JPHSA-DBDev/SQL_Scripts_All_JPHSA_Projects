--p_0021_MAINT_301_INSERT_INTO_T001_from_t1_EHSPROD_v2.sql
/*
	************************************************************************************

			
	Uses: 
	Created: 03/1/2017
	By: glenn garson
	************************************************************************************
*/
USE [Success]
GO

INSERT INTO [Success].[dbo].[T001_Provider_Information_IDR]
	(

		[Providername],		-- [nvarchar](100) NULL,
		[Location],		-- [nvarchar](2) NULL,
		[Type],		-- [nvarchar](2) NULL,
		[Other]		-- [nvarchar](10) NULL,
	)
SELECT 

      substring(ltrim(rtrim([Providername])),1,100) as [Providername]
      ,substring(ltrim(rtrim([Location])),1,2) as [Location]
      ,substring(ltrim(rtrim([Type])),1,2) as [Type]
      ,substring(ltrim(rtrim([Other])),1,10) as [Other]
FROM [Success].[dbo].[t1_EHSPROD]
GO