--p_0003_MAIN_015_AppendUploadedData_into_T004_v0.sql
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
			,[Room_Number]
			,[User]
			,[Group]
			,[DeviceType_T005_e1]
			,[Model_Brand]
			,[Building_T005_e2]
			,[DeviceStatus_T005_e3]
			,[Comment]

	  FROM [d1_IT].[dbo].[zzz_Inventory_EB_2017_05_25]


)

INSERT INTO [d1_IT].[dbo].[T004_IP_Inventory]   --<============== APPEND to existing table
		(
			[JPHSA_Tag]
			,[Vendor_Service_Tag]
			,[Room_Number]
			,[User]
			,[Group]
			,[DeviceType_T005_e1]
			,[Model_Brand]
			,[Building_T005_e2]
			,[DeviceStatus_T005_e3]
			,[Comment]
		)
SELECT DISTINCT
			SUBSTRING([JPHSA_Tag],1,25)
			,SUBSTRING([Vendor_Service_Tag],1,25)
			,SUBSTRING([Room_Number],1,25)
			,[User]
			,[Group]
			,[DeviceType_T005_e1]
			,[Model_Brand]
			,[Building_T005_e2]
			,[DeviceStatus_T005_e3]
			,[Comment]



			--rtrim(ltrim([JPHSA_Tag]))
			--,rtrim(ltrim([Vendor_Service_Tag]))
			--,rtrim(ltrim([Room_Number]))
			--,rtrim(ltrim([User]))
			--,rtrim(ltrim([Group]))
			--,[DeviceType_T005_e1]
			--,rtrim(ltrim([Model_Brand]))
			--,[Building_T005_e2]
			--,[DeviceStatus_T005_e3]
			--,rtrim(ltrim([Comment]))
FROM cte_1 
	


