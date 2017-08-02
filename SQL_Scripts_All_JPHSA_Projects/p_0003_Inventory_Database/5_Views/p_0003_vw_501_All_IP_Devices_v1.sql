--p_0003_vw_501_All_IP_Devices_v1.sql
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

IF OBJECT_ID('p_0003_vw_501_All_IP_Devices', 'V') IS NOT NULL
DROP view p_0003_vw_501_All_IP_Devices
GO


CREATE VIEW p_0003_vw_501_All_IP_Devices AS
--==============================================

SELECT 
			t4.[T004_IP_Inventory_PK]
			,t4.[JPHSA_Tag] AS [TheDevice_JPHSA_Tag]
			,t6_1.JPHSA_Tag AS [Monitor_1_JPHSA_Tag]
			--,t4.[Monitor_1_FK]
			,t6_2.JPHSA_Tag AS [Monitor_2_JPHSA_Tag]
			--,t4.[Monitor_2_FK]
			,t6_3.JPHSA_Tag AS [Monitor_3_JPHSA_Tag]
			--,t4.[Monitor_3_FK]
			,t4.[Vendor_Service_Tag]
			,t4.[Room_Number]
			,t4.[User]
			,t4.[Group]
			,t4.[Location]
			,e1.T005_DeviceType_enum_01_Description AS [DeviceType]
			--,t4.[DeviceType_T005_e1]
			--,t4.[DeviceType_T005_e1_Description]
			,t4.[Model_Brand]
			,t4.[Comment]
			,e2.T005_Building_enum_02_Description AS [Building]
			--,t4.[Building_T005_e2]
			--,t4.[Building_T005_e2_Description]
			,t4.[Project]
			,e3.T005_DeviceStatus_enum_03_Description AS [DeviceStatus]
			--,t4.[DeviceStatus_T005_e3]
			--,t4.[DeviceStatus_T005_e3_Description]
			,t4.[CreateRecord_dateTime]
			,t4.[CreateRecord_name]
			,t4.[UpdateRecord_dateTime]
			,t4.[UpdateRecord_name]
			--,t4.[T004_RowVersion]      
FROM            
		T004_IP_Inventory t4
		LEFT OUTER JOIN
		T005_DeviceType_enum_01 e1
		ON 
			t4.DeviceType_T005_e1 = e1.T005_DeviceType_enum_01_Value 

		LEFT OUTER JOIN
		T005_Building_enum_02 e2
		ON 
			t4.Building_T005_e2 = e2.T005_Building_enum_02_Value 

		LEFT OUTER JOIN
		T005_DeviceStatus_enum_03 e3
		ON 
			t4.DeviceStatus_T005_e3 = e3.T005_DeviceStatus_enum_03_Value 
	
		LEFT OUTER JOIN
		T006_Monitor_Inventory t6_1
		ON 
			t4.[Monitor_1_FK] = t6_1.T006_Monitor_Inventory_PK 

		LEFT OUTER JOIN
		T006_Monitor_Inventory t6_2
		ON 
			t4.[Monitor_2_FK] = t6_2.T006_Monitor_Inventory_PK 

		LEFT OUTER JOIN
		T006_Monitor_Inventory t6_3
		ON 
			t4.[Monitor_3_FK] = t6_3.T006_Monitor_Inventory_PK
			
go