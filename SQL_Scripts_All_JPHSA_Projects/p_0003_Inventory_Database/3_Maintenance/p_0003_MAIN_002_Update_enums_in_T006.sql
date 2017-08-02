--p_0003_MAIN_002_Update_enums_in_T006.sql

use d1_IT
go

;with cte_1 as
(select 
		[T006_Monitor_Inventory_PK]
		,[JPHSA_Tag]
	
		,[Building_T005_e2]
		,[Building_T005_e2_Description]

		,[DeviceStatus_T005_e3]
		,[DeviceStatus_T005_e3_Description]


 from [d1_IT].[dbo].[T006_Monitor_Inventory] 

),
cte_2
AS
(
select 
		[T006_Monitor_Inventory_PK]
		,[JPHSA_Tag]
		,e.T005_Building_enum_02_Value as [Building_T005_e2]
		,[Building_T005_e2_Description]
		,d.T005_DeviceStatus_enum_03_Value as [DeviceStatus_T005_e3]
		,[DeviceStatus_T005_e3_Description]
from 
		(
		cte_1 c
		LEFT OUTER JOIN
		T005_Building_enum_02 e
		on
			c.Building_T005_e2_Description = e.T005_Building_enum_02_Description
		)
		LEFT OUTER JOIN
		T005_DeviceStatus_enum_03 d
		on 
			c.DeviceStatus_T005_e3_Description = d.T005_DeviceStatus_enum_03_Description
)

--UPDATE  [d1_IT].[dbo].[T006_Monitor_Inventory] 
--SET     [Building_T005_e2] = 
--        (
--          SELECT TOP(1) [Building_T005_e2]
--          FROM cte_2 b 
--          WHERE [d1_IT].[dbo].[T006_Monitor_Inventory].Building_T005_e2_Description = b.Building_T005_e2_Description
--        )   

--SELECT * From [d1_IT].[dbo].[T006_Monitor_Inventory] 

UPDATE  [d1_IT].[dbo].[T006_Monitor_Inventory] 
SET     [DeviceStatus_T005_e3] = 
        (
          SELECT TOP(1) [DeviceStatus_T005_e3]
          FROM cte_2 b 
          WHERE [d1_IT].[dbo].[T006_Monitor_Inventory].DeviceStatus_T005_e3_Description = b.DeviceStatus_T005_e3_Description
        )   

SELECT * From [d1_IT].[dbo].[T006_Monitor_Inventory] 
