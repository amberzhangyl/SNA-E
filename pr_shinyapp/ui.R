#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(
  navbarPage("Social Network Analysis within an Online Course",
             
             
              tabPanel("Event Sequences Analysis_freq",
                      titlePanel("Event Sequences Analysis"),
                      sidebarLayout(
                      sidebarPanel(
                         selectInput("week_f", "Choose a week:", 
                                    c("week02"=2,"week08"=8,"week10"=10),
                                   width="100%"
                       )
                       ),
                        
                         mainPanel(            
                         h3("Event transition frequency diagram"), plotOutput("insPlot_freq"),br(),
                         strong("Transitional frequencies among six code categories represent ",
                           span("the number of times a code category transitions immediately to another code category", style = "color:blue")
                         ),
                         br(),
                         strong(" 1:SKI,surperficial-level knowledge inquiry "),br(),
                         strong(" 2:MKI,Medium-level knowledge inquiry "),br(),
                         strong(" 3:DKI,Deep-level knowledge inquiry "),br(),
                         strong(" 4:SKC,surperficial-level knowledge construction "),br(),
                         strong(" 5:MKC,Medium-level knowledge construction "),br(),
                         strong(" 6:DKC,Deep-level knowledge construction ")
                          
                        )
                      )
             )
           ,
             tabPanel("Event Sequences Analysis_y",
                      titlePanel("Event Sequences Analysis Yule value"),
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("week_y", "Choose a week:", 
                                      c("week02"=2,"week08"=8,"week10"=10),
                                      width="100%"
                          )),
                        
                        mainPanel(            
                          h3("Event transition  Yule value"), plotOutput("insPlot_y"),
                          br(),
                          strong("Yule's Q scores, namely the standardized measure, denote  ",
                                 span("strength of association between two code categories", style = "color:blue"),"ranging from -1 to +1, with 0 indicating no association"
                          ),
                          br(),
                          strong(" 1:SKI,surperficial-level knowledge inquiry "),br(),
                          strong(" 2:MKI,Medium-level knowledge inquiry "),br(),
                          strong(" 3:DKI,Deep-level knowledge inquiry "),br(),
                          strong(" 4:SKC,surperficial-level knowledge construction "),br(),
                          strong(" 5:MKC,Medium-level knowledge construction "),br(),
                          strong(" 6:DKC,Deep-level knowledge construction ")
                          
                        )
                      )
             ),
             tabPanel("Event Sequences Analysis_z",
                      titlePanel("Event Sequences Analysis  Z"),
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("week_z", "Choose a week:", 
                                      c("week02"=2,"week08"=8,"week10"=10),
                                      width="100%"
                          )),
                        
                        mainPanel(            
                          h3("Event transition  z"), plotOutput("insPlot_z"),
                          br(),
                          strong("adjusted residuals - Z scores represent ",
                                 span("the statistical significance of particular transitions", style = "color:blue"),"Z scores greater than 1.96 means that the transitional sequence reached statistical significance p < .05"
                          ),
                          br(),
                          strong(" 1:SKI,surperficial-level knowledge inquiry "),br(),
                          strong(" 2:MKI,Medium-level knowledge inquiry "),br(),
                          strong(" 3:DKI,Deep-level knowledge inquiry "),br(),
                          strong(" 4:SKC,surperficial-level knowledge construction "),br(),
                          strong(" 5:MKC,Medium-level knowledge construction "),br(),
                          strong(" 6:DKC,Deep-level knowledge construction ")
                        )
                     )
             ),
             
             #   tabPanel("Student-facilitated class-level discussions",
             
             #   sidebarPanel(
             #  selectInput("week", "Choose a week:", 
             #             c("week11"=5,"week12"=6),
             #            width=3
             #  ),
             
             #   mainPanel(            
             #    tabsetPanel("Panel 1.x",
             # tabPanel("statistical description", tableOutput("stuTable")),
             #       tabPanel("social network", plotOutput("stuPlot"))
             #         
             # )
             # )
             # )),
             
             # tabPanel("instructor-facilitated group-level discussions",
             
             #    sidebarPanel(
             #  selectInput("week", "Choose a week:", 
             #        c("week0304"=7,"week05"=8,"week06"=9),
             #      width=3
             # ),
             
             # mainPanel(            
             #  tabsetPanel("Panel 1.x",
             # tabPanel("statistical description", tableOutput("groupTable")),
             #       tabPanel("social network", plotOutput("groupPlot"))
             
             #  )
             #   )
             #  )),
             
             #   tabPanel("all course discussions",
             
             #     sidebarPanel(
             #   selectInput("week", "Choose a week:", 
             #         c("all weeks"=10),
             #        width=3
             # ),
             
             #  mainPanel(            
             #  tabsetPanel("Panel 1.x",
             #  tabPanel("statistical description", tableOutput("allTable")),
             #      tabPanel("social network", plotOutput("allPlot"))
             
             #  )
             #  )
             #   )),
             #
             
             tabPanel("Time-Series Analysis",   
                      "Shiny App developer: Yuling Zhang" ,
                      br(),
                      br(),
                     
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("ta_week", "Choose a week:", 
                                      c("week02"=2,"week08"=8,"week10"=10),
                                      width="100%"
                        )),
                        mainPanel(
                          h3("Time-Series analysis diagram"), imageOutput("tapics")
                          #img(src = "./data/TA_week2.png", height = 140, width = 400)
                        )
                      )
                      
                      )
                      
                      )  
  )




