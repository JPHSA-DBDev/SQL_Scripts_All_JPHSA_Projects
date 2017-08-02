--CREATE_TABLE_t2_LKNONBILL_v0.sql

USE [d1_Success]
GO

/****** Object:  Table [dbo].[t2_LKNONBILL]    Script Date: 2/23/2017 11:28:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t2_LKNONBILL](
	[Encounter Reasons] [nvarchar](50) NULL,
	[ID] [int] NOT NULL,
	[NB] [nvarchar](1) NULL
) ON [PRIMARY]

GO


