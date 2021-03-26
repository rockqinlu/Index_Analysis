-- DROP VIEW v_ywzk_tmp

CREATE  VIEW v_ywzk_tmp AS 
SELECT
	t.STAT_DT AS STAT_DT,
	t.GL_ACCT AS GL_ACCT,
	g.GL_ACCT_NAME AS GL_ACCT_NAME,
	g.GL_ACCT_LEVEL AS GL_ACCT_LEVEL,
	t.CURR_CD AS CURR_CD,
	t.PERIOD AS PERIOD,
	t.OP_ORG_NUM AS ORG_NUM,
	round(t.LAST_D_BAL, 2) AS LAST_D_BAL,
	(
		CASE
		WHEN (t.LAST_C_BAL <= 0) THEN
			abs(round(t.LAST_C_BAL, 2))
		ELSE
			(
				- (1) * round(t.LAST_C_BAL, 2)
			)
		END
	) AS LAST_C_BAL,
	round(t.DR_AMT, 2) AS DR_AMT,
	(
		CASE
		WHEN (t.CR_AMT <= 0) THEN
			abs(round(t.CR_AMT, 2))
		ELSE
			(-(1) * round(t.CR_AMT, 2))
		END
	) AS CR_AMT,
	round(t.DR_BAL, 2) AS DR_BAL,
	(
		CASE
		WHEN (t.CR_BAL <= 0) THEN
			abs(round(t.CR_BAL, 2))
		ELSE
			(-(1) * round(t.CR_BAL, 2))
		END
	) AS CR_BAL
FROM
	(
		t09_ywzk_summary t
		JOIN t00_gl_ms_acct g
	)
WHERE 1 = 1   
	AND t.GL_ACCT = g.GL_ACCT
	AND G.MAGT_GL_ACCT NOT IN('NORMALACT','BUSI_TAX','0','SPECIALACT')