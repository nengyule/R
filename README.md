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
&emsp;&emsp;向量x，访问第一个值使用x[1]，可以使用length()访问向量的个数；若使用负整数进行索引，表示访问除了这一行的其他行数据，比如不访问一个三行数据的第二行，可以使用x[-2]。
- 逻辑向量索引   
&emsp;&emsp;向量x，x[c(T,F,F,F,F)]是访问第一个值，搭配%in%，y %in% x，是输出一个x中有y的值，位置逻辑向量，可以方便的查询向量的数据；还可以进行逻辑判断，x[x>4 & x<9]是访问向量中大于4，小于9的值。
 - 名称索引   
&emsp;&emsp;向量x，使用names()函数为向量的每一个元素添加名称，然后就可以使用x["index"]来访问名为index的值。
- 索引应用   
&emsp;&emsp;使用索引可以给向量添加值，x <- c(1:100)，x[101] <- 101，x的长度从100变成了101，也可以一次性添加多个元素；在向量中插入一个新元素，可以使用append()函数，append(x=x,values = 99,after = 5)，这是在第5个后面添加数据；删除向量，可以使用rm()函数，rm(x)；删除元素可以使用负整数索引，重新赋值就行；修改向量值：直接将需要修改的值索引出来，然后给它赋一个新的值就可以了；但是注意这里是数值型的向量，不能赋值给字符串，会把整个向量变成字符型向量。
- 向量运算   
&emsp;&emsp;向量是R中最基本的数据结构。向量运算是对应位置的元素进行运算，其中长的向量的个数必须是短向量个数的整数倍。   
&emsp;&emsp;Ceiling()不小于x的最小整数；   
&emsp;&emsp;floor()函数不大于x的最大整数；   
&emsp;&emsp;Trunc()函数返回整数部分；   
&emsp;&emsp;Round()函数用于进行四舍五入，digits用来表示返回的位数；   
&emsp;&emsp;Signif()保留小数部分有效数字，digits用来表示返回的位数；   
&emsp;&emsp;Which()函数可以返回索引值，也就是元素所在的位置，which.max(x)。
## 矩阵与数组
&emsp;&emsp;在R软件中，矩阵是有维数的向量，这里的矩阵元素可以是数值型，字符性改革或者是逻辑型，但是每个元素必须都拥有相同的模式，这个和向量一致，我们可以通过matrix()函数来创建矩阵。行数和列数的分配要满足分配的条件，如果只给出一个行或者是一个列，R会自动进行分配，可以通过byrow来指定按行还是按列进行排列；Dinames参数可以通过一个列表，指定矩阵行和列的名字；Dim()函数可以显示向量的维数，可以通过dim()函数来对向量添加维数，从而构建矩阵；数组数据结构，R中的数组其实就是多维的矩阵组这个数据结构，R中的数组其实就是多维的矩阵；只要向dim()函数传入三个参数，就可以构建三位数组，数组还可以使用array()函数来创建；矩阵中的四则运算需要行和列一致，与向量一致，可以使用colsums()、rowsums()、rowmeans()等函数对整个矩阵进行计算也可以进行矩阵的乘法； * 内积，% * % 外积
## 列表
&emsp;&emsp;可以使用list()函数来创建列表，也可以为每个变量添加一个名称，列表中的元素不存在顺序，使用名称就可以访问数据，也可以使用索引方位数据，x[行,列]，类似向量索引的方法访问数据，列表比之后的数据框多了一种$的访问方式，x$列名，可以访问一列；对于列表还有一种双中括号的访问方式，两者的差别在于，一个中括号其实输出的是列表的一个子集，它其实还是一个列表，因为如果一个访问多个元素，这些元素的数据类型又不同，那么输出结果只能是列表，当我们使用两个中括号进行输出，那么就是输出数据本身的类型，可以使用class()函数来测试一下；两个中括号每次只能访问一个元素，如果要像列表中添加元素，可以使用双中括号进行添加，如果想删除列表中的元素可以使用负索引的方式，然后再赋值给原来的列表，或者是使用Null来赋值。
## 数据框
&emsp;&emsp;数据框是一种表格式的数据结构，数据框子在模拟数据集，与其他统计软件例如SAS或者SPSS中的数据集的概念一致，数据集通常是由数据构成的一个矩形数组，行表示观测，列表示变量，不同的行业对于数据集的行和列叫法不同；   
&emsp;&emsp;数据框实际上是一个列表，列表中的元素是向量，这些向量构成数据框的列，每一列必须具有相同的长度，所以数据框市矩形结构，而且数据框的列必须命名；   
&emsp;&emsp;矩阵和数据框的不同，矩阵必须是同一数据类型，数据框每一列必须为同一类型，每一行可以不同   
&emsp;&emsp;数据框可以通过data.frame()函数进行创建；   
&emsp;&emsp;数据框的访问：直接使用索引；直接使用名称进行索引；   
&emsp;&emsp;可以使用attach()将数据集存进R的内存，这样就便于访问；   
&emsp;&emsp;使用完之后可以使用detach()函数取消加载；   
&emsp;&emsp;数据框也可以使用双中括号的方式进行访问，返回的是向量而不是列表。
## 因子
&emsp;&emsp;在R中变量可以分为名义型变量、有序型变量、连续型变量，名义型变量没有顺序的区别，有序型变量介于二者之间，不同值之间有顺序关系。   
&emsp;&emsp;在R中，名义型变量和有序型变量被称为因子，factor，这些分类变量的可能只被称为一个水平，level，例如good、better、best，都被称为一个level，由这些水平值构成的向量就称为因子。在很多输出函数中，输入的数据也必须是因子类型。例如mtcars数据集，cyl这一列可以作为因子，而4、6、8就是这一列因子的水平。factor函数，定义一个因子数据；还可以在定义因子的时候人为指定level的水平，cut()函数，可以将连续型变量x分割成连续水平的因子。
## 缺失数据
&emsp;&emsp;在R中，用NA代表缺失值，NA是不可用的意思，用于存储缺失信息，这里缺失值NA表示没有，但注意不一定就是0，NA是不知道是多少，也可能是0，也可能是任何值，缺失值和值为零是完全不同的。但是有时候NA值的缺失会导致数据计算出现问题，剔除NA值，可以通过一些函数的na.rm选项参数剔除；NA值剔除之后才求平均值，is.na()函数判断数据框中是否有NA值，可以使用colsums()和rowsums()来计算每一行的缺失值数目，如果想去除掉数据集中的缺失值，形成一个新的函数，则可以使用na.omit()函数，使用na.omit()函数处理数据框，通常是直接删除缺失的行或者列，但是这样处理有一个问题，就是当缺失值超过一半的时候，会对分析结果造成很大的影响，所以R中有很多处理缺失值的办法；其他缺失数据；缺失数据NaN，代表不可能的值；Inf表示无穷，分为正无穷Inf和负无穷Inf，代表无穷大或者无穷小。
## 字符串
&emsp;&emsp;nchar()函数可以用来统计字符串的长度；
Length()返回向量中元素的个数，而nchar返回每个元素字符串的个数；
Paste()函数用于粘贴字符串，将多个字符串合并为一个，默认使用空格分割，也可以通过sep选项参数来设置分隔符，Paste0()函数作用相同，默认的分隔符为空；
Substr()函数用于提取字符串，函数的参数分别是一个原始的字符串，一个起始点和一个结束点，返回值是起始点和结束点之间的字符串；
toupper()函数便可以将单词大写，tolower()可以转换为小写；
Grep()函数可以用于查找字符串；表示与第二个位置上的字符串匹配上了，如果fixed参数为F，则表示支持正则表达式，那么‘A+’表示匹配一到正无穷个字符A，那么“AC”也会入选。
Match()函数可以进行字符串匹配；Strsplit()可进行字符串的分割，这个函数需要两个参数，字符串和分割符
## 日期与时间
&emsp;&emsp;时间序列分析：对时间序列的描述，利用前面的结果进行预测；“ts”是time series的简称，代表时间序列数据。在R中，日期数据别单独归为一个date类，我们可以使用sys.date()函数查看当前系统的时间，在R中可以使用as.date()函数将数据转换为日期数据，使用format选项参数决定外观。比如哪部分作为年，哪部分作为月，也可以使用seq()函数创建连续的时间点；要使用as.date()系统才会当做时间数据进行处理，使用ts()函数可以把向量转化为时间序列数据。
## 获取数据
&emsp;&emsp;R获取数据一共有三种途径：   
1. 利用键盘来输入数据   
2. 通过读取存储在外部文件上的数据   
3. 通过访问数据库系统来获取数据   

- R读取文件   
&emsp;&emsp;纯文本文件（.csv/.txt）：通常使用逗号，也可以使用空白分割   
Read.table()函数可以读取一个纯文本文件，read.table(file=要读入的文件的名称；sep=指定文件使用的分隔符，默认是空白分割；header=代表在读取数据之后是否将数据的第一行作为变量的名称，而不是当成具体的值来处理，如果是，header=T，不是，header=F；skip=表示读取参数时，跳过部分内容，比如说可以跳过一些介绍性文字；nrows=用于读取文件的行数；na.strings=用于处理缺失值的信息)   
&emsp;&emsp;x <- read.table(file = "input.txt")#需要在工作目录下才可以直接输入名称   
&emsp;&emsp;如果不在工作目录下，可以利用setwd()函数来更改R的工作目录，或者使用文件的全路径，可以使用head()和tail()函数读取文件的前几行或者是后几行数据，可以通过函数中选项参数n的数值来确定显示的行数，使用sep可以指定对数据进行分割，使数据格式变得整洁，如果提前知道文件格式，也可以直接用read.csv()进行直接读取   
&emsp;&emsp;在此基础上使用skip和nrows两个参数相结合，就可以读取任意部分的数据，比如读取上述文件的第10-50行数据：   
&emsp;&emsp;read.table("input 1.txt",header = T,skip=10,nrows = 50)   
&emsp;&emsp;R在读取数据时，字符串数据会被默认读取成因子型数据   
&emsp;&emsp;如果一个纯文本文件并不在本机上，R可以支持读取网络文件，可以通过一些协议进行读取，只要将read.table()函数的选项参数file=文件的网络链接即可。R会将文件下载到本地。   
- 如何读取非文本文件？   
&emsp;&emsp;我们可以使用XML包进行读取，里面包含一个readHTMLTable()函数，可以用于读取网页中的数据。R中的foreign包可以帮助导入其他软件的数据，或者可以直接导入剪切板的内容，直接将read.table()函数选项参数改为clipboard即可。   
&emsp;&emsp;R可以直接读取压缩文件，并不需要解压缩，使用write.table()函数可以将数据写入文件，函数中，write.table(x=写入的数据，file=数据的存储路径及格式”)   
如：
```
x=read.table("input.txt")   
write.tale(x,file="H:/Rdata/newfile.txt")
```
也可以使用sep参数确定分隔符   
`write.table(x,file = "H:/RData/newfile.csv",sep=",")`
这样就等同于做了一次数据转换，将文本数据转变成了表格数据   
每一次加载数据，R会自动给每一行数据添加行号，为避免多次打开数据导致行号重复，可使用row.names参数   
`write.table(x,file = "H:/RData/newfile.csv",sep=",",row.names = F)`   
R会覆盖同名文件，使用append参数可以添加同名参数   
R可以直接写入压缩文件：   
`write.table(mtcars,gzfile("newfile.txt.gz"))`   
将excel文件另存为csv文件，再使用read.csv()打开   
如:   
`read.csv("H:/RData/mtcars.csv",header = T)`   
或者将数据复制到剪贴板，使用readclipboard()函数将数据导入R中，在R中打开：readClipboard()   
`read.table("clipboard",sep = '\t',header = T)`   
在R中也提供了很多包用于直接读写excel数据    
比如：xlconnect包（这个包依赖于JAVA，需要有java的环境），如果该R包无法安装，可以使用openxlsx包进行读取，如下：   
```
library(openxlsx)   
read.xlsx("H:/RData/data.xlsx",sheet = 1)
```
还可以使用openxlsx包的函数创建并写入新的excel文件，代码如下：   
```
wb <- createWorkbook()   
addWorksheet(wb,sheetName = 1)   
x <- mtcars  
writeData(wb,sheet = 1,x,startCol = 1,startRow = 1)
```

##包的使用
+ reshape2
melt 宽数据变成长数据，逆转置melt(data,id=(c("site","serialnumber","config","build","starttime","endtime","status","test failing")))
