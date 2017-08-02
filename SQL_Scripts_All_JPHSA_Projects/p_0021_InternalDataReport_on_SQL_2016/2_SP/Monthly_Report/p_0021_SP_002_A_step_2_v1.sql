--p_0021_SP_002_A_step_2_v1.sql

--===========================================================================
/* 	
 
	DESCIPTION: This checks for empty values in the three fields of zzz_p0021_3_Missing_Providers
					IF there are no missing data the transaction is committed.
					HOWEVER if there is missing data then
					Either delete the records with missing values, or populate the missing values, and try again
					

					If there are no missing values, then the 'Missing' providers and their correspoinding data
					are inserted into: [T001_Provider_Information_IDR]

					If you see any records in the results pane, you probably have a problem.
					If the results pane then check the MESSAGE Pane for the message:
						'The transaction was Committed'
						In that case you can proceed to the subsequent steps.
	NOTE: 
			Create:		T001_Provider_Information_IDR
			Append to:	T005_Providers_to_exclude_IDR
	Created: 3/17/2012
	By: glenn garson

*/
--===========================================================================

USE Success
GO






DECLARE @ThereAreNullValues BIT
SELECT @ThereAreNullValues = 0

BEGIN TRAN
	BEGIN TRY

		-- 1] ==========================================================================
		SELECT 'List of Providers with Null or missing names '
				
		SELECT *
		FROM zzz_p0021_3_Missing_Providers
		WHERE (
				([Providername] is NULL) 
				or 
				(rtrim(ltrim([Providername]))) = ''
			  )

		IF @@ROWCOUNT <> 0
			BEGIN
				PRINT '[Providername] has null, or missing values'
				SELECT @ThereAreNullValues = @ThereAreNullValues + 1
			END
		ELSE
			BEGIN
				PRINT '[Providername] does NOT have null, or missing values'
			END

		-- 2] ==========================================================================
		SELECT 'List of Providers with Null or missing Location'
				
		SELECT *
		FROM zzz_p0021_3_Missing_Providers
		WHERE rtrim(ltrim([LOCATION])) = ''

		IF @@ROWCOUNT <> 0
			BEGIN
				PRINT '[LOCATION] has null values'
				SELECT @ThereAreNullValues = @ThereAreNullValues + 1
			END
		ELSE
			BEGIN
				PRINT '[LOCATION] does NOT have null values'
			END

		-- 3] ==========================================================================
		SELECT 'List of Providers with Null or missing Type'		
		SELECT *
		FROM zzz_p0021_3_Missing_Providers
		WHERE (rtrim(ltrim([Type])) = '')

		IF @@ROWCOUNT <> 0
			BEGIN
				PRINT '[Type] has null values'
				SELECT @ThereAreNullValues = @ThereAreNullValues + 1
			END
		ELSE
			BEGIN
				PRINT '[Type] does NOT have null values'
			END

		-- 4] ==========================================================================


		INSERT INTO T001_Provider_Information_IDR (
													[Providername],
													[LOCATION],
													[Type]
													)
		SELECT 
				[Providername],
				[LOCATION],
				[Type]

		FROM zzz_p0021_3_Missing_Providers

		-- 5] ==========================================================================
		--This adds providers to exclude in the future (i.e. any providers listed in: T005_Providers_to_exclude_IDR)

		INSERT INTO T005_Providers_to_exclude_IDR (
													[Providername]
													)
		SELECT 
				[Providername]

		FROM zzz_p0021_3_Providers_To_ignore

		-- ==========================================================================

		IF @ThereAreNullValues = 0
			BEGIN
				PRINT 'The transaction was Committed'
				COMMIT TRAN
			END
			ELSE
				BEGIN
					PRINT 'The transaction will not be Committed'
					RAISERROR (15600,-1,-1, 'Either delete the records with missing values, or populate the missing values in [zzz_p0021_3_Missing_Providers]');  
				END
		-- ==========================================================================
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN  
		SELECT 'ERROR Messages from the CATCH statement' 
		SELECT ERROR_MESSAGE ()
	END CATCH