

USE [d1_IT]
GO



-- add 2 columns for attached devices w/ JPHSA IP numbers
alter table T004_IP_Inventory
ADD [Attached_T004_IP_Device-1_FK] INT NULL

alter table T004_IP_Inventory
ADD [Attached_T004_IP_Device-2_FK] INT NULL
