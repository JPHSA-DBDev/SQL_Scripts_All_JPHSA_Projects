--prj_0004_Maint_302_Create_Executor_Role_and_AddRoleMember.sql
--from: http://www.sqlmatters.com/Articles/Adding%20a%20db_executor%20role.asp


USE d3_JPHSA_All_Users
go

-- Create a db_executor role
CREATE ROLE db_executor

-- Grant execute rights to the new role
GRANT EXECUTE TO db_executor 

EXEC sp_addrolemember  @rolename ='db_executor',@membername ='d3_WebFE'
----------------------------------------------------------------------------------------------
--USE d1_IT
--go

---- Create a db_executor role
--CREATE ROLE db_executor

---- Grant execute rights to the new role
--GRANT EXECUTE TO db_executor 

--EXEC sp_addrolemember  @rolename ='db_executor',@membername ='JPHSA01\SQL_PROD_Read_All'