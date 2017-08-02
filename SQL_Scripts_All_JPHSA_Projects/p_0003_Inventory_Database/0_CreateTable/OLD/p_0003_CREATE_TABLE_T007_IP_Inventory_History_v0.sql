--p_0003_CREATE_TABLE_T007_IP_Inventory_History_v0.sql
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

IF OBJECT_ID('dbo.T007_IP_Inventory_History') IS NOT NULL
    DROP TABLE dbo.T007_IP_Inventory_History

go


CREATE TABLE [dbo].[T007_IP_Inventory_History](
	[T007_PK] [int] IDENTITY(1,1) NOT NULL,
	[T004_IP_Inventory_FK] [int] NULL,
	[Note] [ntext] NULL,
	[DateCreated] [datetime] NULL,
	[T007_IP_Inventory_History_RowVersion] [timestamp] NULL,
 CONSTRAINT [T007_IP_Inventory_History$T007_IP_Inventory_History_PK] PRIMARY KEY NONCLUSTERED 
(
	[T007_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[T007_IP_Inventory_History] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[T007_IP_Inventory_History]  WITH CHECK ADD  CONSTRAINT [T007_IP_Inventory_History_FK_00] FOREIGN KEY([T004_IP_Inventory_FK])
REFERENCES [dbo].[T004_IP_Inventory] ([T004_IP_Inventory_PK])
GO

ALTER TABLE [dbo].[T007_IP_Inventory_History] CHECK CONSTRAINT [T007_IP_Inventory_History_FK_00]
GO