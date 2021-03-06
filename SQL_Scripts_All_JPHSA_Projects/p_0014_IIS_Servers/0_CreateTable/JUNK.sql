/****** Script for SelectTopNRows command from SSMS  ******/
SELECT --TOP (1000) 
		[T001_PK]
      --,[LogFilename]
      ,[LogRow]
      ,[date]
      ,[time]
      ,[cIp] as [Client_IP]
      ,[csUsername]
      --,[sSitename]
      --,[sComputername]
      ,[sIp]
      ,[sPort]
      ,[csMethod]
      ,[csUriStem]
      ,[csUriQuery]
      ,[scStatus]
      ,[scSubstatus]
      ,[scWin32Status]
      ,[scBytes]
      ,[csBytes]
      ,[timeTaken]
      --,[csVersion]
      --,[csHost]
      ,[csUserAgent]
      --,[csCookie]
      ,[csReferer]
      --,[sEvent]
      --,[sProcessType]
      --,[sUserTime]
      --,[sKernelTime]
      --,[sPageFaults]
      --,[sTotalProcs]
      --,[sActiveProcs]
      --,[sStoppedProcs]
  FROM [d4_IIS_Logs].[dbo].[T001_W3SVC1_JPHSA411]
  WHERE  csUriStem   NOT IN (
'/',
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

Order by Date desc, time desc						
		----csMethod <> 'GET'
		----csUsername <> ''
		