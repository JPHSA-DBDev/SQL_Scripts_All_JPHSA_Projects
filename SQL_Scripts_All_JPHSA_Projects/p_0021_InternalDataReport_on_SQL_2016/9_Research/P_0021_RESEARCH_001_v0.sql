--P_0021_RESEARCH_001_v0.sql
--===========================================================================
/* v0 is the original, unchanged version

*/
--===========================================================================




--FROM: 1_Create_Table_EHSNONBILLA.sql -----------------------------------------------------------------------------------------


SELECT     a.[Date Encounter], a.[Patient # (Chart)], a.[Reason for Encounter], a.[Examining Clinician],[Patient Birth Date (Chart)]
FROM         
	dbo.EHSNONBILL a 
	INNER JOIN
        dbo.LKNONBILL 
	ON a.[Reason for Encounter] = dbo.LKNONBILL.[Encounter Reasons]
WHERE     (dbo.LKNONBILL.NB = 'Y')

--===========================================================================
/*
	At this point the output from the previous SELECT is saved as a table: [EHSNONBILLA]
	The table [EHSPROD] has already been dealt with. It is now named [T001_EHSPROD]



*/
--===========================================================================


--FROM: 2_QueryForMissingProviders.sql

--exclude BACH, JENNIFER, DABROWSKI, SHONA DOCTOR, CONVERSION,BEHAVIORAL HEALTH, NURSE 

-- Assumes existance of [EHSNONBILLA], [EHSPROD]
SELECT     a.[Examining Clinician], b.ProviderName
FROM 
	dbo.EHSNONBILLA a 
	LEFT OUTER JOIN
        dbo.EHSPROD b
 	ON a.[Examining Clinician] = b.ProviderName

WHERE b.ProviderName is null
GROUP BY   a.[Examining Clinician], b.ProviderName


--===========================================================================
/*
	The previous SELECT generates a list of providers that are not already in the table [EHSPROD]
	and it provides 1 of the 3 missing pieces of information (i.e. [ProviderName])

	I could have it insert that into a table [zzzMissingProviders, then manually edit the table to provide the two misisng pieces of information 



*/
--===========================================================================

--FROM: 3_InsertMissingProviders.sql
--Need to document source of: EHSPROD




INSERT INTO EHSPROD (ProviderName,LOCATION,Type) --new service mon dec 16

VALUES ('WEBER, THADDEUS', 'WJ', 'BH');

INSERT INTO EHSPROD (ProviderName,LOCATION,Type) --new service mon dec 16

VALUES ('BANKS, JONI', 'WJ', 'BH');


--aaa_2017_01_31_Source_A.sql




--4] Checking to see if the office location is present in the table [EHSBILL]. You should see two records
--WB JeffCare
--EB JeffCare

SELECT     [Office Location]
FROM         dbo.EHSBILL
GROUP BY [Office Location]


--5] Create a new field [loc]{nvarchar(50)} for table: [EHSBILL] 

--6] Populate the new field mapped from [Office Location] 
BEGIN TRAN
UPDATE a  SET a.loc = 'WJ'
FROM         dbo.EHSBILL a
WHERE [Office Location] in ('WB JeffCare')
--Based on the results from previous, either 'ROLLBACK TRAN' or 'COMMIT'
---------------------------------------------------
ROLLBACK TRAN
COMMIT
---------------------------------------------------

--7] Populate the new field mapped from [Office Location] 
BEGIN TRAN
UPDATE a  SET a.loc = 'EJ'
FROM         dbo.EHSBILL a
WHERE [Office Location] in ('EB JeffCare')
--Based on the results from previous, either 'ROLLBACK TRAN' or 'COMMIT'
---------------------------------------------------
ROLLBACK TRAN
COMMIT
---------------------------------------------------

--8] There should not be any records back from this
select* from EHSBILL where loc is null

--9] Create a new field [NBTYPE]{nvarchar(50)} for table: [EHSNONBILLA]  

--10] Populate the new field [NBTYPE] based WHERE statement
BEGIN TRAN
UPDATE a  SET a.NBTYPE  = 'PC'
FROM         dbo.EHSNONBILLA  a 
WHERE [Reason for Encounter] in ('PC Care Coordination (Non-Billable)','PC Medication Refill (NB) ',
'PC Care Planning',
'PC Nursing Education',
'PC Review of labs/radiologic info',
'PC Telephone Contact (Non-Billable)')
--Based on the results from previous, either 'ROLLBACK TRAN' or 'COMMIT'
---------------------------------------------------
ROLLBACK TRAN
COMMIT
---------------------------------------------------


--11] Populate the new field [NBTYPE] based WHERE statement
BEGIN TRAN
UPDATE a  SET a.NBTYPE  = 'BH'
FROM         dbo.EHSNONBILLA  a 
WHERE [Reason for Encounter]in ('BH Care Coordination (Non-Billable)','BH Medication Refill (NB) ',
'BH Care Planning',
'BH Case Management (Non-Billable)',
'BH Review of labs/radiologic info',
'BH Screening Face to Face (NB)',
'BH Screening Phone (NB)',
'BH Telephone Contact (Non-Billable)',
'Medication Refill (NB)')

--Based on the results from previous, either 'ROLLBACK TRAN' or 'COMMIT'
---------------------------------------------------
ROLLBACK TRAN
COMMIT
---------------------------------------------------

--12]  Confirm that NBTYPE exist
select NBTYPE from dbo.EHSNONBILLA GROUP BY NBTYPE
--Expected Output:
--BH
--PC


--13] Run this section, as the query which is used to build the final table.
-- and export to the output to [JPHSA-EBSQL1] table[EHSS] in DB [ANASAZI].
-- From SQL Server Enterprise Manager, export from/to the same server/database
--EHSS
SELECT     a.[Patient #],a.[Patient Birth Date], a.[Check-In Day],'Lab Orders (Count as 1 Svc)' as svc, a.loc, a.[Bill Provider Name], b.Type
FROM         dbo.EHSBILL a INNER JOIN
                      dbo.EHSPROD b ON a.[Bill Provider Name] = b.ProviderName
WHERE     (a.[CPT Code] LIKE '8%')
GROUP BY a.[Patient #], a.[Patient Birth Date],a.[Check-In Day], a.loc, a.[Bill Provider Name], b.Type

UNION ALL
SELECT     a.[Patient #],a.[Patient Birth Date], a.[Check-In Day], [CPT Description]as svc,a.loc, a.[Bill Provider Name], b.Type
FROM         dbo.EHSBILL a INNER JOIN
                      dbo.EHSPROD b ON a.[Bill Provider Name] = b.ProviderName
WHERE     (a.[CPT Code] NOT LIKE '8%')

UNION ALL
SELECT     a.[Patient # (Chart)], a.[Patient Birth Date (Chart)],a.[Date Encounter],[Reason for Encounter] as svc, b.LOCATION, a.[Examining Clinician], A.NBType
FROM         dbo.EHSNONBILLA a INNER JOIN
                      dbo.EHSPROD b ON a.[Examining Clinician] = b.ProviderName

-------------------------------------------------------------

-- Pull data from the table where it was saved: table[EHSS] in DB [ANASAZI]
--=============================================================================
--14](A-001) East Jefferson - Primary Health Care - services -- {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')


--15](A-002)East Jefferson - Primary Health Care - services - Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ') 
and a.[Patient Birth Date]<'19981031'  --<== This is the date for people who are 18 yrs and older at the end of the 'month'

 --16](A-003) West Jefferson - Primary Health Care - services -- {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')

--17](A-004)West Jefferson - Primary Health Care - services - Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ') 
and a.[Patient Birth Date]<'19981031'  --<== This is the date for people who are 18 yrs and older at the end of the 'month'


--- # Client un-duplicated Individuals (i.e. count client only once, regardless of how many times they show up}
--18](A-005) un-duplicated IndividualsEast Jefferson - Primary Health Care - {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')


--19](A-006)un-duplicated Individuals - East Jefferson - Primary Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')
and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


--20](A-007)un-duplicated Individuals - West Jefferson - Primary Health Care -  {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')

--21](A-008)un-duplicated Individuals - West Jefferson - Primary Health Care - Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')
and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'

--22](A-009)TOTAL un-duplicated Individuals - Primary Health Care -  {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' 

--23](A-010)TOTAL un-duplicated Individuals - Primary Health Care - Adults {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031'
and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'





---BH services
--24](A-011) East Jefferson - Behavioral Health Care - services -- {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.EHSS a 
WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')

--25](A-012)East Jefferson - Behavioral Health Care - services - Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.EHSS a 
WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')
and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'

--26](A-013) West Jefferson - Behavioral Health Care - services -- {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.EHSS a 
WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')


--27](A-014)West Jefferson - Behavioral Health Care - services - Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.EHSS a 
WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')
and a.[Patient Birth Date]<'19981031'--<== This is the date for people who are 18 yrs and older at the end of the 'month'




--- # Client unduplicated

 

---BH
--28](A-015) un-duplicated Individuals East Jefferson - Behavioral Health Care - {for a given month i.e. from first to lastdate  of the month}
SELECT  Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')



--29](A-016)un-duplicated Individuals - East Jefferson - Behavioral Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT  Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')
and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


--30](A-017) un-duplicated Individuals West Jefferson - Behavioral Health Care - {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')

--31](A-018)un-duplicated Individuals - East Jefferson - Behavioral Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT  Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')
and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


--32](A-019) un-duplicated Individuals - Total - Behavioral Health Care - {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031'

--33](A-020)un-duplicated Individuals - Total - Behavioral Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031'
and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'



--34](A-021)un-duplicated Individuals - Total -  JeffCare(JPHSA PC and BH)

SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.[Check-In Day]between '20161001' and '20161031'



--35](A-022)un-duplicated Individuals - Total - Adults -  JeffCare(JPHSA PC and BH)
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.[Check-In Day]between '20161001' and '20161031'
and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


-- This is raw data for audit
--Raw data
select * from dbo.EHSS where TYPE in ('BH','PC')
-- and [Check-In Day]between '20161001' and '20161031'