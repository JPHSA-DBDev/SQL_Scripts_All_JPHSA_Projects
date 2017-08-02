--p_0031_RES_903_STEP_2__zzz_q013_ALL__v0.sql

IF OBJECT_ID('dbo.zzz_q013_ALL') IS NOT NULL
    DROP TABLE dbo.zzz_q013_ALL

go

CREATE TABLE [dbo].[zzz_q013_ALL](
	[TheDataSource] [Nvarchar](255) NOT NULL,
	[Archive_flag] [bit] NOT NULL,
	[Episode_PK] [INT] NULL,
	[Demo_FK] [INT] NULL,
	[ASSIGN_PV] [nvarchar](255) NULL,
	[ASSESS_DT] [datetime] NULL,
	[PROGRAM_TYPE] [nvarchar](255) NULL,
	[SERV_PROGRAM] [nvarchar](255) NULL,
	[AS_TP] [nvarchar](255) NULL,
	[CONT_RES] [nvarchar](255) NULL,
	[DISPOSITON] [nvarchar](255) NULL,
	[SP_SMI] [nvarchar](255) NULL,
	[METHADONE] [nvarchar](255) NULL,
	[ARRESTS] [nvarchar](255) NULL,
	[ENCOUNTERS] [nvarchar](255) NULL,
	[FREQ_ATTEND] [nvarchar](255) NULL,
	[TERMTYPE] [nvarchar](255) NULL,
	[REF_SRCE] [nvarchar](255) NULL,
	[MARITAL_STATUS] [nvarchar](255) NULL,
	[LEGAL_STATUS] [nvarchar](255) NULL,
	[ED_LEVEL] [nvarchar](255) NULL,
	[EMPL_ST] [nvarchar](255) NULL,
	[RES_TYPE] [nvarchar](255) NULL,
	[HSE_COMP] [nvarchar](255) NULL,
	[PRIMARY_TARGET_GROUP] [nvarchar](255) NULL,
	[CP_ALCOHOL] [nvarchar](255) NULL,
	[CP_DRUGS] [nvarchar](255) NULL,
	[ADDICTIONTYPE] [nvarchar](255) NULL,
	[PRIOR_MH] [nvarchar](255) NULL,
	[PRIOR_TX_EPISODES] [INT] NULL,
	[DRUG_1] [nvarchar](255) NULL,
	[DRUG_1_AGE] [INT] NULL,
	[DRUG_1_FREQ] [nvarchar](255) NULL,
	[DRUG_1_RTE] [nvarchar](255) NULL,
	[DRUG_2] [nvarchar](255) NULL,
	[DRUG_2_AGE] [INT] NULL,
	[DRUG_2_FREQ] [nvarchar](255) NULL,
	[DRUG_2_RTE] [nvarchar](255) NULL,
	[DRUG_3] [nvarchar](255) NULL,
	[DRUG_3_AGE] [INT] NULL,
	[DRUG_3_FREQ] [nvarchar](255) NULL,
	[DRUG_3_RTE] [nvarchar](255) NULL,
	[DX_PRIMARY] [nvarchar](255) NULL,
	[DX_SEC] [nvarchar](255) NULL,
	[DX_3] [nvarchar](255) NULL,
	[DISABILITY_1] [nvarchar](255) NULL,
	[Archived_LAST_flag] [bit] NOT NULL
) ON [PRIMARY]

GO

INSERT INTO [zzz_q013_ALL]
SELECT 
	  'Donna_Doolen_20170727' as TheDataSource
	  ,[Archive_flag]
      ,[Episode_PK]
      ,[Demo_FK]
      ,[ASSIGN_PV]
      ,[ASSESS_DT]
      ,[PROGRAM_TYPE]
      ,[SERV_PROGRAM]
      ,[AS_TP]
      ,[CONT_RES]
      ,[DISPOSITON]
      ,[SP_SMI]
      ,[METHADONE]
      ,[ARRESTS]
      ,[ENCOUNTERS]
      ,[FREQ_ATTEND]
      ,[TERMTYPE]
      ,[REF_SRCE]
      ,[MARITAL_STATUS]
      ,[LEGAL_STATUS]
      ,[ED_LEVEL]
      ,[EMPL_ST]
      ,[RES_TYPE]
      ,[HSE_COMP]
      ,[PRIMARY_TARGET_GROUP]
      ,[CP_ALCOHOL]
      ,[CP_DRUGS]
      ,[ADDICTIONTYPE]
      ,[PRIOR_MH]
      ,[PRIOR_TX_EPISODES]
      ,[DRUG_1]
      ,[DRUG_1_AGE]
      ,[DRUG_1_FREQ]
      ,[DRUG_1_RTE]
      ,[DRUG_2]
      ,[DRUG_2_AGE]
      ,[DRUG_2_FREQ]
      ,[DRUG_2_RTE]
      ,[DRUG_3]
      ,[DRUG_3_AGE]
      ,[DRUG_3_FREQ]
      ,[DRUG_3_RTE]
      ,[DX_PRIMARY]
      ,[DX_SEC]
      ,[DX_3]
      ,[DISABILITY_1]
      ,[Archived_LAST_flag]
  FROM [OBH_DATA_REVIEW].[dbo].[aaa_q013_Donna_Doolen_20170727]


INSERT INTO [zzz_q013_ALL]
SELECT 
	  'Jen_Bruchi_20170724' as TheDataSource
	  ,[Archive_flag]
      ,[Episode_PK]
      ,[Demo_FK]
      ,[ASSIGN_PV]
      ,[ASSESS_DT]
      ,[PROGRAM_TYPE]
      ,[SERV_PROGRAM]
      ,[AS_TP]
      ,[CONT_RES]
      ,[DISPOSITON]
      ,[SP_SMI]
      ,[METHADONE]
      ,[ARRESTS]
      ,[ENCOUNTERS]
      ,[FREQ_ATTEND]
      ,[TERMTYPE]
      ,[REF_SRCE]
      ,[MARITAL_STATUS]
      ,[LEGAL_STATUS]
      ,[ED_LEVEL]
      ,[EMPL_ST]
      ,[RES_TYPE]
      ,[HSE_COMP]
      ,[PRIMARY_TARGET_GROUP]
      ,[CP_ALCOHOL]
      ,[CP_DRUGS]
      ,[ADDICTIONTYPE]
      ,[PRIOR_MH]
      ,[PRIOR_TX_EPISODES]
      ,[DRUG_1]
      ,[DRUG_1_AGE]
      ,[DRUG_1_FREQ]
      ,[DRUG_1_RTE]
      ,[DRUG_2]
      ,[DRUG_2_AGE]
      ,[DRUG_2_FREQ]
      ,[DRUG_2_RTE]
      ,[DRUG_3]
      ,[DRUG_3_AGE]
      ,[DRUG_3_FREQ]
      ,[DRUG_3_RTE]
      ,[DX_PRIMARY]
      ,[DX_SEC]
      ,[DX_3]
      ,[DISABILITY_1]
      ,[Archived_LAST_flag]
  FROM [OBH_DATA_REVIEW].[dbo].[aaa_q013_Jen_Bruchi_20170724]