--p_0021_RESEARCH_03_Test_Pivot_MultiMonthly.sql

SELECT LineNumber, [2016_07], [2016_08]
  FROM
(
  SELECT LineNumber, YYYY_MM, Result
    FROM zzz_p0021_27_MultiMonth_A_B_C_IDR_Results
) s
PIVOT
(
  MAX(Result) FOR YYYY_MM IN ([2016_07], [2016_08])
) p