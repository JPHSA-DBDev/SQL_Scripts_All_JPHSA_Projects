



SELECT top(100) * FROM OPENQUERY(ADSI, 
            'SELECT 
					title, 
					displayName, 
					sAMAccountName, 
					givenName, 
					telephoneNumber, 
					facsimileTelephoneNumber, 
					sn 
			FROM ''LDAP://DC=jphsa,DC=org'' WHERE objectCategory = ''Person''') 
