select  *
from  openquery(adsi, '
						select  createTimeStamp,
								distinguishedName,
								userPrincipalName,
								givenName,
								sn,
								sAMAccountName,
								displayName,
								mail,
								telephoneNumber,
								mobile,
								whenCreated
						from    ''LDAP://dc=jphsa,dc=org''
						where   objectCategory = ''Person''
								and
								objectClass = ''user''
						')

SELECT *
  FROM OPENQUERY
  (ADSI
   , 'SELECT cn
         FROM ''LDAP://BCC-DC2/DC=barriere,DC=com,CN=ExchangeActiveSyncDevices''
      WHERE objectClass = ''Person''')

SELECT *
  FROM OPENQUERY
  (ADSI
   , 'SELECT cn
         FROM ''LDAP://BCC-DC2/DC=barriere,DC=com''
      WHERE objectClass = ''msExchActiveSyncDevices''')





SELECT *
  FROM OPENQUERY
  (ADSI
   , 'SELECT *
         FROM ''LDAP://BCC-DC2/DC=jp,DC=com''
      WHERE objectClass = ''User''')


SELECT * FROM OpenQuery (
ADSI,
'SELECT *
FROM ''LDAP://jphsa.org/DC=jphsa,DC=org''
WHERE objectClass = ''User''
')

		--and
		--objectCategory = ''ms-Exch-Active-Sync-Devices''
		objectClass=''msExchActiveSyncDevices''


--TIt lists 23 iPhone users
SELECT * FROM OpenQuery (
ADSI,
'SELECT distinguishedName
FROM ''LDAP://jphsa.org/CN=Users,DC=jphsa,DC=org''
WHERE 
		objectCategory = ''msExchActiveSyncDevices''

') AS whatever



--This does something: It lists 23 iPhone users
SELECT * FROM OpenQuery (
ADSI,
'SELECT distinguishedName
FROM ''LDAP://jphsa.org/CN=Users,DC=jphsa,DC=org''
WHERE 
		objectClass =  ''msExchActiveSyncDevices''

') AS whatever
ORDER BY distinguishedName

--This does something: A record for each phone (41 records)
SELECT * FROM OpenQuery (
ADSI,
'SELECT distinguishedName
FROM ''LDAP://jphsa.org/CN=Users,DC=jphsa,DC=org''
WHERE 
		msExchDeviceEASVersion = ''14.1''

') AS whatever
ORDER BY distinguishedName

--This does something: A record for each phone, with 2 more records than the last one.
SELECT * FROM OpenQuery (
ADSI,
'SELECT distinguishedName
FROM ''LDAP://jphsa.org/CN=Users,DC=jphsa,DC=org''
WHERE 
		msExchDeviceAccessState = ''1''

') AS whatever
--where distinguishedName LIKE '%Chelsea%'
ORDER BY distinguishedName


--this brought in the 315 users
SELECT * FROM OpenQuery (
ADSI,
'SELECT distinguishedName
FROM ''LDAP://jphsa.org/CN=Users,DC=jphsa,DC=org''
WHERE 
		instanceType = ''4''

') AS whatever
--where distinguishedName LIKE '%Chelsea%'
ORDER BY distinguishedName

--this brought in 23 devices b/ not the pure samsung people
SELECT * FROM OpenQuery (
ADSI,
'SELECT distinguishedName
FROM ''LDAP://jphsa.org/CN=Users,DC=jphsa,DC=org''
WHERE 
		cn = ''ExchangeActiveSyncDevices''

') AS whatever
--where distinguishedName LIKE '%Chelsea%'
ORDER BY distinguishedName


--this brought in 6 samsung devices, but not JP , nor glenn
SELECT * FROM OpenQuery (
ADSI,
'SELECT distinguishedName
FROM ''LDAP://jphsa.org/CN=Users,DC=jphsa,DC=org''
WHERE 
		msExchDeviceOSLanguage = ''English''

') AS whatever
--where distinguishedName LIKE '%Chelsea%'
ORDER BY distinguishedName