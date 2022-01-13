# plik: server.r

library(shiny)

rowerki<- read_csv("~/day.csv", show_col_types = FALSE)

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

runApp(
  appDir = getwd(),
  port = getOption("shiny.port"),
  launch.browser = getOption("shiny.launch.browser", interactive()),
  host = getOption("shiny.host", "127.0.0.1"),
  workerId = "",
  quiet = FALSE,
  display.mode = c("auto", "normal", "showcase"),
  test.mode = getOption("shiny.testmode", FALSE)
)