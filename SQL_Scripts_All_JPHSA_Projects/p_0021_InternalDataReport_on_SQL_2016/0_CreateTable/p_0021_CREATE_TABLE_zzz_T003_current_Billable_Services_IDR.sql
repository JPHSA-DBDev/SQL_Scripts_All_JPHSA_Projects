--p_0021_CREATE_TABLE_zzz_T003_current_Billable_Services_IDR.sql

USE [Success]
GO

/****** Object:  Table [dbo].[zzz_T003_current_Billable_Services_IDR]    Script Date: 5/16/2017 3:21:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[zzz_T003_current_Billable_Services_IDR](
	[T003_PK] [int] IDENTITY(1,1) NOT NULL,
	[Data_for_Month_MM] [nvarchar](2) NULL,
	[Data_for_Year_YYYY] [nvarchar](4) NULL,
	[CHECKMONTH] [nvarchar](25) NULL,
	[Office_Location] [nvarchar](50) NULL,
	[Office_Name] [nvarchar](100) NULL,
	[Bill_Provider_Name] [nvarchar](100) NULL,
	[Bill_Provider_Specialty] [nvarchar](100) NULL,
	[Provider_Type] [nvarchar](255) NULL,
	[Patient_Name] [nvarchar](100) NULL,
	[Patient_No] [int] NULL,
	[Patient_Birth_Date] [date] NULL,
	[Check-In_Day] [date] NULL,
	[Check-Out_Day] [date] NULL,
	[CPT_Code] [nvarchar](15) NULL,
	[Service] [nvarchar](255) NULL,
	[CPT_Description] [nvarchar](255) NULL,
	[Unit_Qty] [int] NULL,
	[LOC] [nvarchar](2) NULL,
	[Age_as_of_Check-In] [int] NULL,
	[Adult] [bit] NULL,
	[T003_RowVersion] [timestamp] NULL,
 CONSTRAINT [zzz_T003_current_Billable_Services_IDR$T003_PK] PRIMARY KEY NONCLUSTERED 
(
	[T003_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[zzz_T003_current_Billable_Services_IDR] ADD  CONSTRAINT [zzz_T003_current_Billable_Services_IDR$Default$Zero]  DEFAULT ((0)) FOR [Adult]
GO


