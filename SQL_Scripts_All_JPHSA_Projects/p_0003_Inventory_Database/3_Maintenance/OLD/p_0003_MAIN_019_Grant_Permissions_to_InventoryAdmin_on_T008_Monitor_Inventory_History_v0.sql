--p_0003_MAIN_019_Grant_Permissions_to_InventoryAdmin_on_T008_Monitor_Inventory_History_v0.sql

--use [d1_IT]
--GO
--GRANT INSERT ON [dbo].[T008_Monitor_Inventory_History] TO [InventoryAdmin]
--GO
--use [d1_IT]
--GO
--GRANT REFERENCES ON [dbo].[T008_Monitor_Inventory_History] TO [InventoryAdmin]
--GO
--use [d1_IT]
--GO
--GRANT SELECT ON [dbo].[T008_Monitor_Inventory_History] TO [InventoryAdmin]
--GO
--use [d1_IT]
--GO
--GRANT UPDATE ON [dbo].[T008_Monitor_Inventory_History] TO [InventoryAdmin]
--GO
--use [d1_IT]
--GO
--GRANT VIEW CHANGE TRACKING ON [dbo].[T008_Monitor_Inventory_History] TO [InventoryAdmin]
--GO
--use [d1_IT]
--GO
--GRANT VIEW DEFINITION ON [dbo].[T008_Monitor_Inventory_History] TO [InventoryAdmin]
GO
ALTER TABLE  [dbo].[T008_Monitor_Inventory_History] SET (SYSTEM_VERSIONING = OFF); 