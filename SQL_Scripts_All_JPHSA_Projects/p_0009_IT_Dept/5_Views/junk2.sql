/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [sn]
      ,[facsimileTelephoneNumber]
      ,[telephoneNumber]
      ,[givenName]
      ,[sAMAccountName]
      ,[displayName]
      ,[title]
      ,[cn]
      ,[createTimeStamp]
      ,[department]
      ,[distinguishedName]
      ,[employeeID]
      ,[homeDirectory]
      ,[homeDrive]
      ,[info]
      ,[isDeleted]
	  --,[lastLogon]
	  , (SELECT 'TheCalculation' =  
										case when ( ([lastLogon] = '') OR ([lastLogon] = '0') OR ([lastLogon] is null) ) then NULL
										else dateadd(mi,(cast([lastLogon] as BIGINT)/600000000) - 157258080 + DATEDIFF(Minute,GetUTCDate(),GetDate()),0)										
										end
	    ) AS [LastLogon]
	  --, (SELECT 'TheCalculation' =  
			--							case when ( ([lockoutTime] = '') OR ([lockoutTime] = '0') OR ([lockoutTime] is null) ) then NULL
			--							else dateadd(mi,(cast([lockoutTime] as BIGINT)/600000000) - 157258080 + DATEDIFF(Minute,GetUTCDate(),GetDate()),0)										
			--							end
	  --  ) AS [lockoutTime]
		--,[lockoutTime]
     -- ,([lastLogon] / 864000000000.0) as JUNK
	 --, CAST((([lastLogon] / 864000000000.0) - 109207) AS DATETIME) AS LastLogon
  FROM [d1_IT].[dbo].[p_0004_vw_001_AD_USER_INFO]
  --WHERE givenName like '%Glenn%'