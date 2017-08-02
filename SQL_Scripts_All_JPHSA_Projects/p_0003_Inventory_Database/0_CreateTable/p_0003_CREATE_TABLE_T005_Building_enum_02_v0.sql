--p_0003_CREATE_TABLE_T005_Building_enum_02_v0.sql
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

/****** Object:  Table [dbo].[T005_Building_enum_02]    Script Date: 5/9/2017 3:38:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.T005_Building_enum_02') IS NOT NULL
    DROP TABLE dbo.T005_Building_enum_02

go


CREATE TABLE [dbo].[T005_Building_enum_02](
	[T005_Building_enum_02_PK] [int] IDENTITY(1,1) NOT NULL,
	[T005_Building_enum_02_Value] [int] NOT NULL,
	[T005_Building_enum_02_Description] [nvarchar](255) NOT NULL,
 CONSTRAINT [uniqueValues$T005_Building_enum_02_Value] UNIQUE NONCLUSTERED 
(
	[T005_Building_enum_02_Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [T005_Building_enum_02] ADD CONSTRAINT [T005_Building_enum_02$T005_Building_enum_02_PK] PRIMARY KEY CLUSTERED
([T005_Building_enum_02_PK] ASC)
GO

ALTER TABLE [dbo].[T005_Building_enum_02]
ADD [T005_e2_Rowversion] Rowversion  NOT NULL

