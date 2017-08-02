--p_0003_MAIN_024_INSERT_SignaturePads_INTO_T004.sql

INSERT INTO [d1_IT].[dbo].[T004_IP_Inventory] ( 												--<== Already existing table
							[JPHSA_Tag]
							,[Vendor_Service_Tag]
							,[Room_Number]
							,[User]
							,[Group]
							,[DeviceType_T005_e1]
							,[Model_Brand]
							,[Building_T005_e2]
							,[DeviceStatus_T005_e3]
							  )
SELECT 
							[JPHSA_Tag]
							,[Vendor_Service_Tag]
							,[Room_Number]
							,[User]
							,[Group]
							,[DeviceType_T005_e1]
							,[Model_Brand]
							,[Building_T005_e2]
							,[DeviceStatus_T005_e3]
		
FROM [d1_IT].[dbo].[zzzSignaturePad_2017_06_27];