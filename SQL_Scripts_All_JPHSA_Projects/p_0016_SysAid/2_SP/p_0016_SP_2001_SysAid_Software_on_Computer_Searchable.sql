--p_0016_SP_2001_SysAid_Software_on_Computer_Searchable.sql
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

--SET @SearchString = 'SQL'

--================================================
    
create Procedure p_0016_SP_2001_SysAid_Software_on_Computer_Searchable(
		 @SearchString as NVARCHAR(100)	
                       	
	)

	as

--=============================================================================================================================

SELECT TOP (1000) [computer_name]
      ,[Software_Name]
      ,[version]
      ,[license]
      ,[computer_id]
  FROM [d1_IT].[dbo].[p_0016_vw_504_computer_name__Software]

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
								OR (RTRIM(LTRIM(UPPER([Software_Name]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
								OR (RTRIM(LTRIM(UPPER([version]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
						)
					)			 
					
GO					