--p_0004_vw_004_AD_disabled_USER_INFO_v0.sql
--
use d1_IT
go

IF OBJECT_ID('p_0004_vw_004_AD_disabled_USER_INFO', 'V') IS NOT NULL
DROP view p_0004_vw_004_AD_disabled_USER_INFO
GO

CREATE  VIEW dbo.p_0004_vw_004_AD_disabled_USER_INFO
AS

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
			  FROM  ''LDAP://EBDC2.JPHSA.org/OU=Disabled,DC=jphsa,DC=org'' 
			  WHERE objectClass =  ''User''' ) 
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
					sn

					
FROM CTE_ONE
--WHERE displayName like '%Glenn%'
--WHERE displayName like '%Manh%'


GO