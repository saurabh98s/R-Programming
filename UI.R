# creating R project
library(choroplethr) #coordinates of countries
library(choroplethrMaps) #maps of countries
library(ggplot2) #visualisation
library(shiny) #creates webapp in R language
# TODO : INDIA MAPS
# Two parts to be created UI as well as server
# TO implement: slider,dropdown,maps
data('df_state_demographics')
shinyUI(fluidPage(
  
  #APPLICATION TITILE
  titlePanel("USA CENSUS- BY SAURABH SUMAN"),
  
  #Side bar with a slider input for no of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("num_colors",
                  "Number of colors:",
                  min = 1,
                  max = 9,
                  value = 7), #default value
      selectInput("select",label = "Select Demographic:",
                  choices = colnames(df_state_demographics)[2:9],
                  selected = 1),
      downloadButton('downloadData','Download')
    ),
    
    
    # show plot of generated distribution
    mainPanel(
      plotOutput("map"),
      dataTableOutput("table")
    )
    
  )
  
))

