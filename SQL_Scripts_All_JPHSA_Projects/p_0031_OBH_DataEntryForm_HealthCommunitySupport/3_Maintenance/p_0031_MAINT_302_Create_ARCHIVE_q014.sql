--p_0031_MAINT_302_Create_ARCHIVE_q014.sql

use OBH_DATA_REVIEW
go

DECLARE @DateSentToOBH as DATE
SELECT @DateSentToOBH = '08-01-2017'

SELECT 
	   [TheDataSource]
      ,[Archive_flag]
      ,[Archived_LAST_flag]
      ,[Service_PK]
      ,[Demo_FK]
      ,[SERV_DATE]
      ,[PV_SERV]
      ,[SERVICE]
	  ,CONVERT(date, getdate()) as ARCHIVE_Date
	  ,CONVERT(time, getdate()) as ARCHIVE_Time
	  ,@DateSentToOBH as DateSentToOBH
  INTO ARCHIVE_q014
  FROM [OBH_DATA_REVIEW].[dbo].[zzz_q014_ALL]