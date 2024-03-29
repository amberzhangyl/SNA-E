library(dplyr)
all_code=read.csv("d:/github/data/all_code.csv", header=TRUE)

#选择数据
week_code <- all_code %>% filter(week == "Week 10")%>% select("message_text",SKI,MKI,DKI,SKC,MKC,DKC) 
week_code

id <- seq(1,length(week_code$message_text))
week_code <- data.frame(id,week_code)

#ʹ��reshape�ı����ݽṹ���������޸�Ϊ������
library(reshape2)
week_code <- melt(week_code, id.vars=c("id","message_text"),measure.vars=c("SKI", "MKI", "DKI", "SKC","MKC","DKC"),na.rm = T)

#ɾ��ֵΪ0�Ĳ���
week_code <- week_code %>% filter(value!=0) 

#���ݱ����ǿ�ȣ�����ĳһ�����ݳ��ֵĴ���
week_text <- week_code %>% filter(value==1) 
week_text_2 <- week_code %>% filter(value==2) 
week_text_3 <- week_code %>% filter(value==3) 
week_text_4 <- week_code %>% filter(value==4) 
week_text_5 <- week_code %>% filter(value==5) 
week_code_text <-rbind(week_text,week_text_2,week_text_2,week_text_3,week_text_3,week_text_3,week_text_4,week_text_4,week_text_4,week_text_4,week_text_5,week_text_5,week_text_5,week_text_5,week_text_5)

#重新排序，选出可以用作sa处理的部�?
week_sa <- week_code_text %>% arrange(id,variable) %>% select("message_text","variable") 

#write.csv(week_sa,"d:/github/data/pr/SA/week10_sa.csv")

