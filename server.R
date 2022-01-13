# plik: server.r

library(shiny)

rowerki <- read.table("https://github.com/kingelysus/test.git/day.csv", 
           row.names=NULL, sep=";", header=TRUE)

shinyServer(function(input, output) {
  output$wyjscieHistogram <- renderPlot({
    wybrane <- rowerki[
      rowerki$weathersit == input$weathersit &
        rowerki$temp >= input$temp[1] &
        rowerki$temp <= input$temp[2], ]
    
    hist(wybrane$cnt, main=paste("Liczba wypo¿yczonych rowerów", input$weathersit))
  })
  
  output$wyjscieTabela <- renderPrint({
    wybrane <- rowerki[
      rowerki$weathersit == input$weathersit & 
        rowerki$temp >= input$temp[1] & 
        rowerki$temp <= input$temp[2], ]
    
    summary(wybrane$cnt)
  })
})
