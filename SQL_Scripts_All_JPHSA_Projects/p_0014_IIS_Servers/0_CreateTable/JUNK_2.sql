/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      [LogFilename]
      ,[LogRow]
      ,[EntryTime]
      ,[SiteName]
      ,[Client_IP]
      ,[csUsername]
      ,[ServerIpAddress]
      ,[sPort]
      ,[csMethod]
      ,[csUriStem]
      ,[csUriQuery]
      ,[scStatus]
      ,[scSubstatus]
      ,[scWin32Status]
      ,[BytesFromServerToClient]
      ,[BytesFromClientToServer]
      ,[timeTaken]
      ,[csUserAgent]
      ,[csReferer]
  FROM [d4_IIS_Logs].[dbo].[T001_W3SVC1_JPHSA411]
    --FROM [d4_IIS_Logs].[dbo].[T005_W3SVC5_LOCUS]
    WHERE  
		csUriStem   NOT IN (
								--'/',
								'/bkg-gry.jpg',
								'/browserconfig.xml',
								'/bundles/bootstrap',
								'/bundles/jquery',
								'/bundles/modernizr',
								'/Content/css',
								'/favicon.ico',
								'/iis-8.png',
								'/msweb-brand.png',
								'/ws8-brand.png'
														)
			and  
			[csUserAgent]  not like  '%rubyforge.org%'
	ORDER BY [EntryTime] desc
