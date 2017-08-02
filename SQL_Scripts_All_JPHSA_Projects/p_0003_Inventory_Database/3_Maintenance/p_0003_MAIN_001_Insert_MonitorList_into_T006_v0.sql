--p_0003_MAIN_001_Insert_MonitorList_into_T006_v0.sql



; with cte_1 
AS
(
SELECT DISTINCT *
FROM
	(
		(
			SELECT Distinct [Monitor_Tag-1] as [JPHSA_Tag]
			FROM [d1_IT].[dbo].[zzzMarcos_2017_05_15]
			WHERE [Monitor_Tag-1] is NOT NULL
		) 
		UNION ALL	
		(
			SELECT Distinct [Monitor_Tag-2] as [JPHSA_Tag]

			FROM [d1_IT].[dbo].[zzzMarcos_2017_05_15]
			WHERE [Monitor_Tag-2] is NOT NULL
		) 
	) TheUnion

) 
, cte_Tag_1
as
(
Select 
		cte.JPHSA_Tag AS [JPHSA_Tag]
		,raw.[Monitor_Size] AS [Monitor_Size]
		,raw.[Service_Tag] AS [Vendor_Service_Tag]
		,raw.[Building] as [Building_T005_e2_Description]
		,raw.[Status] as [DeviceStatus_T005_e3_Description]

from 
		cte_1 cte
		LEFT OUTER JOIN
		[d1_IT].[dbo].[zzzMarcos_2017_05_15] raw
		ON 
			RTRIM(LTRIM(cte.JPHSA_Tag)) = RTRIM(LTRIM(raw.Tag))
		WHERE raw.Tag is NOT NULL
)
--select * from cte_Tag_1

INSERT INTO [d1_IT].[dbo].[T006_Monitor_Inventory]   --<============== APPEND to existing table
		(
		JPHSA_Tag
		,[Monitor_Size]
		,[Building_T005_e2_Description]
		,[DeviceStatus_T005_e3_Description]
		)
SELECT  
		JPHSA_Tag
		,[Monitor_Size]
		,[Building_T005_e2_Description]
		,[DeviceStatus_T005_e3_Description]
FROM cte_Tag_1 
ORDER BY [JPHSA_Tag]

go
select * from [d1_IT].[dbo].[T006_Monitor_Inventory] 

