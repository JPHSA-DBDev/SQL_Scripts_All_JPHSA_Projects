--p_0016_SP_2002_SysAid_Asset_IPAddress_Searchable.sql
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

--SET @SearchString = 'print'

--================================================
    
alter Procedure p_0016_SP_2002_SysAid_Asset_IPAddress_Searchable(
		 @SearchString as NVARCHAR(100)	
                       	
	)

	as

--=============================================================================================================================

SELECT TOP (1000) 
      [computer_name]
      ,[computer_type]
      ,[ip_address]
	  ,[description]
	  ,[model]
  FROM [d1_IT].[dbo].[p_0016_vw_503_computer_id__computer_name__IP_Address]

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
								OR (RTRIM(LTRIM(UPPER([computer_type]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
								OR (RTRIM(LTRIM(UPPER([ip_address]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )
								OR (RTRIM(LTRIM(UPPER([model]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )									
						)
					)			 
					
GO					