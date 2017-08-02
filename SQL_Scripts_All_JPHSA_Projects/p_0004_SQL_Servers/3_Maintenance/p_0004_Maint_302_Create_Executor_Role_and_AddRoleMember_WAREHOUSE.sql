--p_0004_Maint_302_Create_Executor_Role_and_AddRoleMember_WAREHOUSE.sql
--from: http://www.sqlmatters.com/Articles/Adding%20a%20db_executor%20role.asp


USE OBH_DATA_REVIEW
go

-- Create a db_executor role
CREATE ROLE db_executor

-- Grant execute rights to the new role
GRANT EXECUTE TO db_executor 

EXEC sp_addrolemember  @rolename ='db_executor',@membername ='JPHSA01\ssrs_OBH_DATA_REVIEW'
----------------------------------------------------------------------------------------------
