--CREATE_TABLE_Billable_Service_2017_02_23_v0.sql

USE [d1_Success]
GO

/****** Object:  Table [dbo].[Billable_Service_2017_02_23]    Script Date: 2/23/2017 11:30:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Billable_Service_2017_02_23](
	[Field1] [nvarchar](255) NULL,
	[CHECKMONTH] [nvarchar](255) NULL,
	[Office Location] [nvarchar](255) NULL,
	[Office Name] [nvarchar](255) NULL,
	[Bill Provider Name] [nvarchar](255) NULL,
	[Bill Provider Specialty] [nvarchar](255) NULL,
	[Provider Type] [nvarchar](255) NULL,
	[Patient Name] [nvarchar](255) NULL,
	[Patient #] [float] NULL,
	[Patient Birth Date] [datetime] NULL,
	[Check-In Day] [datetime] NULL,
	[Check-Out Day] [datetime] NULL,
	[CPT Code] [nvarchar](255) NULL,
	[Service] [nvarchar](255) NULL,
	[CPT Description] [nvarchar](255) NULL,
	[Unit Qty] [float] NULL,
	[Field17] [nvarchar](255) NULL,
	[Field18] [nvarchar](255) NULL
) ON [PRIMARY]

GO


