--p_0021_MAINT_310_Truncate_ThenPopulate_T004_from_old_table.sql
/*
	************************************************************************************

	NOTE: Used this script to migrate to the newer version of the tables
		New table:	T004_ARCHIVE_NonBillable_Services_IDR
		Old table: OLD__T004_All_Monthly_NonBillable_Services_IDR_ARCHIVE
			
	Uses: 
	Created: 04/03/2017
	By: glenn garson
	************************************************************************************
*/
USE [Success];
GO


TRUNCATE TABLE T004_ARCHIVE_NonBillable_Services_IDR


INSERT INTO T004_ARCHIVE_NonBillable_Services_IDR (
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
													  ,[DateTime_Archived]
													)
SELECT  
	  ( SELECT RIGHT('00' + CAST(MONTH( [Date_Encounter]) AS NVARCHAR),2)  ) as [Data_for_Month_MM]
	  ,( SELECT RIGHT('0000' + CAST(year( [Date_Encounter]) AS NVARCHAR),4)  ) as [Data_for_Year_YYYY]
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
	  , (0 + Convert(Char(8),Convert(datetime,[Date_Encounter],101),112) - Convert(Char(8),[Patient_Birth_Date__Chart],112)) / 10000 as [Age_as_of_Date_Encounter]
	  , (SELECT     'TheCalculation' = CASE 
											WHEN
												( ((0 + Convert(Char(8),Convert(datetime,[Date_Encounter],101),112) - Convert(Char(8),[Patient_Birth_Date__Chart],112)) / 10000) >= 18 )
												THEN 1 
											ELSE 0 
										END) as Adult
      ,[DateTime_Archived]
  FROM [Success].[dbo].[OLD__T004_All_Monthly_NonBillable_Services_IDR_ARCHIVE]



  --======================================================


  SELECT  count(*) as theCount
      ,[Data_for_Month_MM]
      ,[Data_for_Year_YYYY]

  FROM [Success].[dbo].T004_ARCHIVE_NonBillable_Services_IDR
  GROUP BY [Data_for_Month_MM]
      ,[Data_for_Year_YYYY]
   Order by 

      [Data_for_Year_YYYY],       [Data_for_Month_MM]