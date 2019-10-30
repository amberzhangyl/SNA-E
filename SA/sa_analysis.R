library(LagSeq)

sa_data <- read.csv("d:/github/data/pr/SA/week02_sa.csv")

sa_data<-as.vector(sa_data$variable) #ֻѡȡcode����ֶ����ݽ����¼����з���

library(dplyr)

#����������1-6�����ֱ�ʾ������code���
# case_when��ͬ��if and else if statement,dplyr����
sa_data<- case_when(sa_data == "SKI" ~ 1,
                    sa_data == "MKI" ~ 2,
                    sa_data == "DKI" ~ 3,
                    sa_data == "SKC" ~ 4,
                    sa_data == "MKC" ~ 5,
                    sa_data == "DKC" ~ 6)

#�������Ƶ�ʣ�һ�����������ȵ���һ���Ĵ���
LagSeq(sa_data) # ����ʹ��LagSeq���Լ��������Ƶ�ʣ�Yule q ֵ��z ֵ
freq <- as.matrix(LagSeq(sa_data)$freq) #����Ƶ��
write.csv(freq,file = "d:/github/data/pr/SA/freq_08.csv") #�ѽ��д��һ���µ�csv�ļ�

#yule qֵ����׼������ֵ����С��ʾ����ǿ�ȣ��и������֣�������ѡ������0����д��
yulesq=as.matrix(LagSeq(sa_data)$yulesq) #Yule q ֵ
yulesq[yulesq<0]<-0
#Ϊʲô�ⲿ�ָ�ֵΪ0��
yulesq[6,1]<-0
yulesq
write.csv(yulesq, file = "d:/github/data/pr/SA/yulesq_08.csv")

#z ֵ���ض�����Ƶ�ʵ�ͳ��������(z ֵ����1.96��ʾ�������дﵽ��ͳ�������Լ�p < .05)
adjres=as.matrix(LagSeq(sa_data)$adjres)  
adjres[adjres<1.96]<-0
adjres[6,1]<-0
write.csv(adjres,file = "d:/github/data/pr/SA/adjres_08.csv")
adjres

#sna����
library(sna)
# plot the network, not pretty
#gplot(freq,gmode="digraph", displaylabels=TRUE,label.cex=0.8,vertex.col="darkolivegreen")

#��������
overallnet=network(freq)
overallnet
id<-degree(overallnet,gmode="digraph",cmode="indegree")
od<-degree(overallnet,gmode="digraph",cmode="outdegree")

#sna��ʾ
plot <-gplot(overallnet, vertex.cex=(id+od)^0.5/2, gmode="graph",
      boxed.labels=FALSE,label.cex=0.7, label.pos=5, label.col="grey17",
      vertex.col=rgb((id+od)/max(id+od),1,(id+od)/max(id+od)),edge.col="grey17",
      label=c("1","2","3","4","5","6"),edge.lwd=freq/2,mode = "fruchtermanreingold")

#���ӻ�
#library(igraph)
#freq_igraph <- graph_from_adjacency_matrix(freq,weighted=TRUE,mode="directed")
#��visnetwork���ӻ������Ƕ���ڵ��С���߱Ƚ��鷳
#library(visNetwork)  
#freq_igraph <- graph_from_adjacency_matrix(freq,weighted=TRUE,mode="directed")
#visIgraph(freq_igraph,smooth=TRUE)
