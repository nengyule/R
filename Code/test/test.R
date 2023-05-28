df <- read.table("data.csv", sep = ",", header = T)
view(df)
remove(df)

for (letter in letters) {
    cat(letter)
    # cat(" ");
}

for (letter in LETTERS) {
    if (letter == "D") {
        # next    # 执行下一个，不打印D
        break # 终止循环，只打印ABC
    }
    cat(letter)
}

v <- c("while loop")
cnt <- 2
while (cnt < 7) {
    print(v)
    cnt <- cnt + 1
}

v <- c("repeat loop")
cnt <- 2
repeat {
    print(v)
    cnt <- cnt + 1
    if (cnt > 5) {
        break
    }
}

bad_data <- read.table("Bad_Data.csv", sep = ",", header = T)
aoi_data <- read.table("AOI_Data.csv", sep = ",", header = T)
nrow(bad_data)
ncol(bad_data)
nrow(aoi_data)
ncol(aoi_data)

bad_pnl_id <- bad_data[, c(3, 4, 5)]
bad_pnl_id <- bad_data[, 3:5]
bad_pnl_id <- bad_pnl_id[!duplicated(bad_pnl_id)]
bad_pnl_id <- bad_data$PNL_ID[!duplicated(bad_data$PNL_ID)]
bad_pnl_id <- unique(bad_data$PNL_ID)

aoi_pnl_id <- aoi_data[, 3]

# library(data.table)
# setDT(bad_pnl_id)
# duplicated(bad_pnl_id,by=c("PNL_ID"))

result <- list()
for (i in unique(bad_data$PNL_ID))
{
    pos <- which(aoi_data$PNL_ID == i)
    which()
    result[[i]] <- pos
}
for (i in bad_data[, 3:5])
{
    for (j in result[i[1, 1]])
    {
        if (bad_data[j, c(4, 5)]) {

        }
    }
}

bad_data <- read.table("Bad_Data.csv", sep = ",", header = T, fileEncoding = "UTF-8")
aoi_data <- read.table("AOI_Data.csv", sep = ",", header = T, fileEncoding = "UTF-8")
result1 <- data.frame()
result2 <- data.frame()
for (i in 1:nrow(bad_data))
{
    pos <- which(aoi_data$PNL_ID == bad_data$PNL_ID[i], aoi_data$G_X - bad_data$PNL_X[i] < 1000, aoi_data$G_Y - bad_data$PNL_Y[i] < 1000)
    if (length(pos) == 0) {
        result1 <- rbind(result1, bad_data[i, ])
        result2 <- rbind(result2, c(0, 0, 0, 0, 0, 0))
        colnames(result2) <- colnames(aoi_data)
        next
    }
    for (j in pos) result1 <- rbind(result1, bad_data[i, ])
    result2 <- rbind(result2, aoi_data[pos, ])
}
result1 <- cbind(result1, result2)
result1 <- result1[order(result1[, 3], result1[, 3]), ]
# write.table(result1,file="result.csv",row.names=FALSE,col.names=FALSE,sep=",",fileEncoding="UTF-8")
write.table(result1, file = "result.csv", row.names = FALSE, sep = ",", fileEncoding = "GBK")


data <- read.table("clipboard", header = T)
head(data)

levels <- c("male", "female")

aggregate(data[, 2], by = list(data[, 1]), max)


data <- read.table("clipboard", header = T)

result <- aggregate(data$ID, by = list(data$产品注释), FUN = function(x) {
    paste("in (", paste(paste("'", trimws(unique(x)), "'"), collapse = ","), ")")
})

result1 <- paste(result[, 2], paste("'", result[, 1], "'"), sep = " then ")

library(reshape2)
library(ggplot2) # 绘图包
library(ggpubr) # 基于ggplot2的可视化包，主要用于绘制符合出版要求的图形
library(ggsignif) # 用于P值计算和显著性标记
library(tidyverse) # 数据预处理
library(ggprism) # 提供了GraphPad prism风格的主题和颜色，主要用于美化我们的图形

# 读取箱线图数据文件
df <- read.delim("https://www.bioladder.cn/shiny/zyp/bioladder2/demoData/BoxPlot/boxplot.txt", # 这里读取了网络上的demo数据，将此处换成你自己电脑里的文件
    header = T
)
# 把数据转换成ggplot常用的类型（长数据）
df <- melt(df)

# 绘图
p <- ggplot(df, aes(
    x = variable,
    y = value,
    fill = variable
)) +
    stat_boxplot(
        geom = "errorbar",
        width = 0.3
    ) +
    geom_boxplot(
        alpha = 1,
        outlier.color = "black"
    ) +
    geom_hline(yintercept = 10) +
    geom_hline(yintercept = -10) +
    # geom_jitter(width = 0.2)+
    theme(
        panel.background = element_blank(),
        axis.line = element_line(),
        # axis.text.x = element_text(angle = 90,vjust = 0.5),
        # legend.position = "none",
        plot.title = element_text(size = 14)
    ) +
    theme_prism(
        palette = "candy_bright",
        base_fontface = "plain", # 字体样式，可选 bold, plain, italic
        base_family = "serif", # 字体格式，可选 serif, sans, mono, Arial等
        base_size = 16, # 图形的字体大小
        base_line_size = 0.8, # 坐标轴的粗细
        axis_text_angle = 0
    ) + # 可选值有 0，45，90，270
    # scale_fill_prism(palette = "candy_bright")+
    scale_fill_manual(values = c("red", "yellow", "blue", "green")) +
    ggtitle("title")
p



library(reshape2)
library(ggplot2) # 绘图包
library(ggpubr) # 基于ggplot2的可视化包，主要用于绘制符合出版要求的图形
library(ggsignif) # 用于P值计算和显著性标记
library(tidyverse) # 数据预处理
library(ggprism) # 提供了GraphPad prism风格的主题和颜色，主要用于美化我们的图形

mp9 <- read.csv("D:software_data/document/R/D8/MP9.csv", header = F, fill = T, skip = 1)
rname <- mp9[1, ]
mp9 <- mp9[-1, ]
names(mp9) <- rname
Mp9 <- melt(mp9, id = (c("site", "serialnumber", "config", "build", "starttime", "endtime", "status", "test failing")))
names(Mp9) <- c("site", "serialnumber", "config", "build", "starttime", "endtime", "status", "test failing", "MP9 Item", "Item Value")
write.csv(Mp9, file = "D:software_data/document/R/D8/MP91.csv")

# 绘图
ggplot(mp9, aes(
    x = mp9$config,
    y = mp9$item2,
    fill = config
)) +
    xlab("Config") +
    ylab("MP9 Item") +
    stat_boxplot(
        geom = "errorbar",
        width = 0.3
    ) +
    geom_boxplot(
        alpha = 1,
        outlier.color = "black"
    ) +
    geom_hline(yintercept = 0.5) +
    geom_hline(yintercept = -0.5) +
    # geom_jitter(width = 0.2)+
    theme(
        panel.background = element_blank(),
        axis.line = element_line(),
        # axis.text.x = element_text(angle = 90,vjust = 0.5),
        # legend.position = "none",
        plot.title = element_text(size = 14)
    ) +
    theme_prism(
        palette = "candy_bright",
        base_fontface = "plain", # 字体样式，可选 bold, plain, italic
        base_family = "serif", # 字体格式，可选 serif, sans, mono, Arial等
        base_size = 16, # 图形的字体大小
        base_line_size = 0.8, # 坐标轴的粗细
        axis_text_angle = 0
    ) + # 可选值有 0，45，90，270
    # scale_fill_prism(palette = "candy_bright")+
    scale_fill_manual(values = c("red", "yellow", "blue", "green")) +
    ggtitle("item 2")
