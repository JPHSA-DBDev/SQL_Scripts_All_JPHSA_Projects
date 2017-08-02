----p_0021_MAINT_306_DELETE_TABLES.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 03/14/2017
	By: glenn garson
	************************************************************************************
*/
USE [Success]
GO


IF OBJECT_ID('dbo.zzz_p0021_1_IDR_part_A_results') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_1_IDR_part_A_results

IF OBJECT_ID('dbo.zzz_p0021_1_IDR_part_B_and_C') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_1_IDR_part_B_and_C

IF OBJECT_ID('dbo.zzz_p0021_2_NonBillServices_for_IDR') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_2_NonBillServices_for_IDR

IF OBJECT_ID('dbo.zzz_p0021_3_Missing_Providers') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_3_Missing_Providers

IF OBJECT_ID('dbo.zzz_p0021_4_for_Analysis_of_Part_A') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_4_for_Analysis_of_Part_A

IF OBJECT_ID('dbo.zzz_p0021_5_IDR_part_Q_Results') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_5_IDR_part_Q_Results

IF OBJECT_ID('dbo.zzz_p0021_5_Q_NonBillServices_for_IDR') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_5_Q_NonBillServices_for_IDR

IF OBJECT_ID('dbo.zzz_p0021_6_for_Analysis_of_Part_Q') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_6_for_Analysis_of_Part_Q

IF OBJECT_ID('dbo.Billable_Service_2017_02_23') IS NOT NULL
    DROP TABLE dbo.Billable_Service_2017_02_23

IF OBJECT_ID('dbo.NON_Billable_Service_2017_02_23') IS NOT NULL
    DROP TABLE dbo.NON_Billable_Service_2017_02_23

go