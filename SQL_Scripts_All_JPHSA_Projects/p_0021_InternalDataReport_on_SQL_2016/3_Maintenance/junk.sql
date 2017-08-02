


USE [Success];
GO



		SELECT 
			  [CHECKMONTH]
			  ,[Office Location]
			  ,[Office Name]
			  ,[Bill Provider Name]
			  ,[Bill Provider Specialty]
			  ,[Provider Type]
			  ,[Patient Name]
			  ,[Patient #]
			  ,[Patient Birth Date]
			  ,[Check-In Day]
			  ,[Check-Out Day]
			  ,[CPT Code]
			  ,[Service]
			  ,[CPT Description]
			  ,[Unit Qty]
			  , (0 + Convert(Char(8),Convert(datetime,'01-01-2017',101),112) - Convert(Char(8),[Patient Birth Date],112)) / 10000 as Age_as_of_End_Of_Month
			  , (SELECT     'TheCalculation' = CASE 
													WHEN
														( ((0 + Convert(Char(8),Convert(datetime,'01-01-2017',101),112) - Convert(Char(8),[Patient Birth Date],112)) / 10000) >= 18 )
													   THEN 1 
													ELSE 0 
												END) as Adult
				,(SELECT     'TheCalculation' = 
							CASE 
								WHEN [Office Location]  = 'WB JeffCare'
										THEN 'WJ' 
								WHEN [Office Location]  = 'EB JeffCare'
										THEN 'EJ' 
								ELSE ''
							END) as LOCation	

		FROM [Success].[dbo].[Billable_Service_2017_02_23]