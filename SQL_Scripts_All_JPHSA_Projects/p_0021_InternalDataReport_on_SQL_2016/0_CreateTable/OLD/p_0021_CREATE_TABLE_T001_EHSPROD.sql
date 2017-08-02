--p_0021_CREATE_TABLE_T001_EHSPROD.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 03/1/2017
	By: glenn garson
	************************************************************************************
*/
USE [d1_Success]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.T001_EHSPROD') IS NOT NULL
    DROP TABLE dbo.T001_EHSPROD

go

CREATE TABLE [dbo].[T001_EHSPROD]
(
		[T001_PK] [int] IDENTITY(1,1) NOT NULL,
		[Providername] [nvarchar](100) NULL,
		[Location] [nvarchar](2) NULL,
		[Type] [nvarchar](2) NULL,
		[Other] [nvarchar](10) NULL,
		[T001_RowVersion] [timestamp] NULL
	,CONSTRAINT [T001_EHSPROD$T001_PK] PRIMARY KEY NONCLUSTERED 
		(
			[T001_PK] ASC
		)
		WITH 
				(
					PAD_INDEX  = OFF, 
					STATISTICS_NORECOMPUTE  = OFF, 
					IGNORE_DUP_KEY = OFF, 
					ALLOW_ROW_LOCKS  = ON, 
					ALLOW_PAGE_LOCKS  = ON
				) ON [PRIMARY]

)