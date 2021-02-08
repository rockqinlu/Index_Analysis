import pandas as pd
import pymysql

conn = pymysql.connect(
    host='127.0.0.1',
    user='root',
    passwd='',
    db='rcjc',
    port=3306,
    charset='utf8'
)
# 使用cursor()方法获取操作游标
cursor = conn.cursor()
# sql script
sql = "SELECT * FROM GL_ACCT_ALL"

# 执行sql
cursor.execute(sql)
# 调阅存储过程
cursor.callproc()

result = cursor.fetchall()
conn.commit()

# 执行结果转化为dataframe
df = pd.DataFrame(list(result))
# 关闭游标
cursor.close()
# 关闭数据库连接
conn.close()
