--p_003_RES_002_FindDevice_Given_PK_of_Monitor_or_Attached_Device.sql

use d1_IT
go

--DECLARE @PK_of_thing_to_Look_for nvarchar(25)
--SELECT @PK_of_thing_to_Look_for = 'IT-0987'

DECLARE @PK_of_thing_to_Look_for INT
SELECT @PK_of_thing_to_Look_for = 109


SELECT TOP (1000) [T004_IP_Inventory_PK]
      ,[JPHSA_Tag]
      ,[Monitor_1_FK]
      ,[Monitor_2_FK]
      ,[Monitor_3_FK]
      ,[Vendor_Service_Tag]
      ,[Room_Number]
      ,[User]
      ,[Group]
      ,[Location]
      ,[DeviceType_T005_e1]
      ,[Model_Brand]
      ,[Comment]
      ,[Building_T005_e2]
      ,[Project]
      ,[DeviceStatus_T005_e3]
      ,[CreateRecord_dateTime]
      ,[CreateRecord_name]
      ,[UpdateRecord_dateTime]
      ,[UpdateRecord_name]
      ,[T004_RowVersion]
      ,[Attached_T004_IP_Device_1_FK]
      ,[Attached_T004_IP_Device_2_FK]
      ,[Attached_T004_IP_Device_3_FK]
  FROM [d1_IT].[dbo].[T004_IP_Inventory]
  where
	[Monitor_1_FK] = @PK_of_thing_to_Look_for
	or
	[Monitor_2_FK] = @PK_of_thing_to_Look_for
	or
	[Monitor_3_FK] = @PK_of_thing_to_Look_for

	OR

	[Attached_T004_IP_Device_1_FK] = @PK_of_thing_to_Look_for
	or
	[Attached_T004_IP_Device_2_FK] = @PK_of_thing_to_Look_for
	or
	[Attached_T004_IP_Device_1_FK] = @PK_of_thing_to_Look_for