--p_0004_SP_201_GetLdapUserGroups_Given_UserName.sql
--from: http://stackoverflow.com/questions/13914698/query-ad-group-membership-recursively-through-sql

use d1_IT
go

alter PROCEDURE [dbo].[p_0004_SP_201_GetLdapUserGroups_Given_UserName]
    (
    @LdapUsername NVARCHAR(max)
    )
AS
BEGIN
		DECLARE @Query NVARCHAR(max), @Path NVARCHAR(max)

		SET @Query = '
			SELECT @Path = distinguishedName
			FROM OPENQUERY(ADSI, ''
				SELECT distinguishedName 
				FROM ''''LDAP://DC=jphsa,DC=org''''
				WHERE 
					objectClass = ''''user'''' AND
					sAMAccountName = ''''' + @LdapUsername + '''''
			'')
		'
		
		EXEC sp_executesql @Query, N'@Path NVARCHAR(max) OUTPUT', @Path = @Path OUTPUT 

		  SET @Query = '
			SELECT cn AS [LdapGroup]
			FROM OPENQUERY (ADSI, ''<LDAP://jphsa.org>;
			(&(objectClass=group)(member:1.2.840.113556.1.4.1941:= ' + @Path + '));
			cn, adspath;subtree'')
			ORDER BY cn;
		'

		EXEC sp_executesql @Query
				
END