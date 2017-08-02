--CREATE_TABLE_t1_EHSPROD_v0.sql


USE [d1_Success]
GO

/****** Object:  Table [dbo].[t1_EHSPROD]    Script Date: 2/23/2017 11:25:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t1_EHSPROD](
	[ID] [int] NOT NULL,
	[Providername] [nvarchar](100) NULL,
	[Location] [nvarchar](2) NULL,
	[Type] [nvarchar](2) NULL,
	[Other] [nvarchar](10) NULL
) ON [PRIMARY]

GO


