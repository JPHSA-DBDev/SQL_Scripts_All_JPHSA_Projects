--p_0021_MAINT_309_Truncate_ThenPopulate_T003_from_old_table.sql
/*
	************************************************************************************

	NOTE: Used this script to migrate to the newer version of the tables
		New table:	T003_ARCHIVE_Billable_Services_IDR
		Old table: OLD__T003_All_Monthly_Billable_Services_IDR_ARCHIVE
			
	Uses: 
	Created: 04/03/2017
	By: glenn garson
	************************************************************************************
*/
USE [Success];
GO


TRUNCATE TABLE T003_ARCHIVE_Billable_Services_IDR


INSERT INTO T003_ARCHIVE_Billable_Services_IDR (
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
													  ,[DateTime_Archived]
													)
SELECT  
      [CHECKMONTH]
	  ,( SELECT RIGHT('00' + CAST(MONTH( [Check-In_Day]) AS NVARCHAR),2)  ) as [Data_for_Month_MM]
	  ,( SELECT RIGHT('0000' + CAST(year( [Check-In_Day]) AS NVARCHAR),4)  ) as [Data_for_Year_YYYY]
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
	  , (0 + Convert(Char(8),Convert(datetime,[Check-In_Day],101),112) - Convert(Char(8),[Patient_Birth_Date],112)) / 10000 as [Age_as_of_Check-In]
	  , (SELECT     'TheCalculation' = CASE 
											WHEN
												( ((0 + Convert(Char(8),Convert(datetime,[Check-In_Day],101),112) - Convert(Char(8),[Patient_Birth_Date],112)) / 10000) >= 18 )
												THEN 1 
											ELSE 0 
										END) as Adult
      ,[DateTime_Archived]
  FROM [Success].[dbo].[OLD__T003_All_Monthly_Billable_Services_IDR_ARCHIVE]
