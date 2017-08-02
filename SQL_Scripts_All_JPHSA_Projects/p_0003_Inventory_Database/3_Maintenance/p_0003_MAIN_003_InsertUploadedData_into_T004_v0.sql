--p_0003_MAIN_003_InsertUploadedData_into_T004_v0.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 05/16/2017
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

			[T004_IP_Inventory_PK] [int] IDENTITY(1,1) NOT NULL,

			[JPHSA_Tag] [nvarchar](25) NULL,
			[Monitor-1_FK] INT NULL,
			[Monitor-2_FK] INT NULL,
			[Monitor-3_FK] INT NULL,
			[Vendor_Service_Tag] [nvarchar](25) NULL,
			[Room_Number] [nvarchar](25) NULL,
			[User] [nvarchar](255) NULL,
			[Group] [nvarchar](255) NULL,
			[Location] [nvarchar](25) NULL,
			[DeviceType_T005_e1] int NOT NULL  CONSTRAINT DeviceType_T005_e1_Default_ZERO DEFAULT(0),
			[DeviceType_T005_e1_Description] [nvarchar](255) NULL,	--Use this while setting it up, then remove this field 
			[Model_Brand] [nvarchar](255) NULL,
			[Comment] [nvarchar](255) NULL,
			[Building_T005_e2] int NOT NULL  CONSTRAINT DeviceType_T005_e2_Default_ZERO DEFAULT(0),
			[Building_T005_e2_Description] [nvarchar](255) NULL,
			[Project] [nvarchar](255) NULL,
			[DeviceStatus_T005_e3] int NOT NULL  CONSTRAINT DeviceType_T005_e3_Default_ZERO DEFAULT(0),
			[DeviceStatus_T005_e3_Description] [nvarchar](255) NULL,


			CreateRecord_dateTime datetime,
			CreateRecord_name sysname,
			UpdateRecord_dateTime datetime,
			UpdateRecord_name sysname,
		
			--[DateTime_RecordCreated] [datetime] NOT NULL CONSTRAINT T004_TheDateTime_Default_GETDATE DEFAULT GETDATE(),

			[T004_RowVersion] [timestamp] NULL,
			CONSTRAINT [T004_IP_Inventory$T004_PK] PRIMARY KEY NONCLUSTERED 
				(
					[T004_IP_Inventory_PK] ASC
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
       d.T004_IP_Inventory_PK = i.T004_IP_Inventory_PK;

end
go
--========================================================

;
WITH cte_1
AS
(
	SELECT 
			[Tag] AS [JPHSA_Tag]
			-----------------1] NEED to get the Monitor FK
			,( Select [T006_Monitor_Inventory_PK]
				FROM [d1_IT].[dbo].[T006_Monitor_Inventory] f
				WHERE [Monitor_Tag-1]= f.JPHSA_Tag) as [Monitor-1_FK]
			,( Select [T006_Monitor_Inventory_PK]
				FROM [d1_IT].[dbo].[T006_Monitor_Inventory] f
				WHERE [Monitor_Tag-2]= f.JPHSA_Tag) as [Monitor-2_FK]
			------------------------------------------
			,[Service_Tag] AS [Vendor_Service_Tag]
			,[Room_No] as [Room_Number]
			,[User]
			,[Group]
			,[Location]
			,[Type] as [DeviceType_T005_e1_Description]
			,[Model_Brand]
			,[Comment]
			,[Building] as [Building_T005_e2_Description]
			,[Project]
			,[Status] as [DeviceStatus_T005_e3_Description]

	  FROM [d1_IT].[dbo].[zzzMarcos_2017_05_15]
	  where LTRIM(RTrim([Type])) <> 'Mon'	

)

INSERT INTO [d1_IT].[dbo].[T004_IP_Inventory]   --<============== APPEND to existing table
		(
			  [JPHSA_Tag]
			  ,[Monitor-1_FK]
			  ,[Monitor-2_FK]
			  ,[Vendor_Service_Tag]
			  ,[Room_Number]
			  ,[User]
			  ,[Group]
			  ,[Location]
			  ,[DeviceType_T005_e1_Description]
			  ,[Model_Brand]
			  ,[Comment]
			  ,[Building_T005_e2_Description]
			  ,[Project]
			  ,[DeviceStatus_T005_e3_Description]
		)
SELECT DISTINCT
			[JPHSA_Tag]

			,[Monitor-1_FK]
			,[Monitor-2_FK]
			------------------------------------------
			,[Vendor_Service_Tag]
			,[Room_Number]
			,[User]
			,[Group]
			,[Location]
			, [DeviceType_T005_e1_Description]
			,[Model_Brand]
			,[Comment]
			,[Building_T005_e2_Description]
			,[Project]
			,[DeviceStatus_T005_e3_Description]
FROM cte_1 
	


