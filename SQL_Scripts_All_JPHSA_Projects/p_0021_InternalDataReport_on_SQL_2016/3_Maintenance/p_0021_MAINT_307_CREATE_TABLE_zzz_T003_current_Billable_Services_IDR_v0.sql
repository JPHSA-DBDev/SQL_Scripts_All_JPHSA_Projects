--p_0021_MAINT_307_CREATE_TABLE_zzz_T003_current_Billable_Services_IDR_v0.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 03/14/2017 - was called: p_0021_CREATE_TABLE_T003_All_Monthly_Billable_Services_IDR_v3.sq
	Modified: 3/17/2017 - add computed column: 
	Modified: 4/12/2017 -  Changed script name
							change table name, change [Age_as_of_End_Of_Month] to [Age_as_of_Check-In]
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

IF OBJECT_ID('dbo.zzz_T003_current_Billable_Services_IDR') IS NOT NULL
    DROP TABLE dbo.zzz_T003_current_Billable_Services_IDR

go

CREATE TABLE [dbo].[zzz_T003_current_Billable_Services_IDR]
(
		[T003_PK] [int] IDENTITY(1,1) NOT NULL,

		[CHECKMONTH] [nvarchar](25) NULL,
		[Data_for_Month_MM] [nvarchar](2),
		[Data_for_Year_YYYY] [nvarchar](4),	
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

		[Age_as_of_Check-In] [int],
		[Adult] [bit] NULL CONSTRAINT zzz_T003_current_Billable_Services_IDR$Default$Zero  DEFAULT ((0)),

		[T003_RowVersion] [timestamp] NULL
	,CONSTRAINT [zzz_T003_current_Billable_Services_IDR$T003_PK] PRIMARY KEY NONCLUSTERED 
		(
			[T003_PK] ASC
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