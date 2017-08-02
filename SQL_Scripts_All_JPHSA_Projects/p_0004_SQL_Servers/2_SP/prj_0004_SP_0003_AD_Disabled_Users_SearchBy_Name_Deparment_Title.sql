--prj_0004_SP_0003_AD_Disabled_Users_SearchBy_Name_Deparment_Title.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 06/27/2017
	By: glenn garson
	************************************************************************************
*/

use d1_IT
go

--================================================	
--DECLARE @SearchString nvarchar(100)		-- for first name, Department, or EmployeeID
--SET @SearchString = ''			--
----SET @SearchString = 'ADMIN - IT'			--
--================================================
    
create Procedure prj_0004_SP_0003_AD_Disabled_Users_SearchBy_Name_Deparment_Title(
		 @SearchString as NVARCHAR(100)	                       	
	)
	as
--=============================================================================================================================

				SELECT TOP (1000) [cn]
					  ,[createTimeStamp]
					  ,[department]
					  ,[displayName]
					  ,[distinguishedName]
					  ,[employeeID]
					  ,[facsimileTelephoneNumber]
					  ,[givenName]
					  ,[homeDirectory]
					  ,[homeDrive]
					  ,[info]
					  ,[isDeleted]
					  --,[LastLogon]
					  --,[lockoutTime]
					  --,[logonCount]
					  ,[mail]
					  --,[manager]
					  ,[modifyTimeStamp]
					  ,[name]
					  --,[pwdLastSet]
					  ,[sAMAccountName]
					  --,[scriptPath]
					  ,[sn]
					  ,[telephoneNumber]
					  ,[title]
					  --,[whenCreated]
					  --,[whenChanged]
				FROM [d1_IT].[dbo].[p_0004_vw_004_AD_disabled_USER_INFO]
				WHERE

					(
						(
							(LEN(@SearchString) = 0) 
							OR 
							(@SearchString IS NULL)							
						)
						OR
						(
								(RTRIM(LTRIM(UPPER([cn]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')		
								OR (RTRIM(LTRIM(UPPER([department]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
								OR (RTRIM(LTRIM(UPPER([employeeID]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
						)
					)
					AND
					givenName is not NULL
					AND
					homeDirectory is not NULL								 
						
GO					