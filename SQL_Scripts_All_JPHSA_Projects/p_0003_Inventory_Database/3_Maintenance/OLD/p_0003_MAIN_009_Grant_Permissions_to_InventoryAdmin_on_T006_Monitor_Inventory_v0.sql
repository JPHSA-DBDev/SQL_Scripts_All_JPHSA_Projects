--p_0003_MAIN_009_Grant_Permissions_to_InventoryAdmin_on_T006_Monitor_Inventory_v0.sql

use [d1_IT]
GO
GRANT INSERT ON [dbo].[T006_Monitor_Inventory] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT REFERENCES ON [dbo].[T006_Monitor_Inventory] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT SELECT ON [dbo].[T006_Monitor_Inventory] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT UPDATE ON [dbo].[T006_Monitor_Inventory] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT VIEW CHANGE TRACKING ON [dbo].[T006_Monitor_Inventory] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT VIEW DEFINITION ON [dbo].[T006_Monitor_Inventory] TO [InventoryAdmin]
GO
