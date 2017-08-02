--p_0016_vw_502_computer_id__user_name.sql

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

IF OBJECT_ID('p_0016_vw_502_computer_id__user_name', 'V') IS NOT NULL
DROP view p_0016_vw_502_computer_id__user_name
GO


CREATE VIEW p_0016_vw_502_computer_id__user_name AS
--==============================================
		SELECT  
		   
      [user_name]
      ,[computer_id]
  FROM [d2_SysAid].[dbo].[user2asset]

--===============================================

	  
go