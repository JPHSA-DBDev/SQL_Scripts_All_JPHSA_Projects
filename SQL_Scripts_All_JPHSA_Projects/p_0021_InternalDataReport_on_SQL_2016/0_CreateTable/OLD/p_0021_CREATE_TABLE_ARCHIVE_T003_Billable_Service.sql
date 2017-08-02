--p_0021_CREATE_TABLE_ARCHIVE_T003_Billable_Service.sql
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

IF OBJECT_ID('dbo.ARCHIVE_T003_Billable_Service') IS NOT NULL
    DROP TABLE dbo.ARCHIVE_T003_Billable_Service

go

CREATE TABLE [dbo].[ARCHIVE_T003_Billable_Service]
(
		[ARCHIVE_T003_PK] [int] IDENTITY(1,1) NOT NULL,

		[CHECKMONTH] [nvarchar](25) NULL,
		[Office_Location] [nvarchar](50) NULL,
		[Office_Name] [nvarchar](100) NULL,
		[Bill_Provider_Name] [nvarchar](100) NULL,
		[Bill_Provider_Specialty] [nvarchar](100) NULL,
		[Provider_Type] [nvarchar](255) NULL,
		[Patient_Name] [nvarchar](100) NULL,
		[Patient_No] [int] NULL,
		[Patient_Birth_Date] [date] NULL,
		[Check-In_Day] [date] NULL,
		[Check-Out_Day] [date] NULL,
		[CPT_Code] [nvarchar](15) NULL,
		[Service] [nvarchar](255) NULL,
		[CPT_Description] [nvarchar](255) NULL,
		[Unit_Qty] [int] NULL,

		[Age_as_of_End_Of_Month] [int],
		[Adult] [bit] NULL CONSTRAINT ARCHIVE_T003_Billable_Service$Default$Zero  DEFAULT ((0)),
		[DateTime_Archived] [datetime] NOT NULL CONSTRAINT ARCHIVE_T03_TheDateTime_Default_GETDATE DEFAULT GETDATE(),

		[ARCHIVE_T003_RowVersion] [timestamp] NULL
	,CONSTRAINT [ARCHIVE_T003_Billable_Service$ARCHIVE_T003_PK] PRIMARY KEY NONCLUSTERED 
		(
			[ARCHIVE_T003_PK] ASC
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