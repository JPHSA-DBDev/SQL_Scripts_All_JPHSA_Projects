--p_0003_MAIN_022_Grant_Permissions_to_IT_on_T007_IP_Inventory_History_v0.sql
-- This is the System Versioned History File

use [d1_IT]
GO
GRANT INSERT ON [dbo].[IP_InventoryHistory] TO [JPHSA01\IT]
GO
use [d1_IT]
GO
GRANT REFERENCES ON [dbo].[IP_InventoryHistory] TO [JPHSA01\IT]
GO
use [d1_IT]
GO
GRANT SELECT ON [dbo].[IP_InventoryHistory] TO [JPHSA01\IT]
GO
use [d1_IT]
GO
GRANT UPDATE ON [dbo].[IP_InventoryHistory] TO [JPHSA01\IT]
GO
use [d1_IT]
GO
GRANT VIEW CHANGE TRACKING ON [dbo].[IP_InventoryHistory] TO [JPHSA01\IT]
GO
use [d1_IT]
GO
GRANT VIEW DEFINITION ON [dbo].[IP_InventoryHistory] TO [JPHSA01\IT]
GO
