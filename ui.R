#plik ui.r

library(shiny)


shinyUI(pageWithSidebar(
  headerPanel("Liczba wypo¿yczonych roweróW"),
  
  sidebarPanel(
    selectInput(inputId = "weathersit",
                label = "Sytuacja pogodowa",
                choices = c("1", "2", "3", "4"),
                selected = "1"),
    sliderInput("temp", "Temperatura",
                min = 0, max = 35, value = c(0,35), step= 1)),
    mainPanel(
      tabsetPanel(
        tabPanel("Histogram", plotOutput("wyjscieHistogram")), 
        tabPanel("Podsumowanie", verbatimTextOutput("wyjscieTabela"))
      ))
))