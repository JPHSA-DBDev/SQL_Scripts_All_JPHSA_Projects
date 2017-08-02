



SELECT  * FROM OPENQUERY(ADSI, 
            'SELECT 
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

