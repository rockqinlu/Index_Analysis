import pandas as pd
import sqlalchemy
from sqlalchemy import create_engine

# 参数
# 报表路径、Sheet页名称
p_report_path = 'D:\\20210228_ST.xls'
p_report_sheet_name = 'GL_SUBJ_MONTH'
# p_curr_cd = 'HRMB'
# 数据库用户名
win_user = 'root'
# 数据库密码
win_password = '123456'
# 数据库ip地址
win_host = '127.0.0.1'
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
