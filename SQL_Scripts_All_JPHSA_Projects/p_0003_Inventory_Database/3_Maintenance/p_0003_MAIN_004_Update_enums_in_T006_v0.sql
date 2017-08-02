--p_0003_MAIN_004_Update_enums_in_T006_v0.sql
use d1_IT
go

;with cte_1 as
(select 
      [T004_IP_Inventory_PK]
	  ,[JPHSA_Tag]

      ,[DeviceType_T005_e1]
      ,[DeviceType_T005_e1_Description]	--DeviceType_T005_e1_Description

      ,[Building_T005_e2]
      ,[Building_T005_e2_Description]

      ,[DeviceStatus_T005_e3]
      ,[DeviceStatus_T005_e3_Description]

  FROM [d1_IT].[dbo].[T004_IP_Inventory]

),
cte_2
AS
(
select 
		[T004_IP_Inventory_PK]
		,[JPHSA_Tag]
		,e1.T005_DeviceType_enum_01_Value as [DeviceType_T005_e1]
		,e1.T005_DeviceType_enum_01_Description
		,e2.T005_Building_enum_02_Value as [Building_T005_e2]
		,e2.T005_Building_enum_02_Description
		,e3.T005_DeviceStatus_enum_03_Value as [DeviceStatus_T005_e3]
		,e3.T005_DeviceStatus_enum_03_Description

from 
		(
			(
				cte_1 c
				LEFT OUTER JOIN
				T005_DeviceType_enum_01 e1
				on
					c.DeviceType_T005_e1_Description = e1.T005_DeviceType_enum_01_Description
			)
			LEFT OUTER JOIN
			T005_Building_enum_02 e2
			on 
				c.Building_T005_e2_Description = e2.T005_Building_enum_02_Description
		)
		LEFT OUTER JOIN
		T005_DeviceStatus_enum_03 e3
		ON
			c.DeviceStatus_T005_e3_Description = e3.T005_DeviceStatus_enum_03_Description

)

--SELECT * From cte_2

UPDATE  [d1_IT].[dbo].T004_IP_Inventory 
SET     [DeviceStatus_T005_e3] = 
        (
          SELECT TOP(1) [DeviceStatus_T005_e3]
          FROM cte_2 b 
          WHERE [d1_IT].[dbo].T004_IP_Inventory.DeviceStatus_T005_e3_Description = b.T005_DeviceStatus_enum_03_Description
        )   

SELECT * From [d1_IT].[dbo].[T004_IP_Inventory] 

--UPDATE  [d1_IT].[dbo].T004_IP_Inventory 
--SET     [Building_T005_e2] = 
--        (
--          SELECT TOP(1) [Building_T005_e2]
--          FROM cte_2 b 
--          WHERE [d1_IT].[dbo].T004_IP_Inventory.[Building_T005_e2_Description] = b.T005_Building_enum_02_Description
--        )   

--SELECT * From [d1_IT].[dbo].[T004_IP_Inventory] 

--UPDATE  [d1_IT].[dbo].T004_IP_Inventory 
--SET     [DeviceType_T005_e1] = 
--        (
--          SELECT TOP(1) [DeviceType_T005_e1]
--          FROM cte_2 b 
--          WHERE [d1_IT].[dbo].T004_IP_Inventory.DeviceType_T005_e1_Description = b.T005_DeviceType_enum_01_Description
--        )   

--SELECT * From [d1_IT].[dbo].[T004_IP_Inventory] 

