--CREATE_TABLE_NON_Billable_Service_2017_02_23_v0.sql

USE [d1_Success]
GO

/****** Object:  Table [dbo].[NON_Billable_Service_2017_02_23]    Script Date: 2/23/2017 11:31:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NON_Billable_Service_2017_02_23](
	[Field1] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL,
	[Date Encounter] [datetime] NULL,
	[Patient # (Chart)] [float] NULL,
	[Patient Birth Date (Chart)] [datetime] NULL,
	[Examining Clinician] [nvarchar](255) NULL,
	[Chp Encounter Id] [float] NULL,
	[Billable Encounter ID] [nvarchar](255) NULL,
	[Reason for Encounter] [nvarchar](255) NULL,
	[Encounter Type] [nvarchar](255) NULL,
	[Encounter Count] [float] NULL,
	[Field12] [nvarchar](255) NULL,
	[Field13] [nvarchar](255) NULL
) ON [PRIMARY]

GO


