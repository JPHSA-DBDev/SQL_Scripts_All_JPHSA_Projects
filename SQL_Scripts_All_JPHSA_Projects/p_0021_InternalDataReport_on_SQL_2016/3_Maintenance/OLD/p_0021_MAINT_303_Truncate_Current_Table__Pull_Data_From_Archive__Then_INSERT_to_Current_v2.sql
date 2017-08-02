--p_0021_MAINT_303_Truncate_Current_Table__Pull_Data_From_Archive__Then_INSERT_to_Current_v2.sql
/*
	************************************************************************************

	NOTE: Use this script to pull data from the ARCHIVE tables, and put it in the current Tables, so you can run Reports from the Current Table
			for data that is coming from the Archive

			
	Uses: 
	Created: 04/03/2017
	By: glenn garson
	************************************************************************************
*/
USE [Success];
GO

--DECLARE 
-- ****************************************************************************************
-- Declare variables specific to just this run of the script
-- ****************************************************************************************
DECLARE @Start_OfMonth as nvarchar(12)
SELECT @Start_OfMonth = '07/01/2016'

DECLARE @End_OfMonth as nvarchar(12)
SELECT @End_OfMonth = '07/31/2016'

--===============================================================Part 1 - START

TRUNCATE TABLE zzz_T003_current_Billable_Services_IDR
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


--===============================================================Part 2 - START

TRUNCATE TABLE zzz_T004_current_NonBillable_Services_IDR
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
