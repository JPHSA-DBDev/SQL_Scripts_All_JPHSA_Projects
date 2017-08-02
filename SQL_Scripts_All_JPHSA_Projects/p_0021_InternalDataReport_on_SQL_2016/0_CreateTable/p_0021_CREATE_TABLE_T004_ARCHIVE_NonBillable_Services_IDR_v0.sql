--p_0021_CREATE_TABLE_T004_ARCHIVE_NonBillable_Services_IDR_v0.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 03/14/2017 - was named: p_0021_CREATE_TABLE_T004_ARCHIVE_NonBillable_Services_IDR_v3.sql
	Modified: 4/12/2017 -  Changed script name
							change table name, change [Age_as_of_End_Of_Month] to [Age_as_of_Date_Encounter]
							added: [Data_for_Month_MM], [Data_for_Year_YYYY]
	By: glenn garson
	************************************************************************************
*/
USE [Success]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.T004_ARCHIVE_NonBillable_Services_IDR') IS NOT NULL
    DROP TABLE dbo.T004_ARCHIVE_NonBillable_Services_IDR

go

CREATE TABLE [dbo].[T004_ARCHIVE_NonBillable_Services_IDR]
(
		[ARCHIVE_T004_PK] [int] IDENTITY(1,1) NOT NULL,

		[Data_for_Month_MM] [nvarchar](2),
		[Data_for_Year_YYYY] [nvarchar](4),	
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
		[NonBillable_Type] [nvarchar](2) NULL,

		[Age_as_of_Date_Encounter] [int],
		[Adult] [bit] NULL CONSTRAINT T004_ARCHIVE_Billable_Service_$Default$Zero  DEFAULT ((0)),
		[DateTime_Archived] [datetime] NOT NULL CONSTRAINT T004_ARCHIVE__TheDateTime_Default_GETDATE DEFAULT GETDATE(),

		[ARCHIVE_T004_RowVersion] [timestamp] NULL
	,CONSTRAINT [T004_ARCHIVE_NonBillable_Services_IDR$ARCHIVE_T004_PK] PRIMARY KEY NONCLUSTERED 
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