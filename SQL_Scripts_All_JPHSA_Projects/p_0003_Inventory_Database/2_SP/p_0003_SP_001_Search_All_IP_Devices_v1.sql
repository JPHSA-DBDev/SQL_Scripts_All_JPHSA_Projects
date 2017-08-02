--p_0003_SP_001_Search_All_IP_Devices_v1.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created:5/17/2017
	By: glenn garson
	************************************************************************************
*/

use d1_IT
go

--DECLARE @SearchString nvarchar(100)
--SET @SearchString = '0734'

alter Procedure p_0003_SP_001_Search_All_IP_Devices(
		 @SearchString as NVARCHAR(100)                         	
	)

	as

	SELECT 
	   [T004_IP_Inventory_PK]
      ,[TheDevice_JPHSA_Tag]
      ,[Monitor_1_JPHSA_Tag]
      ,[Monitor_2_JPHSA_Tag]
      ,[Monitor_3_JPHSA_Tag]
      ,[Vendor_Service_Tag]
      ,[Room_Number]
      ,[User]
      ,[Group]
      ,[Location]
      ,[DeviceType]
      ,[Model_Brand]
      ,[Comment]
      ,[Building]
      ,[Project]
      ,[DeviceStatus]
      ,[CreateRecord_dateTime]
      ,[CreateRecord_name]
      ,[UpdateRecord_dateTime]
      ,[UpdateRecord_name]

	FROM p_0003_vw_501_All_IP_Devices
	WHERE
			(
				(
					(LEN(@SearchString) = 0) 
					OR 
					(@SearchString IS NULL)							
				)
				OR
				(
						(RTRIM(LTRIM(UPPER([TheDevice_JPHSA_Tag]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')		
						OR (RTRIM(LTRIM(UPPER([Monitor_1_JPHSA_Tag]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
						OR (RTRIM(LTRIM(UPPER([Monitor_2_JPHSA_Tag]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
						OR (RTRIM(LTRIM(UPPER([Monitor_3_JPHSA_Tag]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	

						OR (RTRIM(LTRIM(UPPER([Vendor_Service_Tag]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
						OR (RTRIM(LTRIM(UPPER([Room_Number]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
						OR (RTRIM(LTRIM(UPPER([User]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
						OR (RTRIM(LTRIM(UPPER([Group]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
						OR (RTRIM(LTRIM(UPPER([Location]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
						OR (RTRIM(LTRIM(UPPER([DeviceType]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	

						OR (RTRIM(LTRIM(UPPER([Model_Brand]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
						OR (RTRIM(LTRIM(UPPER([Comment]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
						OR (RTRIM(LTRIM(UPPER([Building]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
						OR (RTRIM(LTRIM(UPPER([Project]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
						OR (RTRIM(LTRIM(UPPER([DeviceStatus]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
				)
			)