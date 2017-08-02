--prj_0009_SP_0001_Servers_Searchable.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 01/24/2017
	By: glenn garson
	************************************************************************************
*/

use d1_IT
go
--================================================	
--DECLARE @SearchString nvarchar(100)		-- for first name, Department, or EmployeeID
--SET @SearchString = '.54.'			--

--================================================
    
create Procedure prj_0009_SP_0001_Servers_Searchable(
		 @SearchString as NVARCHAR(100)	                       	
	)
	as
--=============================================================================================================================
SELECT
		[ID]
      ,[Name] AS SERVER_NAME
      ,[IP_1]
      ,[IP_2]
      ,[Notes]
      ,[Description]
      ,[Roles_and_Functions]
      ,[Service_tag]
      ,[Install_Date]
      ,[JPHSA_Tag]
      ,[OS]
      ,[BIOS SerialNumber]
      ,[Old_Purchase_Notes]
  FROM [d1_IT].[dbo].[Servers]
				WHERE

					(
						(
							(LEN(@SearchString) = 0) 
							OR 
							(@SearchString IS NULL)							
						)
						OR
						(
								(RTRIM(LTRIM(UPPER([Name]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')		
								OR (RTRIM(LTRIM(UPPER([IP_1]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
								OR (RTRIM(LTRIM(UPPER([IP_2]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	

								OR (RTRIM(LTRIM(UPPER([Notes]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([Description]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([Roles_and_Functions]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([Service_tag]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([JPHSA_Tag]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([OS]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
						)
					)			 
										
GO					