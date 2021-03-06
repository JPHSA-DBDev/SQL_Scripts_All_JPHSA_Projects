--p_0021_CREATE_TABLE_ARCHIVE_T004_NON_Billable_Service.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 03/14/2017
	By: glenn garson
	************************************************************************************
*/
USE [Success]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.ARCHIVE_T004_NON_Billable_Service') IS NOT NULL
    DROP TABLE dbo.ARCHIVE_T004_NON_Billable_Service

go

CREATE TABLE [dbo].[ARCHIVE_T004_NON_Billable_Service]
(
		[ARCHIVE_T004_PK] [int] IDENTITY(1,1) NOT NULL,

		[Location] [nvarchar](50) NULL,
		[Date_Encounter] [date] NULL,
		[Patient_No__Chart] [Int] NULL,
		[Patient_Birth_Date__Chart] [date] NULL,
		[Examining_Clinician] [nvarchar](100) NULL,
		[Chp_Encounter_Id] [bigint] NULL,
		[Billable_Encounter_ID] [nvarchar](25) NULL,
		[Reason_for_Encounter] [nvarchar](255) NULL,
		[Encounter_Type] [nvarchar](50) NULL,
		[Encounter_Count] [int] NULL,

		[Age_as_of_End_Of_Month] [int],
		[Adult] [bit] NULL CONSTRAINT ARCHIVE_T004_Billable_Service$Default$Zero  DEFAULT ((0)),
		[DateTime_Archived] [datetime] NOT NULL CONSTRAINT ARCHIVE_T04_TheDateTime_Default_GETDATE DEFAULT GETDATE(),

		[ARCHIVE_T004_RowVersion] [timestamp] NULL
	,CONSTRAINT [ARCHIVE_T004_NON_Billable_Service$ARCHIVE_T004_PK] PRIMARY KEY NONCLUSTERED 
		(
			[ARCHIVE_T004_PK] ASC
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