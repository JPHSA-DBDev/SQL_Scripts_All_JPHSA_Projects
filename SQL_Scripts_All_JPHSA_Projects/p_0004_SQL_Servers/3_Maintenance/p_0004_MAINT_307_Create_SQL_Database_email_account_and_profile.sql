--p_0004_MAINT_307_Create_SQL_Database_email_account_and_profile.sql


EXECUTE msdb.dbo.sysmail_add_account_sp  
    @account_name = 'Email_for_SQL_Jobs',  
    @description = 'Email_for_SQL_Jobs',  
    @email_address = 'SQL_email_du@jphsa.org',  
    @replyto_address = 'ggarson@jphsa.org',  
    @display_name = 'SQL_SERVER_Alert - DoNotReply',  
    @mailserver_name = '10.11.54.25' ;  

-- Create a Database Mail profile  

EXECUTE msdb.dbo.sysmail_add_profile_sp  
    @profile_name = 'SQL_Server_Alerts_Profile',
    @description = 'Alerts from SQL jobs should be directed to this distribution group (e.g. backup failures).' ;  

-- Add the account to the profile  

EXECUTE msdb.dbo.sysmail_add_profileaccount_sp  
    @profile_name = 'SQL_Server_Alerts_Profile',  
    @account_name = 'Email_for_SQL_Jobs',  
    @sequence_number =1 ;  

-- Grant access to the profile to all users in the msdb database  

EXECUTE msdb.dbo.sysmail_add_principalprofile_sp  
    @profile_name = 'SQL_Server_Alerts_Profile',  
    @principal_name = 'public',  
    @is_default = 1 ;  
