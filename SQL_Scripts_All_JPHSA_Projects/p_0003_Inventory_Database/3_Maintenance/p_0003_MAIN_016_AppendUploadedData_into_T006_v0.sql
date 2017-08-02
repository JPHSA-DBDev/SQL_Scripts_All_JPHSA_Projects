--p_0003_MAIN_016_AppendUploadedData_into_T006_v0.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 05/25/2017
	By: glenn garson
	************************************************************************************
*/

USE [d1_IT]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


;
WITH cte_1
AS
(
	SELECT 
	  [JPHSA_Tag]
      ,[Vendor_Service_Tag]
      ,[Model_Brand]
      ,[Comment]
      ,[Building_T005_e2]
      ,[DeviceStatus_T005_e3]


	  FROM [d1_IT].[dbo].[zzz_Monitors_EB_2017_05_25]


)

INSERT INTO [d1_IT].[dbo].[T006_Monitor_Inventory]   --<============== APPEND to existing table
		(
		  [JPHSA_Tag]
		  ,[Vendor_Service_Tag]
		  ,[Model_Brand]
		  ,[Comment]
		  ,[Building_T005_e2]
		  ,[DeviceStatus_T005_e3]

		)
SELECT DISTINCT
			SUBSTRING([JPHSA_Tag],1,25)
			,SUBSTRING([Vendor_Service_Tag],1,25)
			,[Model_Brand]
			,[Comment]
			,[Building_T005_e2]
			,[DeviceStatus_T005_e3]

FROM cte_1 
	


