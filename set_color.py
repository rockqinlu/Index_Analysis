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

sql_zcfz = "SELECT T.STAT_DT, T.OP_ORG_NUM,T.TYPE, T.NBR, T.NAME, T.LAST_BAL, T.BAL  " \
           "FROM tmp_zcfz T WHERE T.CURR_CD = \'HRMB\'  " \
           "AND T.ORG_LEVEL = \'3\' AND T.STAT_DT = DATE(\'2020-12-31\') AND LEFT(T.OP_ORG_NUM,6) = \'BSBK99\'"
# 通过pandas读取 资产负债基础数据
data_zcfz = pd.read_sql(sql_zcfz, engine)
color_gradation = {1: '#227700', 2: '#55AA00', 3: '#77FF00', 4: '#BBFF66', 5: '#CCFF99',
                   10: '#FFCCCC', 11: '#FF8888', 12: '#FF0000', 13: '#AA0000', 14: '#880000'}
# ---------------------------------------! GO GO GO !------------------------------------------------------------------
# --------------------------------------- 1.格式处理 ------------------------------------------------------------------
data_zcfz['STAT_DT'] = pd.to_datetime(data_zcfz['STAT_DT'], format='%Y-%m-%d')
# --------------------------------------- 2.pivot_table ---------------------------------------------------------------
df_zcfz_tmp = pd.pivot_table(data_zcfz, values='BAL', index=['TYPE', 'NBR', 'NAME'], columns='OP_ORG_NUM',
                             aggfunc=np.sum, fill_value=0)
df_zcfz_z = df_zcfz_tmp.abs()


def style_color(df, colors):
    """
    :param df: pd.DataFrame
    :param colors: 字典  内容是 {标题:颜色}
    :return:
    """
    return df.style.apply(style_apply, colors=colors, axis=1)


def style_apply(series, colors, **kwargs):
    """
    :param series: 传过来的数据是DataFrame中的一行   类型为pd.Series
    :param colors: 内容是字典  其中key 为标题名   value 为颜色
    :return:
    """
#    print(series)
    s_color_rank = series.rank(method='dense', ascending=False)
#    print(s_color_rank)
    # second_name = series_names[1] if len(series_names) > 1 else ''
    back_ground_list = list()
    for index, value in s_color_rank.items():
        back_ground = ''
        if value in colors:
            back_ground = 'background-color: ' + colors.get(value)
        else:
            back_ground = 'background-color: ' + '#FFFFFF'
        back_ground_list.append(back_ground)
    return back_ground_list


# df_zcfz_z.style.apply(style_apply, colors=color_gradation, axis=1).to_excel('D:\\test111.xlsx', sheet_name='Sheet1',
#                                                                             engine='openpyxl')
style_df = style_color(df_zcfz_z, color_gradation)
style_df.to_excel('D:\\test111.xlsx', sheet_name='本期余额', na_rep=0, float_format="%.2f",
                  startrow=1, engine='openpyxl')
# --------------------------------------- 均值 ------------------------------------------------------------
# df_zcfz_z['v_mean'] = df_zcfz_z.mean(axis=1)
# df_zcfz_m = df_zcfz_z - df_zcfz_z['v_mean']
# df_zcfz_m.style.apply(style_apply, colors=color_gradation, axis=1).to_excel('D:\\test222.xlsx', sheet_name='比均值',
#                                                                  engine='openpyxl')
df_zcfz_m = (df_zcfz_z.sub(df_zcfz_z.mean(axis=1), axis=0)).div(df_zcfz_z.mean(axis=1), axis=0)
df_zcfz_m.style.apply(style_apply, colors=color_gradation, axis=1).to_excel('D:\\test222.xlsx', sheet_name='比均值',
                                                                            engine='openpyxl')
# --------------------------------------- 环比 ------------------------------------------------------------
df_zcfz_tmp2 = pd.pivot_table(data_zcfz, values='LAST_BAL', index=['TYPE', 'NBR', 'NAME'], columns='OP_ORG_NUM',
                              aggfunc=np.sum, fill_value=0)
df_zcfz_z2 = df_zcfz_tmp2.abs()
df_new = (df_zcfz_z - df_zcfz_z2)/df_zcfz_z
df_new.style.apply(style_apply, colors=color_gradation, axis=1).to_excel('D:\\test333.xlsx', sheet_name='环比',
                                                                         engine='openpyxl')
