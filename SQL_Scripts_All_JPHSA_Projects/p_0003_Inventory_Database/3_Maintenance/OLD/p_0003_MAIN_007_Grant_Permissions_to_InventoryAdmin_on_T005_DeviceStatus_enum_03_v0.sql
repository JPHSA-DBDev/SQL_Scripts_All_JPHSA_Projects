--p_0003_MAIN_007_Grant_Permissions_to_InventoryAdmin_on_T005_DeviceStatus_enum_03_v0.sql

use [d1_IT]
GO
GRANT INSERT ON [dbo].[T005_DeviceStatus_enum_03] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT REFERENCES ON [dbo].[T005_DeviceStatus_enum_03] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT SELECT ON [dbo].[T005_DeviceStatus_enum_03] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT UPDATE ON [dbo].[T005_DeviceStatus_enum_03] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT VIEW CHANGE TRACKING ON [dbo].[T005_DeviceStatus_enum_03] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT VIEW DEFINITION ON [dbo].[T005_DeviceStatus_enum_03] TO [InventoryAdmin]
GO
