--p_0021_CREATE_TABLE_T002_NonBillServices_for_IDR_LOOKUP_v2.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 03/1/2017
	By: glenn garson
	************************************************************************************
*/
USE [Success]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.T002_NonBillServices_for_IDR_LOOKUP') IS NOT NULL
    DROP TABLE dbo.T002_NonBillServices_for_IDR_LOOKUP

go

CREATE TABLE [dbo].[T002_NonBillServices_for_IDR_LOOKUP]
(
		[T002_PK] [int] IDENTITY(1,1) NOT NULL,
		[Encounter_Reasons] [nvarchar](50) NULL,
		[NB] [nvarchar](1) NULL,
		[T002_RowVersion] [timestamp] NULL
	,CONSTRAINT [T002_NonBillServices_for_IDR_LOOKUP$T002_PK] PRIMARY KEY NONCLUSTERED 
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