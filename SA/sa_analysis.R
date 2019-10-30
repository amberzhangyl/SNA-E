library(LagSeq)

sa_data <- read.csv("d:/github/data/pr/SA/week02_sa.csv")

sa_data<-as.vector(sa_data$variable) #只选取code这个字段内容进行事件序列分析

library(dplyr)

#下面我们用1-6的数字表示这六种code类别
# case_when等同于if and else if statement,dplyr包里
sa_data<- case_when(sa_data == "SKI" ~ 1,
                    sa_data == "MKI" ~ 2,
                    sa_data == "DKI" ~ 3,
                    sa_data == "SKC" ~ 4,
                    sa_data == "MKC" ~ 5,
                    sa_data == "DKC" ~ 6)

#计算过度频率，一个编码类别过度到另一个的次数
LagSeq(sa_data) # 我们使用LagSeq可以计算出过渡频率，Yule q 值和z 值
freq <- as.matrix(LagSeq(sa_data)$freq) #过渡频率
write.csv(freq,file = "d:/github/data/pr/SA/freq_08.csv") #把结果写入一个新的csv文件

#yule q值，标准化度量值，大小表示关联强度，有负数部分，可以挑选出大于0部分写出
yulesq=as.matrix(LagSeq(sa_data)$yulesq) #Yule q 值
yulesq[yulesq<0]<-0
#为什么这部分赋值为0？
yulesq[6,1]<-0
yulesq
write.csv(yulesq, file = "d:/github/data/pr/SA/yulesq_08.csv")

#z 值，特定过渡频率的统计显著性(z 值大于1.96表示过渡序列达到了统计显著性即p < .05)
adjres=as.matrix(LagSeq(sa_data)$adjres)  
adjres[adjres<1.96]<-0
adjres[6,1]<-0
write.csv(adjres,file = "d:/github/data/pr/SA/adjres_08.csv")
adjres

#sna分析
library(sna)
# plot the network, not pretty
#gplot(freq,gmode="digraph", displaylabels=TRUE,label.cex=0.8,vertex.col="darkolivegreen")

#计算出入度
overallnet=network(freq)
overallnet
id<-degree(overallnet,gmode="digraph",cmode="indegree")
od<-degree(overallnet,gmode="digraph",cmode="outdegree")

#sna显示
plot <-gplot(overallnet, vertex.cex=(id+od)^0.5/2, gmode="graph",
      boxed.labels=FALSE,label.cex=0.7, label.pos=5, label.col="grey17",
      vertex.col=rgb((id+od)/max(id+od),1,(id+od)/max(id+od)),edge.col="grey17",
      label=c("1","2","3","4","5","6"),edge.lwd=freq/2,mode = "fruchtermanreingold")

#可视化
#library(igraph)
#freq_igraph <- graph_from_adjacency_matrix(freq,weighted=TRUE,mode="directed")
#用visnetwork可视化，但是定义节点大小、边比较麻烦
#library(visNetwork)  
#freq_igraph <- graph_from_adjacency_matrix(freq,weighted=TRUE,mode="directed")
#visIgraph(freq_igraph,smooth=TRUE)

