--p_0031_MAINT_303_Create_ARCHIVE_T001.sql

use OBH_DATA_REVIEW
go

DECLARE @DateSentToOBH as DATE
SELECT @DateSentToOBH = '08-01-2017'

SELECT 
	   [TheDataSource]
      ,[DEMO_PK]
      ,[NAME_F]
      ,[NAME_L]
      ,[NAME_M]
      ,[DOB]
      ,[SSN]
      ,[CITY]
      ,[ZIP]
      ,[GENDER]
      ,[RACE]
      ,[ETHNICITY]
      ,[SEXUAL_ORIENTATION]
      ,[HH_INCOME_1]
      ,[INC_WAGE]
      ,[IRS_DEP_NUM]
      ,[LANGUAGE1]
      ,[VA_ST]
	  ,CONVERT(date, getdate()) as ARCHIVE_Date
	  ,CONVERT(time, getdate()) as ARCHIVE_Time
	  ,@DateSentToOBH as DateSentToOBH
  INTO ARCHIVE_T001
  FROM [OBH_DATA_REVIEW].[dbo].[zzz_T001_ALL]