--p_0003_CREATE_TABLE_T008_Monitor_History_v0.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 05/30/2017
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



IF OBJECT_ID('dbo.T008_Monitor_Inventory_History') IS NOT NULL
	ALTER TABLE T008_Monitor_Inventory_History SET (SYSTEM_VERSIONING = OFF)
    DROP TABLE dbo.T008_Monitor_Inventory_History

go

CREATE TABLE [dbo].[T008_Monitor_Inventory_History](
	[T008_PK] [int] IDENTITY(1,1) NOT NULL,
	[T006_Monitor_Inventory_FK] [int] NULL,
	[Note] [ntext] NULL,
	[DateCreated] [datetime] NULL,
	[T008_Monitor_Inventory_History_RowVersion] [timestamp] NULL,
	[TimeStart] [datetime2](2) GENERATED ALWAYS AS ROW START NOT NULL,
	[TimeEnd] [datetime2](2) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [T008_Monitor_Inventory_History$T008_Monitor_Inventory_History_PK] PRIMARY KEY NONCLUSTERED 
(
	[T008_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([TimeStart], [TimeEnd])
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[Monitor_InventoryHistory] )
)

GO

ALTER TABLE [dbo].[T008_Monitor_Inventory_History] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[T008_Monitor_Inventory_History]  WITH CHECK ADD  CONSTRAINT [T008_Monitor_Inventory_History_FK_00] FOREIGN KEY([T006_Monitor_Inventory_FK])
REFERENCES [dbo].[T006_Monitor_Inventory] ([T006_Monitor_Inventory_PK])
GO

ALTER TABLE [dbo].[T008_Monitor_Inventory_History] CHECK CONSTRAINT [T008_Monitor_Inventory_History_FK_00]
GO

ALTER TABLE  [dbo].[T008_Monitor_Inventory_History] SET (SYSTEM_VERSIONING = OFF); 
GO