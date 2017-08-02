--p_0016_SP_2004_SysAid_UserName_Asset_and_LastLogin_given_IPAddress.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 3/6/2017
	By: glenn garson
	************************************************************************************
*/

use d1_IT
go

--================================================	
--DECLARE @SearchString nvarchar(100)	

--SET @SearchString = 'print'

--================================================
    
alter Procedure p_0016_SP_2004_SysAid_UserName_Asset_and_LastLogin_given_IPAddress(
		 @SearchString as NVARCHAR(100)	
	)

	as

--=============================================================================================================================

SELECT TOP (1000) 
		u.[user_name],   
		c.ip_address, 
		c.computer_name, 
		c.computer_type, 
		c.inventory_time, 
		c.last_boot

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
								(RTRIM(LTRIM(UPPER([ip_address]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )
								
						)
					)			 
Order by c.inventory_time Desc					
GO					