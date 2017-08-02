--p_0014_CREATE_TABLE_T004_W3SVC4_JPHSA_Secure_v3.sql
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

IF OBJECT_ID('dbo.T004_W3SVC4_JPHSA_Secure') IS NOT NULL
    DROP TABLE dbo.T004_W3SVC4_JPHSA_Secure

CREATE TABLE [dbo].[T004_W3SVC4_JPHSA_Secure](
	[T004_PK] [int] IDENTITY(1,1) NOT NULL,

	[LogFilename] [varchar](255) NULL,
	[LogRow] [int] NULL,
	[date] [datetime] NULL,
	[time] [datetime] NULL,
	[cIp] [varchar](255) NULL,
	[csUsername] [varchar](255) NULL,
	[sSitename] [varchar](255) NULL,
	[sComputername] [varchar](255) NULL,
	[sIp] [varchar](255) NULL,
	[sPort] [int] NULL,
	[csMethod] [varchar](255) NULL,
	[csUriStem] [varchar](255) NULL,
	[csUriQuery] [varchar](255) NULL,
	[scStatus] [int] NULL,
	[scSubstatus] [int] NULL,
	[scWin32Status] [int] NULL,
	[scBytes] [int] NULL,
	[csBytes] [int] NULL,
	[timeTaken] [int] NULL,
	[csVersion] [varchar](255) NULL,
	[csHost] [varchar](255) NULL,
	[csUserAgent] [varchar](255) NULL,
	[csCookie] [varchar](255) NULL,
	[csReferer] [varchar](255) NULL,
	[sEvent] [varchar](255) NULL,
	[sProcessType] [varchar](255) NULL,
	[sUserTime] [real] NULL,
	[sKernelTime] [real] NULL,
	[sPageFaults] [int] NULL,
	[sTotalProcs] [int] NULL,
	[sActiveProcs] [int] NULL,
	[sStoppedProcs] [int] NULL,



	--[DateTime_Archived] [datetime] NOT NULL CONSTRAINT T004_ARCHIVE_TheDateTime_Default_GETDATE DEFAULT GETDATE(),
	--[ARCHIVE_T004_RowVersion] [timestamp] NULL
	CONSTRAINT [T004_W3SVC4_JPHSA_Secure$T004_PK] PRIMARY KEY NONCLUSTERED 
		(
			[T004_PK] ASC
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


