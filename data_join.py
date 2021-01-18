import pandas as pd
import sqlalchemy
from sqlalchemy import create_engine

# 参数
# 报表路径、Sheet页名称
p_report_path = 'D:\\model_5241_6904071M.xls'
p_report_sheet_name = 'GL_SUBJ_MONTH'
# p_curr_cd = 'HRMB'
# 数据库用户名
win_user = 'root'
# 数据库密码
win_password = ''
# 数据库ip地址
win_host = 'localhost'
# 端口号
win_port = 3306
# 数据库
win_test = 'rcjc'
engine = create_engine(f'mysql+pymysql://{win_user}:{win_password}@{win_host}:{win_port}/{win_test}', echo=True)
# ---------------------------------------! GO GO GO !------------------------------------------------------------------
# report to DF
tmp_df = pd.read_excel(p_report_path, sheet_name=p_report_sheet_name, dtype={'GL_ACCT': str,
                                                                             'F_CURR_CD': str,
                                                                             'OP_ORG_NUM': str,
                                                                             'CURR_CD': str,
                                                                             'GL_BAL_TYPE_CD': str})
print('-----------------------------1. report 格式处理 ---------------------------------------------------------------')
# 日期\金额 转换
tmp_df['STAT_DT'] = pd.to_datetime(tmp_df['STAT_DT'], format='%Y%m%d')
tmp_df['LAST_D_BAL'] = pd.to_numeric(tmp_df['LAST_D_BAL'], errors='coerce')
tmp_df['LAST_C_BAL'] = pd.to_numeric(tmp_df['LAST_C_BAL'], errors='coerce')
tmp_df['DR_AMT'] = pd.to_numeric(tmp_df['DR_AMT'], errors='coerce')
tmp_df['CR_AMT'] = pd.to_numeric(tmp_df['CR_AMT'], errors='coerce')
tmp_df['DR_BAL'] = pd.to_numeric(tmp_df['DR_BAL'], errors='coerce')
tmp_df['CR_BAL'] = pd.to_numeric(tmp_df['CR_BAL'], errors='coerce')
print('----------------------------number null 值处理 ----------------------------------------------------------------')
tmp_df['LAST_D_BAL'] = tmp_df['LAST_D_BAL'].fillna(0)
tmp_df['LAST_C_BAL'] = tmp_df['LAST_C_BAL'].fillna(0)
tmp_df['DR_AMT'] = tmp_df['DR_AMT'].fillna(0)
tmp_df['CR_AMT'] = tmp_df['CR_AMT'].fillna(0)
tmp_df['DR_BAL'] = tmp_df['DR_BAL'].fillna(0)
tmp_df['CR_BAL'] = tmp_df['CR_BAL'].fillna(0)
print('-----------------------------report 格式处理 完成 ---------------------------------------------------------------')
# report 格式处理 完成
des_df = tmp_df.loc[:, ['STAT_DT', 'OP_ORG_NUM', 'CURR_CD', 'GL_ACCT', 'GL_BAL_TYPE_CD',
                        'LAST_D_BAL', 'LAST_C_BAL',
                        'DR_AMT', 'CR_AMT',
                        'DR_BAL', 'CR_BAL']]
des_df.to_sql('gl_subj_month', engine,
              if_exists='append', index=False,
              dtype={
                  "STAT_DT": sqlalchemy.types.DATE,
                  "OP_ORG_NUM": sqlalchemy.types.String(length=32),
                  "CURR_CD": sqlalchemy.types.String(length=8),
                  "GL_ACCT": sqlalchemy.types.String(length=32),
                  "GL_BAL_TYPE_CD": sqlalchemy.types.String(length=2)
              })
print('-----------------------------   SQL DATA  -------------------------------------------------------------------')
# sql语句
sql_zcfz = "SELECT T.* FROM v_zcfz_detail T WHERE T.CURR_CD = \'HRMB\' " \
           " AND T.OP_ORG_NUM = 'BSBK9901' AND T.STAT_DT = DATE(\'2020-12-31\')"
# 通过pandas读取 机构数据
data_zcfz = pd.read_sql(sql_zcfz, engine)
print('----------------------------report 4级机构拼接 ----------------------------------------------------------------')
# result = pd.merge(des_df, data_org, how='inner', left_on='OP_ORG_NUM', right_on='ORG_NUM')
# result.to_excel('D:\\test11.xls', sheet_name='Sheet1')
# 通过pandas读取 科目层级数据
# data_acct = pd.read_sql(sql_acct, engine)
# result2 = pd.merge(result, data_acct, how='inner', left_on='GL_ACCT', right_on='GL_ACCT3')
# result2.to_excel('D:\\test22.xls', sheet_name='Sheet1')
print(data_zcfz.info())
