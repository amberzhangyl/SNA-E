library(dplyr)

all_code=read.csv("d:/github/data/all_code.csv", header=TRUE)


week_code <- all_code %>% filter(week == "Week 02")%>% select("vert1_id","vert2_id",value) 
week_code
week_code <-arrange(week_code,vert1_id)
week_code

library(igraph)
week_code
"week_igraph" <- graph_from_data_frame(d=week_code, directed=T)

E(week_igraph)
V(week_igraph)
plot(all_igraph, edge.arrow.size=.2)

igraph::degree(week_igraph)#计算�?#
igraph::degree(week_igraph,mode="out")#出度#
igraph::betweenness(all_igraph)#中介度计�?#
igraph::closeness(week_igraph, mode="in")#入度集中度计�?
igraph::closeness(week_igraph, mode="out")#出度集中度计�?
igraph::closeness(week_igraph, mode="all")#集中度计�?
igraph::eigen_centrality(week_igraph)#特征向量中心�?
igraph::diameter(week_igraph, directed = TRUE)


dyad_census(week_igraph)
distances(week_igraph)

centr_degree(week_igraph)$centralization
centr_clo(week_igraph, mode="all")$centralization
centr_eigen(week_igraph, directed=FALSE)$centralization

library(visNetwork)

# vert1_id和vert2_id单独成列，命名为nodes_v1和nodes_v2
nodes_v1 <- week_code %>% select(vert1_id)
nodes_v2 <- week_code %>% select(vert2_id)

# 分别取出nodes_v1和nodes_v2中不重复元素，再取并集，组成字符串向量，放入unique_nodes�?
unique_nodes_v1 <- as.character(unique(nodes_v1$vert1_id))
unique_nodes_v2 <- as.character(unique(nodes_v2$vert2_id))
unique_nodes <- union(unique_nodes_v1, unique_nodes_v2)
unique_nodes

#形成一个检索表，字母和数字一一对应
index <- seq(1,length(unique_nodes))
# 将数字索引和节点放入一张数据表，一一对应
unique_char_num = data.frame(unique_nodes, index)


# 将nodes_v1和nodes_v2转化为字符串向量
nodes_v1_c <- as.character(nodes_v1$vert1_id)
nodes_v2_c <- as.character(nodes_v2$vert2_id)
# 准备两个空向量，用于存放结果
nodes_v1_n <- c()
nodes_v2_n <- c()

# 依据索引对照表，将字符串向量转化为数字向量，并且写入
for (i in nodes_v1_c) nodes_v1_n <- append(nodes_v1_n,(unique_char_num[which(unique_char_num$unique_nodes==i), "index"]))
for (i in nodes_v2_c) nodes_v2_n <- append(nodes_v2_n,(unique_char_num[which(unique_char_num$unique_nodes==i), "index"]))

# 依据特征向量中心性赋予节点不同的颜色，中心性越高，节点越发�?
colorchange <- c()
for (i in eigen_centrality_v$vector){
  # �?%%替换为计算后的数值，数值最终转化为字符串形�?
  color_str <- "rgba(51,%%,252,1)"
  colorchange <- append(colorchange, gsub("%%", as.character(194-round(120*i^2)), color_str))}

#设置visNetwork节点属性，节点大小�?2*(入度+出度)^0.8
nodes <- data.frame(id=unique_char_num$index, label=unique_char_num$unique_nodes, 
                    size = 2*(indegree_v+outdegree_v)^0.8, color.background=colorchange)
#设置visNetwork边属性，有向�?
edges <- data.frame(from = nodes_v1_n, to = nodes_v2_n)

#visNetwork画图，节点标�?30px，箭头大�?0.8

visNetwork(nodes, edges, height = "1080px", width = "100%") %>%
  visNodes(font="30px") %>%
  visEdges(arrows =list(to = list(enabled = TRUE, scaleFactor = 0.8)))









