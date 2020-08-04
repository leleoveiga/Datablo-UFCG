install.packages('shiny')
install.packages('shinythemes')

library(shiny)
library(shinythemes)
library(readr)
library(ggplot2)
library(tibble)
library(purrr)
library(viridis)
library(directlabels)
library(reshape2)

baseDados <- stat_geral
baseDados <- melt(baseDados, id.vars = 'Ano')
baseDados$Ano <- as.factor(as.character(baseDados$Ano))


ui <- fluidPage(
  sliderInput(inputId = 'Ano',
              label = 'Selecione o Período',
              value = 2005,
              max = 2020,
              min = 2002,
              step = 1),
  plotOutput('graficoLinha')
)



server <- function(input, output){
  
  for(i in seq(1:37)){
    if(stat_geral[i,1] == input$Ano){
      stat_geral[i,]
    }
  }
  
  output$graficoLinha <- renderPlot({
    
    ggplot(data = baseDados,
           mapping = aes(x = input$Ano,
                         y = value,
                         group = variable,
                         Col = Ano,
                         label = value,
                         colour = variable)) +
      geom_line()
  })
}



shinyApp(ui = ui, server = server)



# A seguir, testes

for(i in stat_geral[1:37,1]){
  print(i)
}
stat_geral[1:37,1]



ggplot(data = baseDados,
       mapping = aes(
         x = Ano,
         y = value,
         group = variable,
         Col = Ano,
         label = value,
         colour = variable)) +
  theme(panel.background = element_rect(fill="black"),
        plot.title = element_text(colour = "grey65"),
        plot.background = element_rect(fill="black"),
        panel.grid.major = element_line(colour ="grey65"),
        panel.grid.minor = element_blank(),
        axis.ticks = element_line(color="grey65"),
        axis.text = element_text(color="grey65"),
        axis.title = element_text(color="grey65"),
        axis.line = element_line(color="white"),
        axis.text.x = element_text(angle = 75, vjust = .5),
        legend.position="none") +
  scale_y_continuous(breaks = c(seq(0, max(baseDados$value, na.rm = T) + 500, 500))) +
  coord_cartesian(xlim = c(1.6, 40),
                  ylim = c(1.6, 3600)) +
  geom_dl(
    aes(label = variable),
    method = list(list(dl.trans(x = x + 0.15), cex = 1.5, "last.points"))) +
  ggtitle('Perfil Geral da UFCG Desde Sua Criação') +
  ylab('') +
  xlab('Período') +
  geom_line(size = 1) +
  geom_point(size = 1.8)
