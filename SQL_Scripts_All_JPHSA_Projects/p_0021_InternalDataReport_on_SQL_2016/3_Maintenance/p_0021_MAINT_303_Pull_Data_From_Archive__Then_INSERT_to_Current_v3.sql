--p_0021_MAINT_303_Pull_Data_From_Archive__Then_INSERT_to_Current_v3.sql
/*
	************************************************************************************

	NOTE: Use this script to pull data from the ARCHIVE tables, and put it in the current Tables, so you can run Reports from the Current Table
			for data that is coming from the Archive

			
	Uses: 
	Created: 04/03/2017
	Modified: 4/21/2017
	By: glenn garson
	************************************************************************************
*/
USE [Success];
GO
IF OBJECT_ID('dbo.zzz_T004_current_NonBillable_Services_IDR') IS NOT NULL
    DROP TABLE dbo.zzz_T004_current_NonBillable_Services_IDR
IF OBJECT_ID('dbo.zzz_T003_current_Billable_Services_IDR') IS NOT NULL
    DROP TABLE dbo.zzz_T003_current_Billable_Services_IDR

GO

--DECLARE 
-- ****************************************************************************************
-- Declare variables specific to just this run of the script
-- ****************************************************************************************
DECLARE @Start_OfMonth as nvarchar(12)
SELECT @Start_OfMonth = '07/01/2016'

DECLARE @End_OfMonth as nvarchar(12)
SELECT @End_OfMonth = '06/30/2017'

--===============================================================Part 1 - START




CREATE TABLE [dbo].[zzz_T003_current_Billable_Services_IDR]
(
		[T003_PK] [int] IDENTITY(1,1) NOT NULL,
		[Data_for_Month_MM] [nvarchar](2) NULL,
		[Data_for_Year_YYYY] [nvarchar](4) NULL,
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


INSERT INTO zzz_T003_current_Billable_Services_IDR (
													  [CHECKMONTH]
													  ,[Data_for_Month_MM]
													  ,[Data_for_Year_YYYY]
													  ,[Office_Location]
													  ,[Office_Name]
													  ,[Bill_Provider_Name]
													  ,[Bill_Provider_Specialty]
													  ,[Provider_Type]
													  ,[Patient_Name]
													  ,[Patient_No]
													  ,[Patient_Birth_Date]
													  ,[Check-In_Day]
													  ,[Check-Out_Day]
													  ,[CPT_Code]
													  ,[Service]
													  ,[CPT_Description]
													  ,[Unit_Qty]
													  ,[LOC]
													  ,[Age_as_of_Check-In]
													  ,[Adult]
													)
SELECT  
      [CHECKMONTH]
      ,[Data_for_Month_MM]
      ,[Data_for_Year_YYYY]
      ,[Office_Location]
      ,[Office_Name]
      ,[Bill_Provider_Name]
      ,[Bill_Provider_Specialty]
      ,[Provider_Type]
      ,[Patient_Name]
      ,[Patient_No]
      ,[Patient_Birth_Date]
      ,[Check-In_Day]
      ,[Check-Out_Day]
      ,[CPT_Code]
      ,[Service]
      ,[CPT_Description]
      ,[Unit_Qty]
      ,[LOC]
      ,[Age_as_of_Check-In]
      ,[Adult]
  FROM [Success].[dbo].[T003_ARCHIVE_Billable_Services_IDR]
  WHERE 
		([Check-In_Day] >= @Start_OfMonth)
		AND
		([Check-In_Day] <= @End_OfMonth)
--===============================================================Part 1 - END





CREATE TABLE [dbo].[zzz_T004_current_NonBillable_Services_IDR]
(
		[T004_PK] [int] IDENTITY(1,1) NOT NULL,
		[Data_for_Month_MM] [nvarchar](2) NULL,
		[Data_for_Year_YYYY] [nvarchar](4) NULL,
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
		[Adult] [bit] NULL CONSTRAINT zzz_T004_current_NonBillable_Services_IDR$Default$Zero  DEFAULT ((0)),

		[T004_RowVersion] [timestamp] NULL
	,CONSTRAINT [zzz_T004_current_NonBillable_Services_IDR$T004_PK] PRIMARY KEY NONCLUSTERED 
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

--===============================================================Part 2 - START

--TRUNCATE TABLE zzz_T004_current_NonBillable_Services_IDR
INSERT INTO zzz_T004_current_NonBillable_Services_IDR (
															[Data_for_Month_MM]
															,[Data_for_Year_YYYY]
														   ,[Location]
														  ,[Date_Encounter]
														  ,[Patient_No__Chart]
														  ,[Patient_Birth_Date__Chart]
														  ,[Examining_Clinician]
														  ,[Chp_Encounter_Id]
														  ,[Billable_Encounter_ID]
														  ,[Reason_for_Encounter]
														  ,[Encounter_Type]
														  ,[Encounter_Count]
														  ,[NonBillable_Type]
														  ,[Age_as_of_Date_Encounter]
														  ,[Adult]
													)
SELECT  
		[Data_for_Month_MM]
		,[Data_for_Year_YYYY]
		,[Location]
		,[Date_Encounter]
		,[Patient_No__Chart]
		,[Patient_Birth_Date__Chart]
		,[Examining_Clinician]
		,[Chp_Encounter_Id]
		,[Billable_Encounter_ID]
		,[Reason_for_Encounter]
		,[Encounter_Type]
		,[Encounter_Count]
		,[NonBillable_Type]
		,[Age_as_of_Date_Encounter]
		,[Adult]
  FROM [Success].[dbo].[T004_ARCHIVE_NonBillable_Services_IDR]
  WHERE 
		([Date_Encounter] >= @Start_OfMonth)
		AND
		([Date_Encounter] <= @End_OfMonth)
--===============================================================Part 2 - END

go
