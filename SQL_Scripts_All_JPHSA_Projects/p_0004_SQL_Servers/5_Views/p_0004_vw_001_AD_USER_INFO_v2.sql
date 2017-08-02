--p_0004_vw_001_AD_USER_INFO_v2.sql
--
use d1_IT
go

IF OBJECT_ID('p_0004_vw_001_AD_USER_INFO', 'V') IS NOT NULL
DROP view p_0004_vw_001_AD_USER_INFO
GO

CREATE  VIEW dbo.p_0004_vw_001_AD_USER_INFO
AS


SELECT * FROM OPENQUERY(ADSI, 
            'SELECT 
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
-- This one worked:
--            'SELECT * FROM ''LDAP://DC=jphsa,DC=org'' WHERE objectCategory = ''Person''') 

--SELECT * FROM OpenQuery(ADSI, 'sAMAccountName FROM ''LDAP://DC=jphsa,DC=org'' where objectClass = ''User''')

--SELECT * FROM OpenQuery(ADSI, 'sAMAccountName FROM "LDAP://DC=jphsa,DC=org" where objectClass = "User"')

--SELECT * FROM OpenQuery(ADSI, 'sAMAccountName FROM "LDAP://DC=jphsa,DC=domain,DC=org" where objectClass = "User"')

--SELECT * FROM OpenQuery(ADSI, 'SELECT title, displayName, sAMAccountName, givenName, telephoneNumber, facsimileTelephoneNumber, sn FROM "LDAP://DC=jphsa,DC=domain,DC=org" where objectClass = "User"')


GO