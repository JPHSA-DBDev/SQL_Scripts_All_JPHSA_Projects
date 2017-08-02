--p_0003_CREATE_TABLE_T005_DeviceType_enum_01_v0.sql
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

IF OBJECT_ID('dbo.T005_DeviceType_enum_01') IS NOT NULL
    DROP TABLE dbo.T005_DeviceType_enum_01

go


CREATE TABLE [dbo].[T005_DeviceType_enum_01](
	[T005_DeviceType_enum_01_PK] [int] IDENTITY(1,1) NOT NULL,
	[T005_DeviceType_enum_01_Value] [int] NOT NULL,
	[T005_DeviceType_enum_01_Description] [nvarchar](255) NOT NULL,
 CONSTRAINT [uniqueValues$T005_DeviceType_enum_01_Value] UNIQUE NONCLUSTERED 
(
	[T005_DeviceType_enum_01_Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [T005_DeviceType_enum_01] ADD CONSTRAINT [T005_DeviceType_enum_01$T005_DeviceType_enum_01_PK] PRIMARY KEY CLUSTERED
([T005_DeviceType_enum_01_PK] ASC)
GO
-- 

ALTER TABLE [dbo].[T005_DeviceType_enum_01]
ADD [T005_e1_Rowversion] Rowversion  NOT NULL
