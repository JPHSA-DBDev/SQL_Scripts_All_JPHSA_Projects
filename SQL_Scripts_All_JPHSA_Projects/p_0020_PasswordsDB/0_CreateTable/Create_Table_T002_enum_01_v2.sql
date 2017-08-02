--Create_Table_T002_enum_01_v2.sql


USE [d1_IT]
GO

/****** Object:  Table [dbo].[T002_enum_01]    Script Date: 2/21/2017 1:43:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T002_enum_01](
	[T002_enum_01_Value] [int] NOT NULL,
	[T002_enum_01_Description] [nvarchar](255) NOT NULL,
	[T002_enum_01_PK] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [uniqueValues$T002_enum_01_Value] UNIQUE NONCLUSTERED 
(
	[T002_enum_01_Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


