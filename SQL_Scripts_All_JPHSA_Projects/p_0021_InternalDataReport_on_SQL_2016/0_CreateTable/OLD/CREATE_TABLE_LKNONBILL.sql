--new
CREATE TABLE [dbo].[LKNONBILL] (
	[Encounter_Reasons] [varchar] (80) NULL ,
	[NB] [varchar] (1) NULL 
) ON [PRIMARY]
GO



--ORIG
CREATE TABLE [dbo].[LKNONBILL] (
	[Encounter Reasons] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NB] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

