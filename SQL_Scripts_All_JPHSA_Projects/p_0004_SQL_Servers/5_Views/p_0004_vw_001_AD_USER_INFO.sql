--p_0004_vw_001_AD_USER_INFO.sql
--NOT FUNCTIONAL YET
use d1_IT
go

CREATE  VIEW dbo.p_0004_vw_001_AD_USER_INFO
AS


SELECT * FROM OPENQUERY(ADSI, 
            'SELECT * FROM ''LDAP://DC=jphsa,DC=org'' WHERE objectCategory = ''Person''') 

--SELECT * FROM OpenQuery(ADSI, 'sAMAccountName FROM ''LDAP://DC=jphsa,DC=org'' where objectClass = ''User''')

--SELECT * FROM OpenQuery(ADSI, 'sAMAccountName FROM "LDAP://DC=jphsa,DC=org" where objectClass = "User"')

--SELECT * FROM OpenQuery(ADSI, 'sAMAccountName FROM "LDAP://DC=jphsa,DC=domain,DC=org" where objectClass = "User"')

--SELECT * FROM OpenQuery(ADSI, 'SELECT title, displayName, sAMAccountName, givenName, telephoneNumber, facsimileTelephoneNumber, sn FROM "LDAP://DC=jphsa,DC=domain,DC=org" where objectClass = "User"')


GO