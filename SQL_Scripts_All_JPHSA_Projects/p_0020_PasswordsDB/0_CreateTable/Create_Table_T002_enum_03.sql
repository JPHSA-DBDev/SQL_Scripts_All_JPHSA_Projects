--Create_Table_T002_enum_03.sql

USE [d1_IT]
GO

/****** Object:  Table [dbo].[T002_enum_03]    Script Date: 2/20/2017 4:13:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T002_enum_03](
	[T002_enum_03_PK] [int] NOT NULL,
	[T002_enum_03_Value] [int] NULL,
	[T002_enum_03_Description] [nvarchar](255) NULL
) ON [PRIMARY]

GO

alter table [dbo].[T002_enum_03]
	DROP COLUMN [T002_enum_03_PK]

alter table [dbo].[T002_enum_03]
	Add [T002_enum_03_PK] [int] IDENTITY(1,1) NOT NULL


ALTER TABLE [dbo].[T002_enum_03] ALTER COLUMN [T002_enum_03_Value] [int] NOT NULL

ALTER TABLE [dbo].[T002_enum_03] ALTER COLUMN [T002_enum_03_Description] [nvarchar](255) NOT NULL


ALTER TABLE [dbo].[T002_enum_03]
  ADD CONSTRAINT uniqueValues$T002_enum_03_Value UNIQUE NONCLUSTERED ([T002_enum_03_Value])