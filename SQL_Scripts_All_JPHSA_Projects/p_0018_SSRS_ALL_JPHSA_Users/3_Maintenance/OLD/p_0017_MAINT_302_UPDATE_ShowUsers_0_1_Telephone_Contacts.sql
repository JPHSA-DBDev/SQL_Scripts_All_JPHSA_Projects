--p_0017_MAINT_302_UPDATE_ShowUsers_0_1_Telephone_Contacts.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 02/6/2017
	By: glenn garson
	************************************************************************************
*/

use d1_IT
go


UPDATE T003_Telephone_Contacts
SET ShowUsers_0_1 = 0 
WHERE [Ext_OLD] is NULL