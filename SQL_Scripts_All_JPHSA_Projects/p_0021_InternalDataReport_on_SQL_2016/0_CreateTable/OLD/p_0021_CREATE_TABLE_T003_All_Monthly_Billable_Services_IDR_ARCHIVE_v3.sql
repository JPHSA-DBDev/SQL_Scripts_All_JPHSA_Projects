--p_0021_CREATE_TABLE_T003_All_Monthly_Billable_Services_IDR_ARCHIVE_v3.sql
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

IF OBJECT_ID('dbo.T003_All_Monthly_Billable_Services_IDR_ARCHIVE') IS NOT NULL
    DROP TABLE dbo.T003_All_Monthly_Billable_Services_IDR_ARCHIVE

go

CREATE TABLE [dbo].[T003_All_Monthly_Billable_Services_IDR_ARCHIVE]
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
		[LOC] [nvarchar](2) NULL, 

		[Age_as_of_End_Of_Month] [int],
		[Adult] [bit] NULL CONSTRAINT T003_All_Monthly_Billable_Services_IDR_ARCHIVE$Default$Zero  DEFAULT ((0)),
		[DateTime_Archived] [datetime] NOT NULL CONSTRAINT T003_Archive_Default_GETDATE DEFAULT GETDATE(),

		[ARCHIVE_T003_RowVersion] [timestamp] NULL
	,CONSTRAINT [T003_All_Monthly_Billable_Services_IDR_ARCHIVE$ARCHIVE_T003_PK] PRIMARY KEY NONCLUSTERED 
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