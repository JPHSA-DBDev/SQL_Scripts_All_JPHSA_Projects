--p_0021_CREATE_TABLE_zzz_T004_current_NonBillable_Services_IDR.sql

USE [Success]
GO

/****** Object:  Table [dbo].[zzz_T004_current_NonBillable_Services_IDR]    Script Date: 5/16/2017 3:23:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[zzz_T004_current_NonBillable_Services_IDR](
	[T004_PK] [int] IDENTITY(1,1) NOT NULL,
	[Data_for_Month_MM] [nvarchar](2) NULL,
	[Data_for_Year_YYYY] [nvarchar](4) NULL,
	[Location] [nvarchar](50) NULL,
	[Date_Encounter] [date] NULL,
	[Patient_No__Chart] [int] NULL,
	[Patient_Birth_Date__Chart] [date] NULL,
	[Examining_Clinician] [nvarchar](100) NULL,
	[Chp_Encounter_Id] [bigint] NULL,
	[Billable_Encounter_ID] [nvarchar](25) NULL,
	[Reason_for_Encounter] [nvarchar](255) NULL,
	[Encounter_Type] [nvarchar](50) NULL,
	[Encounter_Count] [int] NULL,
	[NonBillable_Type] [nvarchar](2) NULL,
	[Age_as_of_Date_Encounter] [int] NULL,
	[Adult] [bit] NULL,
	[T004_RowVersion] [timestamp] NULL,
 CONSTRAINT [zzz_T004_current_NonBillable_Services_IDR$T004_PK] PRIMARY KEY NONCLUSTERED 
(
	[T004_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[zzz_T004_current_NonBillable_Services_IDR] ADD  CONSTRAINT [zzz_T004_current_NonBillable_Services_IDR$Default$Zero]  DEFAULT ((0)) FOR [Adult]
GO


