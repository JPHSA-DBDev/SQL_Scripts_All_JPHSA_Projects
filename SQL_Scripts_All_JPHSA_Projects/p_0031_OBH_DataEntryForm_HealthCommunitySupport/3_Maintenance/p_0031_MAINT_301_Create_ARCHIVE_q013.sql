--p_0031_MAINT_301_Create_ARCHIVE_q013.sql

use OBH_DATA_REVIEW
go

DECLARE @DateSentToOBH as DATE
SELECT @DateSentToOBH = '08-01-2017'

SELECT 
	  [TheDataSource]
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
	  ,CONVERT(date, getdate()) as ARCHIVE_Date
	  ,CONVERT(time, getdate()) as ARCHIVE_Time
	  ,@DateSentToOBH as DateSentToOBH
  INTO ARCHIVE_q013
  FROM [OBH_DATA_REVIEW].[dbo].[zzz_q013_ALL]