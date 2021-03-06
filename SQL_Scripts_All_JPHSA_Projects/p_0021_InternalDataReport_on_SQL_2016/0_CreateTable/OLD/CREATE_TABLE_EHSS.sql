
--NEW
CREATE TABLE [dbo].[EHSS] (
	[Patient_No] [int] NULL ,
	[Patient_Birth_Date] [datetime] NULL ,
	[Check-In_Day] [datetime] NULL ,
	[Service] [varchar] (50) NULL ,	--was: svc
	[Location] [varchar] (2) NULL ,	--was: loc
	[Bill Provider Name] [varchar] (80) NULL ,
	[Service_Type] [varchar] (2) NULL --was: Type
) ON [PRIMARY]
GO

--ORIG
CREATE TABLE [dbo].[EHSS] (
	[Patient #] [int] NULL ,
	[Patient Birth Date] [datetime] NULL ,
	[Check-In Day] [datetime] NULL ,
	[svc] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[loc] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Bill Provider Name] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Type] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

