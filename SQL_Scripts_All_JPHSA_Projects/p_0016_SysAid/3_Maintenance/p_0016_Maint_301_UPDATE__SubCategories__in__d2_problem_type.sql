--p_0016_Maint_301_UPDATE__SubCategories__in__d2_problem_type.sql

use d2_SysAid
go


--SELECT *
--FROm problem_type
--WHERE (	
--		[problem_sub_type] = 'EB Facility'
--	   )

--UPDATE [d2_SysAid].[dbo].[problem_type]
--SET [problem_sub_type]='3616 S. I-10'
--WHERE (	
--		[problem_sub_type] = 'EB Facility'
--	   )

UPDATE [d2_SysAid].[dbo].[problem_type]
SET [problem_sub_type]='5001 WB Expy'
WHERE (	
		[problem_sub_type] = 'WB Facility'
	   )