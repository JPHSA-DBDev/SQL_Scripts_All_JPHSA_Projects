--p_0003_SP_003_Search_All_Monitors.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 05/30/2017
	By: glenn garson
	************************************************************************************
*/

use d1_IT
go
----------------------------------DEBUG PARMS START
--DECLARE @SearchString nvarchar(100)
--SET @SearchString = ''
----------------------------------DEBUG PARMS END


create Procedure p_0003_SP_003_Search_All_Monitors(
		 @SearchString as NVARCHAR(100)                       	
	)

	as

	SELECT 
	   I.[T006_Monitor_Inventory_PK]
      ,I.[JPHSA_Tag]
      ,I.[Monitor_Size]
      ,I.[Vendor_Service_Tag]
      ,I.[Model_Brand]
      ,I.[Comment]
      --,I.[Building_T005_e2]
      ,I.[Project]
      --,I.[DeviceStatus_T005_e3]
      ,e2.T005_Building_enum_02_Description as [Building]
	  ,e3.T005_DeviceStatus_enum_03_Description as DeviceStatus
      ,I.[CreateRecord_dateTime]
      ,I.[CreateRecord_name]
      ,I.[UpdateRecord_dateTime]
      ,I.[UpdateRecord_name]

  FROM 
		[d1_IT].[dbo].[T006_Monitor_Inventory] I
		LEFT OUTER JOIN
		T005_Building_enum_02 e2
		on I.Building_T005_e2  = e2.T005_Building_enum_02_Value

		LEFT OUTER JOIN
		T005_DeviceStatus_enum_03 e3
		on I.DeviceStatus_T005_e3  = e3.T005_DeviceStatus_enum_03_Value

	WHERE
			(
				(
					(LEN(@SearchString) = 0) 
					OR 
					(@SearchString IS NULL)							
				)
				OR
				(
						(RTRIM(LTRIM(UPPER(JPHSA_Tag))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')		
						OR (RTRIM(LTRIM(UPPER([Model_Brand]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')
						OR (RTRIM(LTRIM(UPPER([Comment]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
				)
			)