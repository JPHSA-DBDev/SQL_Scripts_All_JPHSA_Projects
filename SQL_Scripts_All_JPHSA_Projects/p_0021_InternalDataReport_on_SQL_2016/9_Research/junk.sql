


USE [Success];
GO

select top(10) *
 from zzz_JUNK_MultiMonth

 select top(10) *
 from zzz_JUNK_Month

 SELECT 
		MM.Patient_No AS MM_Patient_No
		, MM.YYYY_MM AS MM_YYYY_MM
		,M.Patient_No AS M_Patient_No
		, M.YYYY_MM AS M_YYYY_MM
 FROM
	zzz_JUNK_MultiMonth MM
	LEFT OUTER JOIN
	zzz_JUNK_Month M
	ON 
		MM.Patient_No = M.Patient_No
		AND
		MM.YYYY_MM = M.YYYY_MM
WHERE
		MM.YYYY_MM <> '2016_08'
		AND
		( 
		M.Patient_No IS NULL
		OR 
		M.YYYY_MM IS NULL
		)
ORDER BY MM_Patient_No
