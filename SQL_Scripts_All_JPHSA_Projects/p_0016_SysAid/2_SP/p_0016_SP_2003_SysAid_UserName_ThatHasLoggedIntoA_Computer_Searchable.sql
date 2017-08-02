--p_0016_SP_2003_SysAid_UserName_ThatHasLoggedIntoA_Computer_Searchable.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 2/27/2017
	By: glenn garson
	************************************************************************************
*/

use d1_IT
go

--================================================	
--DECLARE @SearchString nvarchar(100)	

--SET @SearchString = 'IT-0022'

--================================================
    
create Procedure p_0016_SP_2003_SysAid_UserName_ThatHasLoggedIntoA_Computer_Searchable(
		 @SearchString as NVARCHAR(100)	
                       	
	)

	as

--=============================================================================================================================

SELECT TOP (1000)  
	u.[user_name]
	  ,c.[computer_name]
      ,c.[computer_type]
  FROM 
  [d2_SysAid].[dbo].[user2asset] u
  LEFT OUTER JOIN
  [d2_SysAid].[dbo].[computer] c 
  ON u.computer_id = c.computer_id

			WHERE

					(
						(
							(LEN(@SearchString) = 0) 
							OR 
							(@SearchString IS NULL)							
						)
						OR
						(
								(RTRIM(LTRIM(UPPER([computer_name]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')		
								OR (RTRIM(LTRIM(UPPER([user_name]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
						)
					)			 
					
GO					