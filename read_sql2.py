import pandas as pd
import numpy as np
from sqlalchemy import create_engine

# 数据库用户名
db_user = 'root'
# 数据库密码
db_password = ''
# 数据库ip地址
db_host = 'localhost'
# 端口号
db_port = 3306
# 数据库
db_name = 'rcjc'
engine = create_engine(f'mysql+pymysql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}', echo=True)
color_gradation = {1: '#227700', 2: '#55AA00', 3: '#77FF00', 4: '#BBFF66', 5: '#CCFF99',
                   10: '#FFCCCC', 11: '#FF8888', 12: '#FF0000', 13: '#AA0000', 14: '#880000'}
# ---------------------------------------! GO GO GO !------------------------------------------------------------------
sql_zcfz = "SELECT T.STAT_DT, T.OP_ORG_NUM,T.TYPE, T.NBR, T.NAME, T.LAST_BAL, T.BAL  " \
           "FROM tmp_zcfz T WHERE T.CURR_CD = \'HRMB\'  " \
           "AND T.ORG_LEVEL = \'3\' AND T.STAT_DT = DATE(\'2020-12-31\') AND LEFT(T.OP_ORG_NUM,6) = \'BSBK99\'"
# 通过pandas读取 资产负债基础数据
data_zcfz = pd.read_sql(sql_zcfz, engine)
# --------------------------------------- 1.格式处理 ------------------------------------------------------------------
data_zcfz['STAT_DT'] = pd.to_datetime(data_zcfz['STAT_DT'], format='%Y-%m-%d')
# data_zcfz.pivot(index='NAME', columns='OP_ORG_NUM', values=['LAST_BAL', 'BAL'])
# --------------------------------------- 2.pivot_table ---------------------------------------------------------------
df_zcfz_tmp = pd.pivot_table(data_zcfz, values='BAL', index=['TYPE', 'NBR', 'NAME'], columns='OP_ORG_NUM',
                             aggfunc=np.sum, fill_value=0)
# df_zcfz_tmp['sd'] = df_zcfz_tmp.mean(axis=1)
# print(df_zcfz_tmp.iloc[0])
# print(df_zcfz_tmp.iloc[0].rank(method='dense', ascending=False))
s_color_tmp = df_zcfz_tmp.iloc[0]
s_color_rank = s_color_tmp.rank(method='dense', ascending=False)
df_color_tmp = pd.DataFrame([s_color_tmp, s_color_rank])
# df_color_tmp['v_rank'] = df_color_tmp
# print(df_color_tmp)
df_color_tmp.to_excel('D:\\test111.xls', sheet_name='Sheet1', na_rep=0, float_format="%.2f")
# ---------------------------------------! GO GO GO !------------------------------------------------------------------
sql_lr = "SELECT T.STAT_DT, T.OP_ORG_NUM,T.TYPE, T.NBR, T.NAME, T.INDIC_VAL " \
         "FROM v_LR_detail T " \
         "WHERE T.CURR_CD = \'HRMB\'  " \
         "AND T.ORG_LEVEL = \'3\' " \
         "AND T.STAT_DT = DATE(\'2020-12-31\') " \
         "AND LEFT(T.OP_ORG_NUM,6) = \'BSBK99\' "
# 通过pandas读取 利润数据
data_lr = pd.read_sql(sql_lr, engine)
data_lr['STAT_DT'] = pd.to_datetime(data_lr['STAT_DT'], format='%Y-%m-%d')
df_lr_tmp = pd.pivot_table(data_lr, values='INDIC_VAL', index=['TYPE', 'NBR', 'NAME'], columns='OP_ORG_NUM',
                           aggfunc=np.sum, fill_value=0)
