--p_0021_MAINT_301_INSERT_INTO_T001_EHSPROD_from_t1_EHSPROD.sql
/*
	************************************************************************************

			
	Uses: 
	Created: 03/1/2017
	By: glenn garson
	************************************************************************************
*/
USE [Success]
GO

INSERT INTO [Success].[dbo].[T001_EHSPROD]
	(

		[Providername],		-- [nvarchar](100) NULL,
		[Location],		-- [nvarchar](2) NULL,
		[Type],		-- [nvarchar](2) NULL,
		[Other]		-- [nvarchar](10) NULL,
	)
SELECT 
      [Providername]
      ,[Location]
      ,[Type]
      ,[Other]
FROM [Success].[dbo].[t1_EHSPROD]
GO