--p_0003_MAIN_005_Grant_Permissions_to_InventoryAdmin_on_T004_IP_Inventory_v0.sql

use [d1_IT]
GO
GRANT INSERT ON [dbo].[T004_IP_Inventory] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT REFERENCES ON [dbo].[T004_IP_Inventory] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT SELECT ON [dbo].[T004_IP_Inventory] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT UPDATE ON [dbo].[T004_IP_Inventory] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT VIEW CHANGE TRACKING ON [dbo].[T004_IP_Inventory] TO [InventoryAdmin]
GO
use [d1_IT]
GO
GRANT VIEW DEFINITION ON [dbo].[T004_IP_Inventory] TO [InventoryAdmin]
GO
