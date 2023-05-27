# R
## 数据结构
- 数值型：数值可以用于直接结算，加减乘除
- 字符串型：可以进行连接、转换、提取等
- 逻辑型：或真或假
- 日期型：存储日期
- 向量：类似一维数组，存储同种类型的数据
- 列表：类似多维数组，可以存储不同类型的数据
- 数据框：特殊的列表，存储行列的数据，实际为数据结构不同的向量的列表
## 索引
1. 向量索引
- 正（负）整数索引
向量x，访问第一个值使用x[1]，可以使用length()访问向量的个数；
若使用负整数进行索引，表示访问除了这一行的其他行数据，比如不访问一个三行数据的第二行，可以使用x[-2]
2. 逻辑向量索引

