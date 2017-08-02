SELECT 
dbo_T004_IP_Inventory.JPHSA_Tag, 
dbo_T004_IP_Inventory.[Monitor-1_FK], 
dbo_T004_IP_Inventory.[Monitor-2_FK], 
dbo_T004_IP_Inventory.[Monitor-3_FK], 
dbo_T004_IP_Inventory.Vendor_Service_Tag, 
dbo_T004_IP_Inventory.Room_Number, 
dbo_T004_IP_Inventory.User, 
dbo_T004_IP_Inventory.Group, 
dbo_T004_IP_Inventory.Location, 
dbo_T004_IP_Inventory.DeviceType_T005_e1, 
dbo_T004_IP_Inventory.Model_Brand, 
dbo_T004_IP_Inventory.Comment, 
dbo_T004_IP_Inventory.Building_T005_e2, 
dbo_T004_IP_Inventory.Project, 
dbo_T004_IP_Inventory.DeviceStatus_T005_e3, 
dbo_T004_IP_Inventory.CreateRecord_dateTime, 
dbo_T004_IP_Inventory.CreateRecord_name, 
dbo_T004_IP_Inventory.UpdateRecord_dateTime, 
dbo_T004_IP_Inventory.UpdateRecord_name, 
dbo_T004_IP_Inventory.T004_RowVersion, 
dbo_T005_DeviceStatus_enum_03.T005_DeviceStatus_enum_03_Description, 
dbo_T006_Monitor_Inventory.JPHSA_Tag, 
dbo_T005_Building_enum_02.T005_Building_enum_02_Description, 
dbo_T005_DeviceType_enum_01.T005_DeviceType_enum_01_Description

FROM (((

dbo_T004_IP_Inventory 
INNER JOIN 
dbo_T005_Building_enum_02 
ON 
dbo_T004_IP_Inventory.Building_T005_e2 = dbo_T005_Building_enum_02.T005_Building_enum_02_Value) 


INNER JOIN 
dbo_T005_DeviceType_enum_01 
ON 
dbo_T004_IP_Inventory.DeviceType_T005_e1 = dbo_T005_DeviceType_enum_01.T005_DeviceType_enum_01_Value) 

INNER JOIN 
dbo_T005_DeviceStatus_enum_03 
ON 
dbo_T004_IP_Inventory.DeviceStatus_T005_e3 = dbo_T005_DeviceStatus_enum_03.T005_DeviceStatus_enum_03_Value

INNER JOIN

dbo_T006_Monitor_Inventory 
ON 
(dbo_T004_IP_Inventory.[Monitor-3_FK] = dbo_T006_Monitor_Inventory.T006_Monitor_Inventory_PK) 
AND 
(dbo_T004_IP_Inventory.[Monitor-2_FK] = dbo_T006_Monitor_Inventory.T006_Monitor_Inventory_PK) 
AND 
(dbo_T004_IP_Inventory.[Monitor-1_FK] = dbo_T006_Monitor_Inventory.T006_Monitor_Inventory_PK)

) 

 ;