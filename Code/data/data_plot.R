library(reshape2)
library(tidyverse)#数据预处理
library(ggplot2)#绘图包
library(ggpubr)#基于ggplot2的可视化包，主要用于绘制符合出版要求的图形
library(ggsignif)#用于P值计算和显著性标记
library(ggprism)#提供了GraphPad prism风格的主题和颜色，主要用于美化我们的图形
library(gridExtra)
library(ggthemes)
library(gtable)
library(grid)
library(ggpubr)

data_read <- function(p,s = 0){
	data <- read.csv(p,header = F,skip = s)
	names <- data[1,]
	data <- data[-1,]
	names(data) <- names
	return(data)
}

#data <- read.csv("KA1.csv",header=F,fill=T,skip=1)
data <- data_read("KA1.csv",1)
data_transpose <- melt(data,id=(c("site","serialnumber","config","build","starttime","endtime","status","test failing")))
names(data_transpose) <- c("site","serialnumber","config","build","starttime","endtime","status","test failing","MP9 Item","Item Value")

# 绘图
plt <- ggplot(data,aes(x=data$config,y=data$item2,fill=config))+
  xlab("Config")+
  ylab("Item")+
  stat_boxplot(geom = "errorbar",width=0.3)+
  geom_boxplot(alpha = 1,
               outlier.color = "black",
               position=position_dodge(width=0.75))+
  geom_hline(yintercept = 0.5)+
  geom_hline(yintercept = -0.5)+
  #geom_jitter(width = 0.2)+
  theme_prism(palette = "candy_bright",
              base_fontface = "plain", # 字体样式，可选 bold, plain, italic
              base_family = "serif", # 字体格式，可选 serif, sans, mono, Arial等
              base_size = 16,  # 图形的字体大小
              base_line_size = 0.8, # 坐标轴的粗细
              axis_text_angle = 0)+ # 可选值有 0，45，90，270
  theme(panel.background = element_blank(),
        panel.spacing.x = unit(0.5, "cm"),
        #panel.border = element_rect(color = "red", size = 2, fill = NA),
        #plot.background = element_rect(color = "blue", size = 2),
        #axis.line = element_line(),
        axis.text = element_text(size = 14),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.x=element_blank(),
        axis.ticks.length = unit(1, "pt"),
        #axis.text.x = element_text(angle = 90,vjust = 0.5),
        legend.position = "none",
        plot.margin = margin(t = 5, r = 30, b = 0, l = 5, unit = "pt"),
        plot.title = element_text(size=14))+
  #scale_fill_prism(palette = "candy_bright")+
  scale_fill_manual(values=c("red","yellow","blue","green"))
  #ggtitle("item 2")

SummaryTable1 <- data.frame(c("max","min","count"),c(1,2,3),c(10,20,30))
colnames(SummaryTable1)<-c("congfig","KD2","KD4")

tbl <- tableGrob(SummaryTable1,rows = NULL, widths = unit(c(2,4,4), "cm"), heights = unit(c(0.5,0.5,0.5), "cm"),
                 theme= ttheme_minimal())
rect <- rectGrob(gp = gpar(fill = NA, lwd = 1))
tbl <- gtable_add_grob(tbl,grobs = rect,
                       t = 1, b = 1, l = 1, r = ncol(tbl))
for(j in 1:ncol(tbl)){
  tbl <- gtable_add_grob(tbl,grobs = rect,t = 1, b = nrow(tbl), l = j, r = j)
}
vp <- viewport(x = 0.48, y = 0.5, width = 1, height = 1)
gt <- gTree(children = gList(tbl), vp = vp)
ggarrange(plt,bottom = gt,heights = c(2,1),ncol = 1)