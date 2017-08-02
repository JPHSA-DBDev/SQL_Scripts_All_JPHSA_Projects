--p_0021_SP_005_MultipleMonths_A_step_2_v0.sql

--===========================================================================
/* 	
 
 	This version (MultipleMonths) assumes that all the data has been added to the ARCHIVE tables, 
		(using the script: p_0021_SP_001_INSERT_INTO_T003_T004_and_ARCHIVEs_from_uploaded_BillableServices_v6.sql)

	This version also assumes that the following scripts were run for a given month of data:
		p_0021_SP_002_A_step_1_v1.sql  AND p_0021_SP_002_A_step_2_v1.sql  (there fore all the providers have been taken care of)

	Created: 3/17/2012
	Modified: 4/19/2017 for multiple months
	By: glenn garson

*/
--===========================================================================

USE Success
GO



