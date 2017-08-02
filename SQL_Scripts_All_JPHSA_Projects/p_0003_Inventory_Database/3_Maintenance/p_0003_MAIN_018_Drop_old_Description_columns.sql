--p_0003_MAIN_018_Drop_old_Description_columns.sql

--These are the original columns from before the enums were implemented

ALTER TABLE [d1_IT].[dbo].[T004_IP_Inventory] DROP COLUMN IF EXISTS [DeviceType_T005_e1_Description]
ALTER TABLE [d1_IT].[dbo].[T004_IP_Inventory] DROP COLUMN IF EXISTS [Building_T005_e2_Description]
ALTER TABLE [d1_IT].[dbo].[T004_IP_Inventory] DROP COLUMN IF EXISTS [DeviceStatus_T005_e3_Description]

ALTER TABLE [d1_IT].[dbo].[T006_Monitor_Inventory] DROP COLUMN IF EXISTS [Building_T005_e2_Description]
ALTER TABLE [d1_IT].[dbo].[T006_Monitor_Inventory] DROP COLUMN IF EXISTS [DeviceStatus_T005_e3_Description]

go