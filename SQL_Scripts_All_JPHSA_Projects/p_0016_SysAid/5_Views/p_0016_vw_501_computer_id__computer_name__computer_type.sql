--p_0016_vw_501_computer_id__computer_name__computer_type.sql

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

IF OBJECT_ID('p_0016_vw_501_computer_id__computer_name__computer_type', 'V') IS NOT NULL
DROP view p_0016_vw_501_computer_id__computer_name__computer_type
GO


CREATE VIEW p_0016_vw_501_computer_id__computer_name__computer_type AS
--==============================================
		SELECT  
		   
      [computer_id]
      ,[computer_name]
      ,[computer_type]
		FROM         

			[d2_SysAid].[dbo].[computer] L1

--===============================================

	  
go