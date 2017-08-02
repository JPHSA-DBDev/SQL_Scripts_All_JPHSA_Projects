--p_0003_CREATE_TABLE_T006_Monitor_Inventory_v0.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 05/10/2017
	By: glenn garson
	************************************************************************************
*/

USE [d1_IT]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.T006_Monitor_Inventory') IS NOT NULL
    DROP TABLE dbo.T006_Monitor_Inventory

go

CREATE TABLE [dbo].[T006_Monitor_Inventory](

			[T006_Monitor_Inventory_PK] [int] IDENTITY(1,1) NOT NULL,

			[JPHSA_Tag] [nvarchar](25) NULL,
			[Monitor_Size] [nvarchar](25) NULL,
			[Vendor_Service_Tag] [nvarchar](25) NULL,
			[Model_Brand] [nvarchar](255) NULL,
			[Comment] [nvarchar](255) NULL,
			[Building_T005_e2] int NOT NULL  CONSTRAINT TypeStatus_T005_e2_Default_ZERO DEFAULT(0),
			[Building_T005_e2_Description] [nvarchar](255) NULL,
			[Project] [nvarchar](255) NULL,
			[DeviceStatus_T005_e3] int NOT NULL  CONSTRAINT TypeStatus_T005_e3_Default_ZERO DEFAULT(0),
			[DeviceStatus_T005_e3_Description] [nvarchar](255) NULL,


			CreateRecord_dateTime datetime,
			CreateRecord_name sysname,
			UpdateRecord_dateTime datetime,
			UpdateRecord_name sysname,
		
			--[DateTime_RecordCreated] [datetime] NOT NULL CONSTRAINT T006_TheDateTime_Default_GETDATE DEFAULT GETDATE(),

			[T006_RowVersion] [timestamp] NULL,
			CONSTRAINT [T006_Monitor_Inventory$T006_PK] PRIMARY KEY NONCLUSTERED 
				(
					[T006_Monitor_Inventory_PK] ASC
				)
				WITH 
						(
							PAD_INDEX  = OFF, 
							STATISTICS_NORECOMPUTE  = OFF, 
							IGNORE_DUP_KEY = OFF, 
							ALLOW_ROW_LOCKS  = ON, 
							ALLOW_PAGE_LOCKS  = ON
						) ON [PRIMARY]
		) ON [PRIMARY]
		GO

		SET ANSI_PADDING OFF
		GO


-- insert/update dates
alter table T006_Monitor_Inventory
    add constraint [T006_CreateRecord_dateTime] default (getdate()) for CreateRecord_dateTime;
alter table T006_Monitor_Inventory
    add constraint [T006_UpdateRecord_dateTime] default (getdate()) for UpdateRecord_dateTime;

-- insert/update names
alter table T006_Monitor_Inventory
    add constraint [T006_CreateRecord_name] default (coalesce(suser_sname(),'?')) for CreateRecord_name;

alter table T006_Monitor_Inventory
    add constraint [T006_UpdateRecord_name] default (coalesce(suser_sname(),'?')) for UpdateRecord_name;
go

--For updates, but the inserted and deleted tables exist. I choose to join on the inserted for the update.

-- create the update trigger
create trigger TRG_001_recordChanged_T006 on dbo.T006_Monitor_Inventory
for update
as
begin

    -- nothing to do?
    if (@@rowcount = 0)
      return;

    update d
    set 
       UpdateRecord_dateTime = getdate(),
       UpdateRecord_name = (coalesce(suser_sname(),'?'))
    from
       T006_Monitor_Inventory d join inserted i 
    on 
       d.[T006_Monitor_Inventory_PK] = i.[T006_Monitor_Inventory_PK];

end
go
			

-- added unique constraint 6/26/2017
ALTER TABLE [dbo].[T006_Monitor_Inventory]
  ADD CONSTRAINT uniqueValues$T006_JPHSA_Tag_Value UNIQUE NONCLUSTERED ([JPHSA_Tag])