--aaa_2017_02_14_Source_B_Quarterly.sql

--NOTE for the quarter change the BEGIN and END date to the first and last date of the Quarter for the SQL statements
--NOTE for the YTD change the BEGIN and END date to the first and last date of the time period for the SQL statements
-- July 1st is the begining of the YTD time period
-- First Quarter 7/1/yyyy - 9/30/yyyy
-- Second Quarter 10/1/yyyy - 12/31/yyyy
-- Third Quarter  1/1/YYYY - 3/31/YYYY
-- Fourth Quarter 4/1/YYYY - 6/30/YYYY

-- Steps 1 through Step 17 is done previously in: aaa_2017_01_31_Source_A.sql

-------------------------------------------------------------


--- # Client un-duplicated Individuals (i.e. count client only once, regardless of how many times they show up}
--18](Q-001) un-duplicated IndividualsEast Jefferson - Primary Health Care - {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')


--19](Q-002)un-duplicated Individuals - East Jefferson - Primary Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')
and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


--20](Q-003)un-duplicated Individuals - West Jefferson - Primary Health Care -  {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')

--21](Q-004)un-duplicated Individuals - West Jefferson - Primary Health Care - Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')
and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'

--22](Q-005)TOTAL un-duplicated Individuals - Primary Health Care -  {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' 

--23](Q-006)TOTAL un-duplicated Individuals - Primary Health Care - Adults {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031'
and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


-- Steps 24 through 27 are done for the monthly, and not needed now to get the Quarterly data




--- # Client unduplicated

 

---BH
--28](Q-007) un-duplicated Individuals East Jefferson - Behavioral Health Care - {for a given month i.e. from first to lastdate  of the month}
SELECT  Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')



--29](Q-008)un-duplicated Individuals - East Jefferson - Behavioral Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT  Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')
and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


--30](Q-009) un-duplicated Individuals West Jefferson - Behavioral Health Care - {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')

--31](Q-010)un-duplicated Individuals - East Jefferson - Behavioral Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
SELECT  Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')
and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


--32](Q-011) un-duplicated Individuals - Total - Behavioral Health Care - {for a given month i.e. from first to lastdate  of the month}
SELECT   Distinct [patient #]
FROM         dbo.EHSS a 
WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031'

--33](Q-012)un-duplicated Individuals - Total - Behavioral Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
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