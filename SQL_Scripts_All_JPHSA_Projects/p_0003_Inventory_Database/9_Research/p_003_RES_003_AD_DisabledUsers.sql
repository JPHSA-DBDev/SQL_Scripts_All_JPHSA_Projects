--SELECT * FROM OPENQUERY(ADSI, 
--            'SELECT * FROM ''LDAP://DC=jphsa,DC=org'' WHERE objectCategory = ''Person''') 

--SELECT * FROM OPENQUERY(ADSI, 
--            'SELECT * FROM ''LDAP://DC=jphsa,DC=org'' WHERE displayName = ''Thaddeus Weber''') 


--SELECT * FROM OpenQuery ( 
--  ADSI,  
--  'SELECT displayName, telephoneNumber, mail, mobile, facsimileTelephoneNumber 
--  FROM  ''LDAP://EBDC2.JPHSA.org/OU=Disabled,DC=jphsa,DC=org'' 
--  WHERE objectClass =  ''User'' 
--  ') AS tblADSI
--ORDER BY displayname


SELECT * FROM OpenQuery ( 
  ADSI,  
  'SELECT streetaddress, pager, company, title, displayName, telephoneNumber, sAMAccountName, 
  mail, mobile, facsimileTelephoneNumber, department, physicalDeliveryOfficeName, givenname 
  FROM  ''LDAP://EBDC2.JPHSA.org/OU=Disabled,DC=jphsa,DC=org'' 
  WHERE objectClass =  ''User'' 
  ') AS tblADSI
ORDER BY displayname