library(dplyr)

#���ݶ�ȡ
all_code=read.csv("d:/github/data/all_code.csv", header=TRUE)

#���ݵ�ѡ�������
week_code <- all_code %>% filter(week == "Week 02")%>% select("vert1_id","participatory_role") 
index <- seq(1,length(week_code$vert1_id))
week_code <- data.frame(index,week_code)
week_code
#�����������ݣ�����������
unique_role <- unique(week_code$participatory_role)
levels(unique_role)

#ggplot��
library(ggplot2)
df<-week_code

#����x�ᣬ��ʾΪʱ������
df$sortedid <- 1:nrow(df) 
#����y�ᡣ��ʾΪѧ������ѧϰ������
df$code <- factor(df$participatory_role, levels=c(levels(unique_role)), 
                  labels=c(levels(unique_role)))
alllevels <- c(levels(unique_role))

#��ʾͼ��
p <- ggplot(df) + 
  geom_point(aes(x=df$sortedid, y=df$participatory_role, shape=df$participatory_role, colour=df$vert1_id)) + 
  scale_shape_manual(values=1:length(alllevels))+
  xlab("Discussion Threads") + ylab("participatory roles")

#���¶���ı���
p + guides(shape=FALSE) +
  guides(col=guide_legend(ncol=2,title="Students"))
