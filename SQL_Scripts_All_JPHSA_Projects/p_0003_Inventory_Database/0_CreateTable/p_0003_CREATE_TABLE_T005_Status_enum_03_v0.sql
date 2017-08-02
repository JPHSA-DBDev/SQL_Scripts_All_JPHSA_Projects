--p_0003_CREATE_TABLE_T005_DeviceStatus_enum_03_v0.sql
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

IF OBJECT_ID('dbo.T005_DeviceStatus_enum_03') IS NOT NULL
    DROP TABLE dbo.T005_DeviceStatus_enum_03

go


CREATE TABLE [dbo].[T005_DeviceStatus_enum_03](
	[T005_DeviceStatus_enum_03_PK] [int] IDENTITY(1,1) NOT NULL,
	[T005_DeviceStatus_enum_03_Value] [int] NOT NULL,
	[T005_DeviceStatus_enum_03_Description] [nvarchar](255) NOT NULL,
 CONSTRAINT [uniqueValues$T005_DeviceStatus_enum_03_Value] UNIQUE NONCLUSTERED 
(
	[T005_DeviceStatus_enum_03_Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [T005_DeviceStatus_enum_03] ADD CONSTRAINT [T005_DeviceStatus_enum_03$T005_DeviceStatus_enum_03_PK] PRIMARY KEY CLUSTERED
([T005_DeviceStatus_enum_03_PK] ASC)
GO
-- 

ALTER TABLE [dbo].[T005_DeviceStatus_enum_03]
ADD [T005_e3_Rowversion] Rowversion  NOT NULL


