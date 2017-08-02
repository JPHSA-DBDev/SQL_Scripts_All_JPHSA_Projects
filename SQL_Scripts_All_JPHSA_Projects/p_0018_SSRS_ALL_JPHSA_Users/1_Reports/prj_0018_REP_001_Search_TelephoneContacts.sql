--prj_0018_REP_002_Search_TelephoneContacts_return_All_Fields.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 2/6/2017
	By: glenn garson
	************************************************************************************
*/

use d3_JPHSA_All_Users
go

--================================================	
--DECLARE @SearchString nvarchar(100)		

--SET @SearchString = ''			--'dai'
--================================================
    
alter Procedure prj_0018_REP_001_Search_TelephoneContacts(
		 @SearchString as NVARCHAR(100) = ''                      	
	)

	as
select @SearchString = LTRIM(RTRIM(@SearchString))
--=============================================================================================================================
SELECT  [T003_PK]
      ,[Display_For_Users] as Name
      --,[ShowUsers_0_1]
      --,[Ext_OLD]
      ,[Ext_Toshiba] as Ext
      ,[Position]
      ,[Department]
      ,[Fax]
      ,[Email]
      ,[PhoneNumber]
      ,[Last_Name]
      ,[First_Name]
      ,[EB_WB]
      --,[Toshiba_Directory_Type]
  FROM [d3_JPHSA_All_Users].[dbo].[T003_Telephone_Contacts]
		  

			WHERE

					(
						(
							(LEN(@SearchString) = 0) 
							OR 
							(@SearchString IS NULL)							
						)
						OR
						(
								(RTRIM(LTRIM(UPPER([Display_For_Users]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')		
								OR (RTRIM(LTRIM(UPPER([Ext_Toshiba]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
								OR (RTRIM(LTRIM(UPPER([Position]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([Department]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )
								OR (RTRIM(LTRIM(UPPER([Fax]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )
								OR (RTRIM(LTRIM(UPPER([Email]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )
								OR (RTRIM(LTRIM(UPPER([PhoneNumber]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )
								OR (RTRIM(LTRIM(UPPER([EB_WB]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )
						)
					)			 
					AND ([ShowUsers_0_1] = 1)
			ORDER BY [EB_WB], [Display_For_Users]


					
GO					