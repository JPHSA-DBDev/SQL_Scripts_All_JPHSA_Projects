--P_0021_RESEARCH_001_v3.sql
--===========================================================================
/* v0 is the original, unchanged version
	v1 - renamed the tables to correspond to my names for the tables on the SQL 2016 Server
	v2 - rename the fields from Tri's version to my version
	v3 - converted to the new Table Names

*/
--===========================================================================

--1] 
--FROM: 1_Create_Table_EHSNONBILLA.sql {zzz_p0021_2_NonBillServices_for_IDR}-----------------------------------------------------------------------------------------


SELECT     a.[Date_Encounter], a.[Patient_No__Chart], a.[Reason_for_Encounter], a.[Examining_Clinician],[Patient_Birth_Date__Chart]
FROM         
	dbo.T004_All_Monthly_NonBillable_Services_IDR a 
	INNER JOIN
        dbo.T002_NonBillServices_for_IDR_LOOKUP 
	ON a.[Reason_for_Encounter] = dbo.T002_NonBillServices_for_IDR_LOOKUP.[Encounter_Reasons]
WHERE     (dbo.T002_NonBillServices_for_IDR_LOOKUP.NB = 'Y')

--===========================================================================
/*
	At this point the output from the previous SELECT is saved as a table: [zzz_p0021_2_NonBillServices_for_IDR]
	The table [T001_Provider_Information_IDR] has already been created.



*/
--===========================================================================

--2]
--FROM: 2_QueryForMissingProviders.sql

--exclude BACH, JENNIFER, DABROWSKI, SHONA DOCTOR, CONVERSION,BEHAVIORAL HEALTH, NURSE 

-- Assumes existance of [zzz_p0021_2_NonBillServices_for_IDR], [T001_Provider_Information_IDR]
SELECT     a.[Examining_Clinician], b.ProviderName
FROM 
	dbo.zzz_p0021_2_NonBillServices_for_IDR a 
	LEFT OUTER JOIN
        dbo.T001_Provider_Information_IDR b
 	ON a.[Examining_Clinician] = b.ProviderName

WHERE b.ProviderName is null
GROUP BY   a.[Examining_Clinician], b.ProviderName


--===========================================================================
/*
	The previous SELECT generates a list of providers that are not already in the table [T001_Provider_Information_IDR]
	and it provides 1 of the 3 missing pieces of information (i.e. [ProviderName])

	insert that into a table [zzz_p0021_3_Missing_Providers], then manually edit the table to provide the two misisng pieces of information 



*/
--===========================================================================
--3]
--FROM: 3_InsertMissingProviders.sql
--Need to document source of: T001_Provider_Information_IDR
-- THIS IS NOW IN: p_0021_SP_002_A_step_1_v0.sql   {<==== first part is done in this script}
-- THEN THE USER INSERTS THE MISSING DATA
-- FINALLY, THE DATA IS ADDED TO p_0021_SP_002_A_step_2_v0.sql


-- MODIFY THIS TO just read the data in from [zzz_p0021_3_Missing_Providers], RATHER than doing it like this

INSERT INTO T001_Provider_Information_IDR (ProviderName,LOCATION,Type) --new service mon dec 16

VALUES ('WEBER, THADDEUS', 'WJ', 'BH');

INSERT INTO T001_Provider_Information_IDR (ProviderName,LOCATION,Type) --new service mon dec 16

VALUES ('BANKS, JONI', 'WJ', 'BH');


--aaa_2017_01_31_Source_A.sql




--4] Checking to see if the Office_Location is present in the table [T003_All_Monthly_Billable_Services_IDR]. You should see two records
--WB JeffCare
--EB JeffCare

SELECT     [Office_Location]
FROM         dbo.T003_All_Monthly_Billable_Services_IDR
GROUP BY [Office_Location]


--5] Create a new field [loc]{nvarchar(50)} for table: [T003_All_Monthly_Billable_Services_IDR] 
--THIS IS NOW IN: p_0021_SP_001_INSERT_INTO_T003_T004_and_ARCHIVEs_from_uploaded_BillableServices_v3.sql


--6] Populate the new field mapped from [Office_Location] 
BEGIN TRAN
UPDATE a  SET a.loc = 'WJ'
FROM         dbo.T003_All_Monthly_Billable_Services_IDR a
WHERE [Office_Location] in ('WB JeffCare')
--Based on the results from previous, either 'ROLLBACK TRAN' or 'COMMIT'
---------------------------------------------------
ROLLBACK TRAN
COMMIT
---------------------------------------------------

--7] Populate the new field mapped from [Office_Location] 
BEGIN TRAN
UPDATE a  SET a.loc = 'EJ'
FROM         dbo.T003_All_Monthly_Billable_Services_IDR a
WHERE [Office_Location] in ('EB JeffCare')
--Based on the results from previous, either 'ROLLBACK TRAN' or 'COMMIT'
---------------------------------------------------
ROLLBACK TRAN
COMMIT
---------------------------------------------------

--8] There should not be any records back from this
select* from T003_All_Monthly_Billable_Services_IDR where loc is null

--9] Create a new field [NonBillable_Type]{nvarchar(50)} for table: [zzz_p0021_2_NonBillServices_for_IDR]
--THIS IS NOW IN [T004_All_Monthly_NonBillable_Services_IDR]

--10] Populate the new field [NonBillable_Type] based WHERE statement
BEGIN TRAN
UPDATE a  SET a.NonBillable_Type  = 'PC'
FROM         dbo.zzz_p0021_2_NonBillServices_for_IDR  a 
WHERE [Reason_for_Encounter] in ('PC Care Coordination (Non-Billable)','PC Medication Refill (NB) ',
'PC Care Planning',
'PC Nursing Education',
'PC Review of labs/radiologic info',
'PC Telephone Contact (Non-Billable)')
--Based on the results from previous, either 'ROLLBACK TRAN' or 'COMMIT'
---------------------------------------------------
ROLLBACK TRAN
COMMIT
---------------------------------------------------


--11] Populate the new field [NonBillable_Type] based WHERE statement
BEGIN TRAN
UPDATE a  SET a.NonBillable_Type  = 'BH'
FROM         dbo.zzz_p0021_2_NonBillServices_for_IDR  a 
WHERE [Reason_for_Encounter]in ('BH Care Coordination (Non-Billable)','BH Medication Refill (NB) ',
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

--12]  Confirm that NonBillable_Type exist
select NonBillable_Type from dbo.zzz_p0021_2_NonBillServices_for_IDR GROUP BY NonBillable_Type
--Expected Output:
--BH
--PC


--13] Run this section, as the query which is used to build the final table.
-- and export to the output to [JPHSA-EBSQL1] table[zzz_p0021_4_for_Analysis_Part_A] in DB [ANASAZI].
-- From SQL Server Enterprise Manager, export from/to the same server/database
--zzz_p0021_4_for_Analysis_Part_A
SELECT     a.[Patient_No],a.[Patient_Birth_Date], a.[Check-In_Day],'Lab Orders (Count as 1 Svc)' as svc, a.loc, a.[Bill_Provider_Name], b.Type
FROM         dbo.T003_All_Monthly_Billable_Services_IDR a INNER JOIN
                      dbo.T001_Provider_Information_IDR b ON a.[Bill_Provider_Name] = b.ProviderName
WHERE     (a.[CPT_Code] LIKE '8%')
GROUP BY a.[Patient_No], a.[Patient_Birth_Date],a.[Check-In_Day], a.loc, a.[Bill_Provider_Name], b.Type

UNION ALL
SELECT     a.[Patient_No],a.[Patient_Birth_Date], a.[Check-In_Day], [CPT_Description]as svc,a.loc, a.[Bill_Provider_Name], b.Type
FROM         dbo.T003_All_Monthly_Billable_Services_IDR a INNER JOIN
                      dbo.T001_Provider_Information_IDR b ON a.[Bill_Provider_Name] = b.ProviderName
WHERE     (a.[CPT_Code] NOT LIKE '8%')

UNION ALL
SELECT     a.[Patient_No__Chart], a.[Patient_Birth_Date__Chart],a.[Date_Encounter],[Reason_for_Encounter] as svc, b.LOCATION, a.[Examining_Clinician], A.NonBillable_Type
FROM         dbo.zzz_p0021_2_NonBillServices_for_IDR a INNER JOIN
                      dbo.T001_Provider_Information_IDR b ON a.[Examining_Clinician] = b.ProviderName

-------------------------------------------------------------

-- Pull data from the table where it was saved: table[zzz_p0021_4_for_Analysis_Part_A] in DB [ANASAZI]
--=============================================================================
--14](A-001) East Jefferson - Primary Health Care - services -- {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('PC') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('EJ')


--15](A-002)East Jefferson - Primary Health Care - services - Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('PC') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('EJ') 
and a.[Patient_Birth_Date]<'19981031'  --<== This is the date for people who are 18 yrs and older at the end of the 'month'

 --16](A-003) West Jefferson - Primary Health Care - services -- {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('PC') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('WJ')

--17](A-004)West Jefferson - Primary Health Care - services - Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('PC') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('WJ') 
and a.[Patient_Birth_Date]<'19981031'  --<== This is the date for people who are 18 yrs and older at the end of the 'month'


--- # Client un-duplicated Individuals (i.e. count client only once, regardless of how many times they show up}
--18](A-005) un-duplicated IndividualsEast Jefferson - Primary Health Care - {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [Patient_No]
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('PC') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('EJ')


--19](A-006)un-duplicated Individuals - East Jefferson - Primary Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [Patient_No]
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('PC') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('EJ')
and a.[Patient_Birth_Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


--20](A-007)un-duplicated Individuals - West Jefferson - Primary Health Care -  {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [Patient_No]
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('PC') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('WJ')

--21](A-008)un-duplicated Individuals - West Jefferson - Primary Health Care - Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [Patient_No]
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('PC') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('WJ')
and a.[Patient_Birth_Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'

--22](A-009)TOTAL un-duplicated Individuals - Primary Health Care -  {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [Patient_No]
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('PC') and a.[Check-In_Day]between '20161001' and '20161031' 

--23](A-010)TOTAL un-duplicated Individuals - Primary Health Care - Adults {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [Patient_No]
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('PC') and a.[Check-In_Day]between '20161001' and '20161031'
and a.[Patient_Birth_Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'





---BH services
--24](A-011) East Jefferson - Behavioral Health Care - services -- {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('BH') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('EJ')

--25](A-012)East Jefferson - Behavioral Health Care - services - Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('BH') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('EJ')
and a.[Patient_Birth_Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'

--26](A-013) West Jefferson - Behavioral Health Care - services -- {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('BH') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('WJ')


--27](A-014)West Jefferson - Behavioral Health Care - services - Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   *
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('BH') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('WJ')
and a.[Patient_Birth_Date]<'19981031'--<== This is the date for people who are 18 yrs and older at the end of the 'month'




--- # Client unduplicated

 

---BH
--28](A-015) un-duplicated Individuals East Jefferson - Behavioral Health Care - {for a given month i.e. from first to lastdate  of the month}
SELECT  Distinct [Patient_No]
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('BH') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('EJ')



--29](A-016)un-duplicated Individuals - East Jefferson - Behavioral Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT  Distinct [Patient_No]
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('BH') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('EJ')
and a.[Patient_Birth_Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


--30](A-017) un-duplicated Individuals West Jefferson - Behavioral Health Care - {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [Patient_No]
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('BH') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('WJ')

--31](A-018)un-duplicated Individuals - East Jefferson - Behavioral Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT  Distinct [Patient_No]
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('BH') and a.[Check-In_Day]between '20161001' and '20161031' and a.loc in ('WJ')
and a.[Patient_Birth_Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


--32](A-019) un-duplicated Individuals - Total - Behavioral Health Care - {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [Patient_No]
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('BH') and a.[Check-In_Day]between '20161001' and '20161031'

--33](A-020)un-duplicated Individuals - Total - Behavioral Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [Patient_No]
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.TYPE in ('BH') and a.[Check-In_Day]between '20161001' and '20161031'
and a.[Patient_Birth_Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'



--34](A-021)un-duplicated Individuals - Total -  JeffCare(JPHSA PC and BH)

SELECT   Distinct [Patient_No]
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.[Check-In_Day]between '20161001' and '20161031'



--35](A-022)un-duplicated Individuals - Total - Adults -  JeffCare(JPHSA PC and BH)
SELECT   Distinct [Patient_No]
FROM         dbo.zzz_p0021_4_for_Analysis_Part_A a 
WHERE a.[Check-In_Day]between '20161001' and '20161031'
and a.[Patient_Birth_Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


-- This is raw data for audit
--Raw data
select * from dbo.zzz_p0021_4_for_Analysis_Part_A where TYPE in ('BH','PC')
-- and [Check-In_Day]between '20161001' and '20161031'