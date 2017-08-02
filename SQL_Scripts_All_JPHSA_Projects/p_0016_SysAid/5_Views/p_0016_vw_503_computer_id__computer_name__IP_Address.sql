--p_0016_vw_503_computer_id__computer_name__IP_Address.sql

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

IF OBJECT_ID('p_0016_vw_503_computer_id__computer_name__IP_Address', 'V') IS NOT NULL
DROP view p_0016_vw_503_computer_id__computer_name__IP_Address
GO


CREATE VIEW p_0016_vw_503_computer_id__computer_name__IP_Address AS
--==============================================
		SELECT  		   
		c.[computer_id]
      ,c.[computer_name]
      ,c.[computer_type]
	  ,c.[ip_address]
	  ,c.[description]
	  ,a.model
  FROM 
		[d2_SysAid].[dbo].[computer] c
		LEFT OUTER JOIN
		[d2_SysAid].[dbo].[computer_attributes] a
		ON c.computer_id = a.computer_id
--===============================================

	  
go