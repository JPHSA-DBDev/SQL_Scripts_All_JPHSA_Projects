--p_0014_CREATE_TABLE_T005_W3SVC5_LOCUS_v0.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 03/22/2017
	By: glenn garson
	************************************************************************************
*/

USE [d4_IIS_Logs]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.T005_W3SVC5_LOCUS') IS NOT NULL
    DROP TABLE dbo.T005_W3SVC5_LOCUS

CREATE TABLE [dbo].[T005_W3SVC5_LOCUS](
	[T005_PK] [int] IDENTITY(1,1) NOT NULL,
	[LogFilename] [varchar](255) NULL,
	[RowNumber] [int] NULL,
	[date] [datetime] NULL,
	[time] [datetime] NULL,
	[sIp] [varchar](255) NULL,
	[csMethod] [varchar](255) NULL,
	[csUriStem] [varchar](255) NULL,
	[csUriQuery] [varchar](255) NULL,
	[sPort] [int] NULL,
	[csUsername] [varchar](255) NULL,
	[cIp] [varchar](255) NULL,
	[csUserAgent] [varchar](255) NULL,
	[csReferer] [varchar](255) NULL,
	[scStatus] [int] NULL,
	[scSubstatus] [int] NULL,
	[scWin32Status] [int] NULL,
	[timeTaken] [int] NULL,
	[DateTime_Archived] [datetime] NOT NULL CONSTRAINT T005_ARCHIVE_TheDateTime_Default_GETDATE DEFAULT GETDATE(),
	[ARCHIVE_T005_RowVersion] [timestamp] NULL
	,CONSTRAINT [T005_W3SVC5_LOCUS$T005_PK] PRIMARY KEY NONCLUSTERED 
		(
			[T005_PK] ASC
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

GO


