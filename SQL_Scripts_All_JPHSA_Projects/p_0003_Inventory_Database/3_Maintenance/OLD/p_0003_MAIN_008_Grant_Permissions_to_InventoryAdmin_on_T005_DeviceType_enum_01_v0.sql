--p_0003_MAIN_008_Grant_Permissions_to_InventoryAdmin_on_T005_DeviceType_enum_01_v0.sql

use [d1_IT]
GO
GRANT INSERT ON [dbo].[T005_DeviceType_enum_01] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT REFERENCES ON [dbo].[T005_DeviceType_enum_01] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT SELECT ON [dbo].[T005_DeviceType_enum_01] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT UPDATE ON [dbo].[T005_DeviceType_enum_01] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT VIEW CHANGE TRACKING ON [dbo].[T005_DeviceType_enum_01] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT VIEW DEFINITION ON [dbo].[T005_DeviceType_enum_01] TO [InventoryAdmin]
GO
