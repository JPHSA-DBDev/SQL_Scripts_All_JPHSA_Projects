--p_0010_CREATE_T001_Servers.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 1/31/17
	By: glenn garson
	************************************************************************************
*/


USE [d1_IT]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



IF OBJECT_ID('dbo.T001_Servers') IS NOT NULL
    DROP TABLE dbo.T001_Servers


CREATE TABLE [dbo].[T001_Servers](
	[T001_PK] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[IP_1] [nvarchar](255) NULL,
	[IP_2] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Roles_and_Functions] [nvarchar](max) NULL,
	[Service_tag] [nvarchar](255) NULL,
	[Install_Date] [datetime] NULL,
	[JPHSA_Tag] [nvarchar](255) NULL,
	[OS] [nvarchar](255) NULL,
	[BIOS SerialNumber] [nvarchar](255) NULL,
	[Old_Purchase_Notes] [nvarchar](255) NULL,
	[T001_RowVersion] [timestamp] NULL,
 CONSTRAINT [T001$T001_PK] PRIMARY KEY CLUSTERED
(
	[T001_PK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO