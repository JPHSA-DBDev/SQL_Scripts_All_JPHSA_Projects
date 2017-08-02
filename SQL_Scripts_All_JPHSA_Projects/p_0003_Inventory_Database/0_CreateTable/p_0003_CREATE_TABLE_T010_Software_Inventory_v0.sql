--p_0003_CREATE_TABLE_T010_Software_Inventory_v0.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 08/02/2017
	By: glenn garson
	************************************************************************************
*/
--use JUNK
USE [d1_IT]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.T010_Software_Inventory') IS NOT NULL
    DROP TABLE dbo.T010_Software_Inventory

--go
CREATE TABLE [dbo].[T010_Software_Inventory](

	[T010_Software_Inventory_PK] [int] IDENTITY(1,1) NOT NULL,

	[Software_Company] [nvarchar](255) NULL,
	[Name_of_Software] [nvarchar](255) NULL,
	[Version] [nvarchar](255) NULL,
	[JPHSA_Owner] [nvarchar](255) NULL,
	[Registered_To] [nvarchar](max) NULL,
	[Number_of_Licenses_Purchased] [nvarchar](255) NULL,
	[Key_1] [nvarchar](255) NULL,
	[Key_2] [nvarchar](255) NULL,
	[Key_3] [nvarchar](255) NULL,
	[IT_Notes] [nvarchar](max) NULL,
	[Key_4] [nvarchar](255) NULL,
	[Key_5] [nvarchar](255) NULL,


			CreateRecord_dateTime datetime,
			CreateRecord_name sysname,
			UpdateRecord_dateTime datetime,
			UpdateRecord_name sysname,
		
			--[DateTime_RecordCreated] [datetime] NOT NULL CONSTRAINT T010_TheDateTime_Default_GETDATE DEFAULT GETDATE(),

			[T010_RowVersion] [timestamp] NULL,
			CONSTRAINT [T010_Software_Inventory$T010_PK] PRIMARY KEY NONCLUSTERED 
				(
					[T010_Software_Inventory_PK] ASC
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
alter table T010_Software_Inventory
    add constraint [T010_CreateRecord_dateTime] default (getdate()) for CreateRecord_dateTime;
alter table T010_Software_Inventory
    add constraint [T010_UpdateRecord_dateTime] default (getdate()) for UpdateRecord_dateTime;

-- insert/update names
alter table T010_Software_Inventory
    add constraint [T010_CreateRecord_name] default (coalesce(suser_sname(),'?')) for CreateRecord_name;

alter table T010_Software_Inventory
    add constraint [T010_UpdateRecord_name] default (coalesce(suser_sname(),'?')) for UpdateRecord_name;
go

--For updates, but the inserted and deleted tables exist. I choose to join on the inserted for the update.

-- create the update trigger
create trigger TRG_001_recordChanged_T010 on dbo.T010_Software_Inventory
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
       T010_Software_Inventory d join inserted i 
    on 
       d.T010_Software_Inventory_PK = i.T010_Software_Inventory_PK;

end


