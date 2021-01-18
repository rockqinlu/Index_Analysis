import pandas as pd
# import pymysql

tmp_df = pd.read_excel('D:\\test.xls', sheet_name='Sheet1', dtype={'GL_ACCT': str, 'F_CURR_CD': str})
print(tmp_df.info())
print('----------------------- 格式处理 -----------------------------------')
# 日期转换
tmp_df['STAT_DT'] = pd.to_datetime(tmp_df['STAT_DT'], format='%Y%m%d')

# 金额转字符
tmp_df['LAST_D_BAL'] = pd.to_numeric(tmp_df['LAST_D_BAL'], errors='coerce')
tmp_df['LAST_C_BAL'] = pd.to_numeric(tmp_df['LAST_C_BAL'], errors='coerce')
tmp_df['DR_AMT'] = pd.to_numeric(tmp_df['DR_AMT'], errors='coerce')
tmp_df['CR_AMT'] = pd.to_numeric(tmp_df['CR_AMT'], errors='coerce')
tmp_df['DR_BAL'] = pd.to_numeric(tmp_df['DR_BAL'], errors='coerce')
tmp_df['CR_BAL'] = pd.to_numeric(tmp_df['CR_BAL'], errors='coerce')
print(tmp_df.info())
# print('------------------------cc----------------------------------')
# des_df = tmp_df.loc[:, ['STAT_DT', 'GL_ACCT', 'LAST_D_BAL', 'LAST_C_BAL', 'DR_AMT', 'CR_AMT', 'DR_BAL', 'CR_BAL']]
# sql part
print(tmp_df['STAT_DT'])




