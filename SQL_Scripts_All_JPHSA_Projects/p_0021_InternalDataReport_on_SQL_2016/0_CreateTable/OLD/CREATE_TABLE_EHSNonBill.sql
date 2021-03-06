--New:
CREATE TABLE [dbo].[EHSNONBILL] (
	[Location] [varchar] (10) NULL ,
	[Date Encounter] [datetime] NOT NULL ,   --<=== not sure about NOT NULL/NULL
	[Patient_Chart_Number] [int] NULL ,
	[Patient_Birth_Date] [datetime] NULL ,  --<=== not sure about NOT NULL/NULL
	[Examining_Clinician] [varchar] (80) NULL ,
	[Chp_Encounter_Id] int  NULL ,	--unique database ID given to all billable and nonbillable encounters
	[Billable_Encounter_ID] [varchar] (80)  NULL ,	--this field's value is NULL
	[Reason_for_Encounter] [varchar] (80)  NULL ,
	[Encounter_Type] [varchar] (80) NULL ,
	[Encounter_Count] INT NULL    --<=== not sure about NOT NULL/NULL
) ON [PRIMARY]
GO




--ORIG
CREATE TABLE [dbo].[EHSNONBILL] (
	[Location] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Date Encounter] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Patient # (Chart)] [int] NULL ,
	[Patient Birth Date (Chart)] [datetime] NULL ,
	[Examining Clinician] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Chp Encounter Id] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Billable Encounter ID] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Reason for Encounter] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Encounter Type] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Encounter Count] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

