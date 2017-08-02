--p_0003_CREATE_TABLE_T004_IP_Inventory_v0.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 05/09/2017
	By: glenn garson
	************************************************************************************
*/

USE [d1_IT]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.T004_IP_Inventory') IS NOT NULL
    DROP TABLE dbo.T004_IP_Inventory

go

CREATE TABLE [dbo].[T004_IP_Inventory](

			[T004_PK] [int] IDENTITY(1,1) NOT NULL,

			[Tag] [nvarchar](25) NULL,
			[Monitor_Tag-1] [nvarchar](25) NULL,
			[Monitor_Tag-2] [nvarchar](25) NULL,
			[Monitor_Tag-3] [nvarchar](25) NULL,
			[Monitor_Size] [nvarchar](25) NULL,
			[Service_Tag] [nvarchar](25) NULL,
			[Room_Number] [nvarchar](25) NULL,
			[User] [nvarchar](255) NULL,
			[Group] [nvarchar](255) NULL,
			[Location] [nvarchar](25) NULL,
			[Type_T005_e1] int NOT NULL  CONSTRAINT Type_T005_e1_Default_ZERO DEFAULT(0),
			[Type_T005_Description] [nvarchar](255) NULL,	--Use this while setting it up, then remove this field 
			[Model_Brand] [nvarchar](255) NULL,
			[Comment] [nvarchar](255) NULL,
			[Building_T005_e2] int NOT NULL  CONSTRAINT Type_T005_e2_Default_ZERO DEFAULT(0),
			[Building_T005_e2_Description] [nvarchar](255) NULL,
			[Project] [nvarchar](255) NULL,
			[Status_T005_e3] int NOT NULL  CONSTRAINT Type_T005_e3_Default_ZERO DEFAULT(0),
			[Status_T005_e3_Description] [nvarchar](255) NULL,


			CreateRecord_dateTime datetime,
			CreateRecord_name sysname,
			UpdateRecord_dateTime datetime,
			UpdateRecord_name sysname,
		
			--[DateTime_RecordCreated] [datetime] NOT NULL CONSTRAINT T004_TheDateTime_Default_GETDATE DEFAULT GETDATE(),

			[T004_RowVersion] [timestamp] NULL,
			CONSTRAINT [T004_IP_Inventory$T004_PK] PRIMARY KEY NONCLUSTERED 
				(
					[T004_PK] ASC
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
alter table T004_IP_Inventory
    add constraint [T004_CreateRecord_dateTime] default (getdate()) for CreateRecord_dateTime;
alter table T004_IP_Inventory
    add constraint [T004_UpdateRecord_dateTime] default (getdate()) for UpdateRecord_dateTime;

-- insert/update names
alter table T004_IP_Inventory
    add constraint [T004_CreateRecord_name] default (coalesce(suser_sname(),'?')) for CreateRecord_name;

alter table T004_IP_Inventory
    add constraint [T004_UpdateRecord_name] default (coalesce(suser_sname(),'?')) for UpdateRecord_name;
go

--For updates, but the inserted and deleted tables exist. I choose to join on the inserted for the update.

-- create the update trigger
create trigger TRG_001_recordChanged_T004 on dbo.T004_IP_Inventory
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
       T004_IP_Inventory d join inserted i 
    on 
       d.T004_PK = i.T004_PK;

end
go
			


