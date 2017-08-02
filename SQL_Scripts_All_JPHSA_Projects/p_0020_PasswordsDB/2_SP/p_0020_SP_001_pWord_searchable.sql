--p_0020_SP_001_pWord_searchable.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 02/27/2017
	By: glenn garson
	************************************************************************************
*/

use d1_IT
go

--================================================	
--DECLARE @SearchString nvarchar(100)		
--DECLARE @audience nvarchar(100)


--SET @SearchString = 'SysAid'		
--SET @audience = 'IT'
--================================================
    
alter Procedure p_0020_SP_001_pWord_searchable(
		 @SearchString as NVARCHAR(100),	
         @audience as nvarchar(100) = 'IT'                    	
	)

	as

--=============================================================================================================================

		SELECT TOP (1000) [Audience_Me_IT]
			  ,[Audience_e01]
			  ,[UserType_OS_SQL_Application]
			  ,[UserType_e02]
			  ,[UserName]
			  ,[password]
			  ,[Application_or_Device]
			  ,[OS_user_type]
			  ,[OS_User_Type_e03]
			  ,[Computer_for_UserName]
			  ,[Notes]
			  ,[T002_PK]
		  FROM [d1_IT].[dbo].[T002_Passwords_ALL]
		  

			WHERE

					(
						(
							(
								(
									(LEN(@SearchString) = 0) 
									OR 
									(@SearchString IS NULL)							
								)
								OR							
								(
										(RTRIM(LTRIM(UPPER([UserType_OS_SQL_Application]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')		
										OR (RTRIM(LTRIM(UPPER([UserName]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
										OR (RTRIM(LTRIM(UPPER([password]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
										OR (RTRIM(LTRIM(UPPER([Application_or_Device]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
										OR (RTRIM(LTRIM(UPPER([OS_user_type]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
										OR (RTRIM(LTRIM(UPPER([Computer_for_UserName]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
										OR (RTRIM(LTRIM(UPPER([Notes]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								)
							)
							AND 
							(RTRIM(LTRIM(UPPER([Audience_e01]))) != 1)		--'ME'
						)
						AND
						(RTRIM(LTRIM(UPPER(@audience))) != 'ME')
					)	
					OR
					(
						(
							(
								(
									(LEN(@SearchString) = 0) 
									OR 
									(@SearchString IS NULL)							
								)
								OR							
								(
										(RTRIM(LTRIM(UPPER([UserType_OS_SQL_Application]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')		
										OR (RTRIM(LTRIM(UPPER([UserName]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
										OR (RTRIM(LTRIM(UPPER([password]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
										OR (RTRIM(LTRIM(UPPER([Application_or_Device]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
										OR (RTRIM(LTRIM(UPPER([OS_user_type]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
										OR (RTRIM(LTRIM(UPPER([Computer_for_UserName]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
										OR (RTRIM(LTRIM(UPPER([Notes]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								)
							)
							AND 
							(RTRIM(LTRIM(UPPER([Audience_e01]))) = 1) --'ME'
						)
						AND
						(RTRIM(LTRIM(UPPER(@audience))) = 'ME')
					)							 
					
GO					