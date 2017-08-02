--p_0003_MAIN_020_Grant_Permissions_to_InventoryAdmin_on_T007_IP_Inventory_History_v0.sql
-- This is the System Versioned History File

--use [d1_IT]
--GO
--GRANT INSERT ON [dbo].[IP_InventoryHistory] TO [InventoryAdmin]
--GO
--use [d1_IT]
--GO
--GRANT REFERENCES ON [dbo].[IP_InventoryHistory] TO [InventoryAdmin]
--GO
--use [d1_IT]
--GO
--GRANT SELECT ON [dbo].[IP_InventoryHistory] TO [InventoryAdmin]
--GO
--use [d1_IT]
--GO
--GRANT UPDATE ON [dbo].[IP_InventoryHistory] TO [InventoryAdmin]
--GO
--use [d1_IT]
--GO
--GRANT VIEW CHANGE TRACKING ON [dbo].[IP_InventoryHistory] TO [InventoryAdmin]
--GO
--use [d1_IT]
--GO
--GRANT VIEW DEFINITION ON [dbo].[IP_InventoryHistory] TO [InventoryAdmin]
--GO

ALTER TABLE  [dbo].[T007_IP_Inventory_History] SET (SYSTEM_VERSIONING = OFF); 

