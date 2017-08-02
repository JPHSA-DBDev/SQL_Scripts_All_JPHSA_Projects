--p_0004_vw_001_AD_USER_INFO_v3.sql
--
use d1_IT
go

--IF OBJECT_ID('p_0004_vw_001_AD_USER_INFO', 'V') IS NOT NULL
--DROP view p_0004_vw_001_AD_USER_INFO
--GO

--CREATE  VIEW dbo.p_0004_vw_001_AD_USER_INFO
--AS

with CTE_ONE 
AS
(


SELECT * FROM OPENQUERY(ADSI, 
            'SELECT 
					pwdLastSet,
					name,
					modifyTimeStamp,
					manager,
					mail,
					logonCount,
					lockoutTime,
					lastLogon,
					isDeleted,
					info,
					homeDrive,
					homeDirectory,
					employeeID,
					distinguishedName,
					department,
					createTimeStamp,
					cn,
					title, 
					displayName, 
					sAMAccountName, 
					givenName, 
					telephoneNumber, 
					facsimileTelephoneNumber, 
					sn 
			FROM ''LDAP://DC=jphsa,DC=org'' WHERE objectCategory = ''Person''') 
)

SELECT
					name,
					modifyTimeStamp,
					mail,
					logonCount,
					isDeleted,
					info,
					homeDrive,
					homeDirectory,
					employeeID,
					distinguishedName,
					department,
					createTimeStamp,
					cn,
					title, 
					displayName, 
					sAMAccountName, 
					givenName, 
					telephoneNumber, 
					facsimileTelephoneNumber, 
					sn,
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
					--manager,
					(SELECT 'TheCalculation' = SUBSTRING(manager,4,(CHARINDEX(',', manager)-4)  )) as [manager],	
					--(SELECT 'TheCalculation' = CHARINDEX(',', manager) ) as [TheManager]	
					--pwdLastSet
					(SELECT 'TheCalculation' =  
													case when ( ([pwdLastSet] = '') OR ([pwdLastSet] = '0') OR ([pwdLastSet] is null) ) then NULL
													else dateadd(mi,(cast([pwdLastSet] as BIGINT)/600000000) - 157258080 + DATEDIFF(Minute,GetUTCDate(),GetDate()),0)										
													end
					) AS [pwdLastSet]
					
FROM CTE_ONE
--WHERE displayName like '%Glenn%'
--WHERE displayName like '%Manh%'


GO