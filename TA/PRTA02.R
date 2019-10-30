library(dplyr)

#数据读取
all_code=read.csv("d:/github/data/all_code.csv", header=TRUE)

#数据的选择和清理
week_code <- all_code %>% filter(week == "Week 02")%>% select("vert1_id","participatory_role") 
index <- seq(1,length(week_code$vert1_id))
week_code <- data.frame(index,week_code)
week_code
#根据已有数据，计算参与类别
unique_role <- unique(week_code$participatory_role)
levels(unique_role)

#ggplot包
library(ggplot2)
df<-week_code

#定义x轴，表示为时间序列
df$sortedid <- 1:nrow(df) 
#定义y轴。表示为学生参与学习的类型
df$code <- factor(df$participatory_role, levels=c(levels(unique_role)), 
                  labels=c(levels(unique_role)))
alllevels <- c(levels(unique_role))

#显示图像
p <- ggplot(df) + 
  geom_point(aes(x=df$sortedid, y=df$participatory_role, shape=df$participatory_role, colour=df$vert1_id)) + 
  scale_shape_manual(values=1:length(alllevels))+
  xlab("Discussion Threads") + ylab("participatory roles")

#更新定义的边栏
p + guides(shape=FALSE) +
  guides(col=guide_legend(ncol=2,title="Students"))

