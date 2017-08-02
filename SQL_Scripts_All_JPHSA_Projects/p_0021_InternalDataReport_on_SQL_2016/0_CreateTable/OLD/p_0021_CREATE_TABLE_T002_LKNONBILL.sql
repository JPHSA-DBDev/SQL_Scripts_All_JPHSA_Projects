--p_0021_CREATE_TABLE_T002_LKNONBILL.sql
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

IF OBJECT_ID('dbo.T002_LKNONBILL') IS NOT NULL
    DROP TABLE dbo.T002_LKNONBILL

go

CREATE TABLE [dbo].[T002_LKNONBILL]
(
		[T002_PK] [int] IDENTITY(1,1) NOT NULL,
		[Encounter_Reasons] [nvarchar](50) NULL,
		[NB] [nvarchar](1) NULL,
		[T002_RowVersion] [timestamp] NULL
	,CONSTRAINT [T002_LKNONBILL$T002_PK] PRIMARY KEY NONCLUSTERED 
		(
			[T002_PK] ASC
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