--p_0003_MAIN_017_Grant_Permissions_to_InventoryAdmin_on_T007_IP_Inventory_History_v0.sql

use [d1_IT]
GO
GRANT INSERT ON [dbo].[T007_IP_Inventory_History] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT REFERENCES ON [dbo].[T007_IP_Inventory_History] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT SELECT ON [dbo].[T007_IP_Inventory_History] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT UPDATE ON [dbo].[T007_IP_Inventory_History] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT VIEW CHANGE TRACKING ON [dbo].[T007_IP_Inventory_History] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT VIEW DEFINITION ON [dbo].[T007_IP_Inventory_History] TO [InventoryAdmin]
GO
