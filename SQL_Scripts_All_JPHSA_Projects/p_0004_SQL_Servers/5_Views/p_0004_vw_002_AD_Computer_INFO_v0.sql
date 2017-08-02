--p_0004_vw_002_AD_Computer_INFO_v0.sql
--
use d1_IT
go

IF OBJECT_ID('p_0004_vw_002_AD_Computer_INFO', 'V') IS NOT NULL
DROP view p_0004_vw_002_AD_Computer_INFO
GO

CREATE  VIEW dbo.p_0004_vw_002_AD_Computer_INFO
AS

with CTE_ONE 
AS
(


SELECT * FROM OPENQUERY(ADSI, 
            'SELECT 
					cn,
					createTimeStamp,

					displayName, 
					distinguishedName,

					lastLogon,
					lockoutTime,
					logonCount,


					modifyTimeStamp,
					name,
					pwdLastSet,
					sAMAccountName, 

					whenChanged,
					whenCreated

			FROM ''LDAP://DC=jphsa,DC=org'' WHERE objectCategory = ''Computer''') 
)

SELECT


					cn,
					createTimeStamp,

					displayName, 
					distinguishedName,

					(SELECT 'TheCalculation' =  
													case when ( ([lastLogon] = '') OR ([lastLogon] = '0') OR ([lastLogon] is null) ) then NULL
													else dateadd(mi,(cast([lastLogon] as BIGINT)/600000000) - 157258080 + DATEDIFF(Minute,GetUTCDate(),GetDate()),0)										
													end
					) AS [LastLogon],
					(SELECT 'TheCalculation' =  
													case when ( ([lockoutTime] = '') OR ([lockoutTime] = '0') OR ([lockoutTime] is null) ) then NULL
													else dateadd(mi,(cast([lockoutTime] as BIGINT)/600000000) - 157258080 + DATEDIFF(Minute,GetUTCDate(),GetDate()),0)										
													end
					) AS [lockoutTime],
					logonCount,


					modifyTimeStamp,
					name,
					(SELECT 'TheCalculation' =  
													case when ( ([pwdLastSet] = '') OR ([pwdLastSet] = '0') OR ([pwdLastSet] is null) ) then NULL
													else dateadd(mi,(cast([pwdLastSet] as BIGINT)/600000000) - 157258080 + DATEDIFF(Minute,GetUTCDate(),GetDate()),0)										
													end
					) AS [pwdLastSet],
					sAMAccountName, 
									
					whenCreated,
					whenChanged
					
FROM CTE_ONE
--WHERE cn like '%0792%'



GO