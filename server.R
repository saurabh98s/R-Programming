library(shiny) #creates webapp in R language
library(choroplethr) #coordinates of countries
library(choroplethrMaps) #maps of countries

shinyServer(function(input,output){
  output$map <-renderPlot({
    
    data('df_state_demographics')
    df_state_demographics$value = df_state_demographics[,input$select] #getting select from the UI side
    state_choropleth(df_state_demographics,
                     title = input$select,
                     num_colors = input$num_colors)
    
  })
  output$table<-renderTable({
    data("df_state_demographics")
    df_state_demographics[,c('region',input$select)]
    
  })
  output$downloadData<-downloadHandler(
    filename = function(){
      paste('data-',Sys.Date(),'.csv',sep='')
    },
  )
})