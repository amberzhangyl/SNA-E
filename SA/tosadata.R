library(dplyr)
all_code=read.csv("d:/github/data/all_code.csv", header=TRUE)

#閫夋嫨鏁版嵁
week_code <- all_code %>% filter(week == "Week 10")%>% select("message_text",SKI,MKI,DKI,SKC,MKC,DKC) 
week_code

id <- seq(1,length(week_code$message_text))
week_code <- data.frame(id,week_code)

#使用reshape改变数据结构，宽数据修改为长数据
library(reshape2)
week_code <- melt(week_code, id.vars=c("id","message_text"),measure.vars=c("SKI", "MKI", "DKI", "SKC","MKC","DKC"),na.rm = T)

#删除值为0的部分
week_code <- week_code %>% filter(value!=0) 

#根据编码的强度，设置某一行数据出现的次数
week_text <- week_code %>% filter(value==1) 
week_text_2 <- week_code %>% filter(value==2) 
week_text_3 <- week_code %>% filter(value==3) 
week_text_4 <- week_code %>% filter(value==4) 
week_text_5 <- week_code %>% filter(value==5) 
week_code_text <-rbind(week_text,week_text_2,week_text_2,week_text_3,week_text_3,week_text_3,week_text_4,week_text_4,week_text_4,week_text_4,week_text_5,week_text_5,week_text_5,week_text_5,week_text_5)

#閲嶆柊鎺掑簭锛岄�夊嚭鍙互鐢ㄤ綔sa澶勭悊鐨勯儴鍒?
week_sa <- week_code_text %>% arrange(id,variable) %>% select("message_text","variable") 

#write.csv(week_sa,"d:/github/data/pr/SA/week10_sa.csv")

