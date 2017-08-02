--p_0004_SP_202_SSRS_Usage_SearchByPage_TEST.sql



use d1_IT
go

EXECUTE AS USER='JPHSA01\ggarson'

EXEC  p_0004_SP_202_SSRS_Usage_SearchByPage  @BeginDate = '02-08-2017', @EndDate = '02-10-2017', @SearchString=''

revert