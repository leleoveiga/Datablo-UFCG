install.packages('shiny')
install.packages('shinythemes')

library(shiny)
library(shinythemes)

ui <- fluidPage(
  sliderInput(inputId = 'periodo',
              label = 'Selecione o Período',
              value = 2002,
              max = 2020,
              min = 2002,
              step = 1),
  plotOutput('hist')
)



server <- function(input, output){}



shinyApp(ui = ui, server = server)
