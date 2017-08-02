


USE [Success];
GO

DECLARE @table_name_NON_Billable_Service_SOURCE AS sysname
SET @table_name_NON_Billable_Service_SOURCE = N'NON_Billable_Service_2017_02_23'

		SELECT 
			   [Location]
			  ,[Date Encounter]
			  ,[Patient # (Chart)]
			  ,[Patient Birth Date (Chart)]
			  ,[Examining Clinician]
			  ,[Chp Encounter Id]
			  ,[Billable Encounter ID]
			  ,[Reason for Encounter]
			  ,[Encounter Type]
			  ,[Encounter Count]
			  , (0 + Convert(Char(8),Convert(datetime,'01-01-2017',101),112) - Convert(Char(8),[Patient Birth Date (Chart)],112)) / 10000 as Age_as_of_End_Of_Month
			  , (SELECT     'TheCalculation' = CASE 
													WHEN
														( ((0 + Convert(Char(8),Convert(datetime,'01-01-2017',101),112) - Convert(Char(8),[Patient Birth Date (Chart)],112)) / 10000) >= 18 )
													   THEN 1 
													ELSE 0 
												END) as Adult
				,(SELECT     'TheCalculation' = 
							CASE 
								WHEN [Reason for Encounter] in (
																'PC Care Coordination (Non-Billable)',
																'PC Medication Refill (NB) ',
																'PC Care Planning',
																'PC Nursing Education',
																'PC Review of labs/radiologic info',
																'PC Telephone Contact (Non-Billable)'
																)

										THEN 'PC'
								WHEN [Reason for Encounter] in (
																'BH Care Coordination (Non-Billable)',
																'BH Medication Refill (NB) ',
																'BH Care Planning',
																'BH Case Management (Non-Billable)',
																'BH Review of labs/radiologic info',
																'BH Screening Face to Face (NB)',
																'BH Screening Phone (NB)',
																'BH Telephone Contact (Non-Billable)',
																'Medication Refill (NB)'

																)
										THEN 'BH'
								ELSE ''
							END) as [NonBillable_Type]
		FROM [Success].[dbo].[NON_Billable_Service_2017_02_23]