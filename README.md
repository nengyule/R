# R
## 数据结构
- 数值型：数值可以用于直接结算，加减乘除
- 字符串型：可以进行连接、转换、提取等
- 逻辑型：或真或假
- 日期型：存储日期
- 向量：类似一维数组，存储同种类型的数据
- 矩阵：矩阵是一个按照长方阵列排列的复数或实数集合，向量是一维的，矩阵是二维的，需要有行和列
- 列表：类似多维数组，可以存储不同类型的数据
- 数据框：特殊的列表，存储行列的数据，实际为数据结构不同的向量的列表
## 向量
- 正（负）整数索引   
向量x，访问第一个值使用x[1]，可以使用length()访问向量的个数；若使用负整数进行索引，表示访问除了这一行的其他行数据，比如不访问一个三行数据的第二行，可以使用x[-2]。
- 逻辑向量索引   
向量x，x[c(T,F,F,F,F)]是访问第一个值，搭配%in%，y %in% x，是输出一个x中有y的值，位置逻辑向量，可以方便的查询向量的数据；还可以进行逻辑判断，x[x>4 & x<9]是访问向量中大于4，小于9的值。
 - 名称索引   
向量x，使用names()函数为向量的每一个元素添加名称，然后就可以使用x["index"]来访问名为index的值。
- 索引应用   
使用索引可以给向量添加值，x <- c(1:100)，x[101] <- 101，x的长度从100变成了101，也可以一次性添加多个元素；在向量中插入一个新元素，可以使用append()函数，append(x=x,values = 99,after = 5)，这是在第5个后面添加数据；删除向量，可以使用rm()函数，rm(x)；删除元素可以使用负整数索引，重新赋值就行；修改向量值：直接将需要修改的值索引出来，然后给它赋一个新的值就可以了；但是注意这里是数值型的向量，不能赋值给字符串，会把整个向量变成字符型向量。
- 向量运算   
向量是R中最基本的数据结构。向量运算是对应位置的元素进行运算，其中长的向量的个数必须是短向量个数的整数倍。   
Ceiling()不小于x的最小整数；   
floor()函数不大于x的最大整数；   
Trunc()函数返回整数部分；   
Round()函数用于进行四舍五入，digits用来表示返回的位数；   
Signif()保留小数部分有效数字，digits用来表示返回的位数；   
Which()函数可以返回索引值，也就是元素所在的位置，which.max(x)。
## 矩阵与数组


