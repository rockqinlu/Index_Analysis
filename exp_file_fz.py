import pandas as pd
import numpy as np
from sqlalchemy import create_engine

# 数据库配置：
# 用户名
db_user = 'root'
# 密码
db_password = '123456'
# IP地址
db_host = '127.0.0.1'
# 端口号
db_port = 3306
# 数据库
db_name = 'rcjc'
engine = create_engine(f'mysql+pymysql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}', echo=True)

# 报表基础参数
p_stat_dt = "\'2021-02-28\'"
p_curr_cd = "\'HRMB\'"
p_peroid = 'M'
p_org = "\'BSBK9902\'"

org_dict = {'BSBK0002': '蒙商银行营业部', 'BSBK9901': '包头分行', 'BSBK9902': '赤峰分行', 'BSBK9903': '巴彦淖尔分行',
            'BSBK9904': '通辽分行', 'BSBK9906': '鄂尔多斯分行', 'BSBK9907': '锡林郭勒分行', 'BSBK9909': '呼伦贝尔分行',
            'BSBK9911': '呼和浩特分行', 'BSBK9912': '兴安盟分行', 'BSBK9913': '乌兰察布分行', 'BSBK9915': '乌海分行',
            'BSBK9916': '阿拉善分行', 'BSBK9918': '满洲里分行', 'BSBK9919': '二连浩特分行分行'}

sql_fz_1 = "SELECT X.INDIC_KEY, X.INDIC_NAME, X.STAT_DT, X.VALUE FROM rcjc_indic X " \
         "WHERE 1=1  AND X.INDIC_TYPE = \'1\' " \
         "AND X.STAT_DT <= DATE("+p_stat_dt+")  " \
         "AND X.ORG_NUM = "+p_org + " " \
         "AND X.CURR_CD = " + p_curr_cd + "  " \
         "ORDER BY STAT_DT,INDIC_KEY "
sql_fz_2 = "SELECT X.INDIC_KEY, X.INDIC_NAME, X.STAT_DT, X.VALUE FROM rcjc_indic X " \
         "WHERE 1=1  AND X.INDIC_TYPE = \'2\' " \
         "AND X.STAT_DT <= DATE("+p_stat_dt+")  " \
         "AND X.ORG_NUM = "+p_org + " " \
         "AND X.CURR_CD = " + p_curr_cd + "  " \
         "ORDER BY STAT_DT,INDIC_KEY "
sql_fz_3 = "SELECT X.INDIC_KEY, X.INDIC_NAME, X.STAT_DT, X.VALUE FROM rcjc_indic X " \
         "WHERE 1=1  AND X.INDIC_TYPE = \'3\' " \
         "AND X.STAT_DT <= DATE("+p_stat_dt+")  " \
         "AND X.ORG_NUM = "+p_org + " " \
         "AND X.CURR_CD = " + p_curr_cd + "  " \
         "ORDER BY STAT_DT,INDIC_KEY "
# print(sql_fz)
# 通过pandas读取 机构数据
data_fz_1 = pd.read_sql(sql_fz_1, engine).rename(columns={'INDIC_KEY': '指标ID', 'INDIC_NAME': '指标名称'})
data_fz_2 = pd.read_sql(sql_fz_2, engine).rename(columns={'INDIC_KEY': '指标ID', 'INDIC_NAME': '指标名称'})
data_fz_3 = pd.read_sql(sql_fz_3, engine).rename(columns={'INDIC_KEY': '指标ID', 'INDIC_NAME': '指标名称'})

# print('----------------------------资产负债输出 ----------------------------------------------------------------')
pd_exp_fz_1 = pd.pivot_table(data_fz_1, values='VALUE', index=['指标ID', '指标名称'], columns='STAT_DT',
                             aggfunc=np.sum, fill_value=0)
pd_exp_fz_1['均值'] = pd_exp_fz_1.mean(axis=1)
pd_exp_fz_1['标准差'] = pd_exp_fz_1.std(axis=1)
# pd_exp_zcfz.to_excel('D:\\test\\资产负债' + p_stat_dt + '.xls', sheet_name='资产负债表', na_rep=0, float_format="%.2f")

pd_exp_fz_2 = pd.pivot_table(data_fz_2, values='VALUE', index=['指标ID', '指标名称'], columns='STAT_DT',
                             aggfunc=np.sum, fill_value=0)
pd_exp_fz_2['均值'] = pd_exp_fz_2.mean(axis=1)
pd_exp_fz_2['标准差'] = pd_exp_fz_2.std(axis=1)
# pd_exp_zcfz.to_excel('D:\\test\\资产负债' + p_stat_dt + '.xls', sheet_name='资产负债表', na_rep=0, float_format="%.2f")

pd_exp_fz_3 = pd.pivot_table(data_fz_3, values='VALUE', index=['指标ID', '指标名称'], columns='STAT_DT',
                             aggfunc=np.sum, fill_value=0)
pd_exp_fz_3['均值'] = pd_exp_fz_3.mean(axis=1)
pd_exp_fz_3['标准差'] = pd_exp_fz_3.std(axis=1)
# pd_exp_zcfz.to_excel('D:\\test\\资产负债' + p_stat_dt + '.xls', sheet_name='资产负债表', na_rep=0, float_format="%.2f")

# print('---------------------------- excel输出 ----------------------------------------------------------------')
with pd.ExcelWriter('D:\\test\\path_to_file3.xlsx') as writer:
    pd_exp_fz_1.to_excel(writer, sheet_name='资产负债', na_rep=0, float_format="%.2f")
    pd_exp_fz_2.to_excel(writer, sheet_name='利润', na_rep=0, float_format="%.2f")
    pd_exp_fz_3.to_excel(writer, sheet_name='衍生指标', na_rep=0, float_format="%.2f")

