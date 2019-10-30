#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
function(input, output) {
  
  
  output$insPlot_freq <- renderPlot({
    
    
    if (input$week_f==2) {
      
      require(network)
      x1_f<-network(as.matrix(read.csv("./data/freq_02.csv", row.names=1))) # network format
      
      y1_f<-as.matrix(read.csv("./data/freq_02.csv", row.names=1)) # matrix format
      
      require(sna)
      
       od1_f<-degree(x1_f,gmode="digraph",cmode="outdegree")
      id1_f<-degree(x1_f,gmode="digraph",cmode="indegree")
      d1_f<-od1_f+id1_f
      
      gplot(x1_f, vertex.cex=(d1_f)^0.5, gmode="graph", boxed.labels=FALSE,
            label.cex=2, label.pos=5, label.col="grey17",
            vertex.col=rgb((d1_f)/max(d1_f),1,(d1_f)/max(d1_f)),
            edge.col="grey17",
            label=c("1","2","3","4","5","6"),
            edge.lwd=y1_f/2,
            mode = "fruchtermanreingold")
      
    }
    else if (input$week_f==8){
      require(network)
      x2_f<-network(as.matrix(read.csv("./data/freq_08.csv", row.names=1))) # network format
      
      y2_f<-as.matrix(read.csv("./data/freq_08.csv", row.names=1)) # matrix format
      require(sna)
      od2_f<-degree(x2_f,gmode="digraph",cmode="outdegree")
      id2_f<-degree(x2_f,gmode="digraph",cmode="indegree")
      d2_f<-od2_f+id2_f
      gplot(x2_f, vertex.cex=(d2_f)^0.5, gmode="graph", boxed.labels=FALSE,
            label.cex=2, label.pos=5, label.col="grey17",
            vertex.col=rgb((d2_f)/max(d2_f),1,(d2_f)/max(d2_f)),
            edge.col="grey17",
            label=c("1","2","3","4","5","6"),
            edge.lwd=y2_f/2,
            mode = "fruchtermanreingold")
    }
    else if (input$week_f==10){
      require(network)
      x3_f<-network(as.matrix(read.csv("./data/freq_10.csv", row.names=1))) # network format
      
      y3_f<-as.matrix(read.csv("./data/freq_10.csv", row.names=1)) # matrix format
      require(sna)
      od3_f<-degree(x3_f,gmode="digraph",cmode="outdegree")
      id3_f<-degree(x3_f,gmode="digraph",cmode="indegree")
      d3_f<-od3_f+id3_f
      gplot(x3_f, vertex.cex=(d3_f)^0.5, gmode="graph", boxed.labels=FALSE,
            label.cex=2, label.pos=5, label.col="grey17",
            vertex.col=rgb((d3_f)/max(d3_f),1,(d3_f)/max(d3_f)),
            edge.col="grey17",
            label=c("1","2","3","4","5","6"),
            edge.lwd=y3_f/2,
            mode = "fruchtermanreingold")
    }
   
    
    
  }, height = 400, width = 400)
  output$insPlot_y <- renderPlot({
    
    
    if (input$week_y==2) {
      
      require(network)
      x1_y<-network(as.matrix(read.csv("./data/yulesq_02.csv", row.names=1))) # network format
      
      y1_y<-as.matrix(read.csv("./data/yulesq_02.csv", row.names=1)) # matrix format
      
      require(sna)
      
      od1_y<-degree(x1_y,gmode="digraph",cmode="outdegree")
      id1_y<-degree(x1_y,gmode="digraph",cmode="indegree")
      d1_y<-od1_y+id1_y
      
      gplot(x1_y, vertex.cex=(d1_y)^0.5, gmode="graph", boxed.labels=FALSE,
            label.cex=1.4, label.pos=5, label.col="grey17",
            vertex.col=rgb((d1_y)/max(d1_y),1,(d1_y)/max(d1_y)),
            edge.col="grey17",
            label=c("1","2","3","4","5","6"),
            edge.lwd=y1_y/2,
            mode = "fruchtermanreingold")
      
    }
    else if (input$week_y==8){
      require(network)
      x2_y<-network(as.matrix(read.csv("./data/yulesq_02.csv", row.names=1))) # network format
      
      y2_y<-as.matrix(read.csv("./data/yulesq_02.csv", row.names=1)) # matrix format
      require(sna)
      od2_y<-degree(x2_y,gmode="digraph",cmode="outdegree")
      id2_y<-degree(x2_y,gmode="digraph",cmode="indegree")
      d2_y<-od2_y+id2_y
      gplot(x2_y, vertex.cex=(d2_y)^0.5, gmode="graph", boxed.labels=FALSE,
            label.cex=1.4, label.pos=5, label.col="grey17",
            vertex.col=rgb((d2_y)/max(d2_y),1,(d2_y)/max(d2_y)),
            edge.col="grey17",
            label=c("1","2","3","4","5","6"),
            edge.lwd=y2_y/2,
            mode = "fruchtermanreingold")
    }
    else if (input$week_y==10){
      require(network)
      x3_y<-network(as.matrix(read.csv("./data/yulesq_02.csv", row.names=1))) # network format
      
      y3_y<-as.matrix(read.csv("./data/yulesq_02.csv", row.names=1)) # matrix format
      require(sna)
      od3_y<-degree(x3_y,gmode="digraph",cmode="outdegree")
      id3_y<-degree(x3_y,gmode="digraph",cmode="indegree")
      d3_y<-od3_y+id3_y
      gplot(x3_y, vertex.cex=(d3_y)^0.5, gmode="graph", boxed.labels=FALSE,
            label.cex=1.4, label.pos=5, label.col="grey17",
            vertex.col=rgb((d3_y)/max(d3_y),1,(d3_y)/max(d3_y)),
            edge.col="grey17",
            label=c("1","2","3","4","5","6"),
            edge.lwd=y3_y/2,
            mode = "fruchtermanreingold")
    }
    
    
    
  }, height = 400, width = 400)
  output$insPlot_z <- renderPlot({
    
    
    if (input$week_z==2) {
      
      require(network)
      x1_z<-network(as.matrix(read.csv("./data/adjres_02.csv", row.names=1))) # network format
      
      y1_z<-as.matrix(read.csv("./data/adjres_02.csv", row.names=1)) # matrix format
      
      require(sna)
      
      od1_z<-degree(x1_z,gmode="digraph",cmode="outdegree")
      id1_z<-degree(x1_z,gmode="digraph",cmode="indegree")
      d1_z<-od1_z+id1_z
      
      gplot(x1_z, vertex.cex=(d1_z)^0.5, gmode="graph", boxed.labels= T,
            label.cex=2, label.pos=5, label.col="grey17",
            vertex.col=rgb((d1_z)/max(d1_z),1,(d1_z)/max(d1_z)),
            edge.col="grey17",
            label=c("1","2","3","4","5","6"),
            edge.lwd=y1_z/2,
            mode = "fruchtermanreingold")
      
    }
    else if (input$week_z==8){
      require(network)
      x2_z<-network(as.matrix(read.csv("./data/adjres_08.csv", row.names=1))) # network format
      
      y2_z<-as.matrix(read.csv("./data/adjres_08.csv", row.names=1)) # matrix format
      require(sna)
      od2_z<-degree(x2_z,gmode="digraph",cmode="outdegree")
      id2_z<-degree(x2_z,gmode="digraph",cmode="indegree")
      d2_z<-od2_z+id2_z
      gplot(x2_z, vertex.cex=(d2_z)^0.5, gmode="graph", boxed.labels= T,
            label.cex=2, label.pos=5, label.col="grey17",
            vertex.col=rgb((d2_z)/max(d2_z),1,(d2_z)/max(d2_z)),
            edge.col="grey17",
            label=c("1","2","3","4","5","6"),
            edge.lwd=y2_z/2,
            mode = "fruchtermanreingold")
    }
    else if (input$week_z==10){
      require(network)
      x3_z<-network(as.matrix(read.csv("./data/adjres_10.csv", row.names=1))) # network format
      
      y3_z<-as.matrix(read.csv("./data/adjres_10.csv", row.names=1)) # matrix format
      require(sna)
      od3_z<-degree(x3_z,gmode="digraph",cmode="outdegree")
      id3_z<-degree(x3_z,gmode="digraph",cmode="indegree")
      d3_z<-od3_z+id3_z
      gplot(x3_z, vertex.cex=(d3_z)^0.5, gmode="graph", boxed.labels= T,
            label.cex=2, label.pos=5, label.col="grey17",
            vertex.col=rgb((d3_z)/max(d3_z),1,(d3_z)/max(d3_z)),
            edge.col="grey17",
            label=c("1","2","3","4","5","6"),
            edge.lwd=y3_z/2,
            mode = "fruchtermanreingold")
    }
    
    
    
  }, height = 400, width = 400)
  output$tapics <- renderImage({
    
    
    
    if (input$ta_week==2) 
      {
      list(src = "./www/TA_week2.png",
           contentType = 'image/png',
           width = 800,
           height = 600,
           alt = "This is the image of week 2"
          
           )
    }
    else if (input$ta_week==8) 
    {
      list(src = "./www/TA_week08.png",
           contentType = 'image/png',
           width = 800,
           height = 600,
           alt = "This is the image of week 8"
           )
    }
    else if (input$ta_week==10) 
    {
      list(src = "./www/TA_week10.png",
           contentType = 'image/png',
           width = 800,
           height = 600,
           alt = "This is the image of week 10"
           )
    }
    })
  
}