--p_0003_vw_502_User_Computer_Monitors_AttachedDevices_Building_Room.sql

/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 6/1/2017
	By: glenn garson
	************************************************************************************
*/

use d1_IT
go

IF OBJECT_ID('p_0003_vw_502_User_Computer_Monitors_AttachedDevices_Building_Room', 'V') IS NOT NULL
DROP view p_0003_vw_502_User_Computer_Monitors_AttachedDevices_Building_Room
GO


create VIEW p_0003_vw_502_User_Computer_Monitors_AttachedDevices_Building_Room AS
--==============================================
		SELECT        
		i.[User],
		e2.T005_Building_enum_02_Description as Building, 
		i.Room_Number,
		i.JPHSA_Tag AS Device, 
		e1.T005_DeviceType_enum_01_Description AS Device_Type, 
		e3.T005_DeviceStatus_enum_03_Description AS Device_Status, 

		m.JPHSA_Tag AS Monitor_1, 
		m_1.JPHSA_Tag AS Monitor_2, 
		m_2.JPHSA_Tag AS Monitor_3, 

		i_1.JPHSA_Tag AS AttachedDevice_1, 
		e1_1.T005_DeviceType_enum_01_Description AS AttachedDevice_1_Type,

		i_2.JPHSA_Tag AS AttachedDevice_2, 
		e1_2.T005_DeviceType_enum_01_Description AS AttachedDevice_2_Type,

		i_3.JPHSA_Tag AS AttachedDevice_3,
		e1_3.T005_DeviceType_enum_01_Description AS AttachedDevice_3_Type

		FROM            
		T004_IP_Inventory i
		LEFT OUTER JOIN
		T005_DeviceStatus_enum_03 e3
		ON i.DeviceStatus_T005_e3 = e3.T005_DeviceStatus_enum_03_Value 

		LEFT OUTER JOIN
		T005_Building_enum_02 e2
		on i.Building_T005_e2 = e2.T005_Building_enum_02_Value

		LEFT OUTER JOIN
		T004_IP_Inventory AS i_1 
		ON i.[Attached_T004_IP_Device-1_FK] = i_1.T004_IP_Inventory_PK 

		LEFT OUTER JOIN
		T004_IP_Inventory AS i_2 
		ON i.[Attached_T004_IP_Device-2_FK] = i_2.T004_IP_Inventory_PK 

		LEFT OUTER JOIN
		T004_IP_Inventory AS i_3 
		ON i.[Attached_T004_IP_Device-3_FK] = i_3.T004_IP_Inventory_PK 

		LEFT OUTER JOIN
		T006_Monitor_Inventory m
		ON i.[Monitor-1_FK] = m.T006_Monitor_Inventory_PK 

		LEFT OUTER JOIN
		T006_Monitor_Inventory m_1
		ON i.[Monitor-2_FK] = m_1.T006_Monitor_Inventory_PK

		LEFT OUTER JOIN
		T006_Monitor_Inventory m_2
		ON i.[Monitor-3_FK] = m_2.T006_Monitor_Inventory_PK 

		LEFT OUTER JOIN
		T005_DeviceType_enum_01 e1
		ON i.DeviceType_T005_e1 = e1.T005_DeviceType_enum_01_Value 

		LEFT OUTER JOIN
		T005_DeviceType_enum_01 AS e1_1 
		ON i_1.DeviceType_T005_e1 = e1_1.T005_DeviceType_enum_01_Value

		LEFT OUTER JOIN
		T005_DeviceType_enum_01 AS e1_2 
		ON i_2.DeviceType_T005_e1 = e1_2.T005_DeviceType_enum_01_Value

		LEFT OUTER JOIN
		T005_DeviceType_enum_01 AS e1_3 
		ON i_3.DeviceType_T005_e1 = e1_3.T005_DeviceType_enum_01_Value

		Where i.DeviceType_T005_e1 in (1,2,3,11,14)
--===============================================

	  
go
