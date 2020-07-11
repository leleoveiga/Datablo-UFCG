library(tidyverse)
library(reshape2)
library(GGally)
library(viridis)
library(directlabels)

df <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Manipulacao/dfCompleto/compiladoPorAno.csv", encoding = "UTF-8", sep = ";")

#um for com os 2 ifs nao funciona por algum motivo
for (i in 2:55){
  if (str_sub(names(df[i]), end=1) == "M") {
    df[i] = NULL
  }
}
for (i in 2:55){
  if (str_sub(names(df[i]), end=1) == "R" ) {
    df[i] = NULL
  }
}

#separando em 2 tipos de dataframe. Fase de testes
names(df)[2:19] = 2002:2019
df1 <- melt(df, id.vars="Curso")
names(df1)[2:3] <- c("Ano","Percentual") 

#humanas
#1, 2, 5, 6, 7, 8, 9, 19, 20, 21, 26, 28
#40, 41, 42, 43, 46, 47, 49, 50, 52
#exatas
#3, 10, 12, 13, 14, 15, 17, 18, 22, 25
#27, 30, 32, 33, 34, 35, 39, 48, 51
#biológicas
#4, 23, 24, 29, 31, 36, 37, 38, 44, 45

dfHumanas1 = df[c(1, 2, 5, 6, 7, 8, 9, 19, 20, 21, 26, 28),]
dfHumanas1 <- melt(dfHumanas1, id.vars="Curso")
names(dfHumanas1)[2:3] <- c("Ano","Percentual")
dfHumanas2 = df[c(40, 41, 42, 43, 46, 47, 49, 50, 52), c(1, 9:19)]
dfHumanas2 <- melt(dfHumanas2, id.vars="Curso")
names(dfHumanas2)[2:3] <- c("Ano","Percentual")
dfExatas2 = df[c(27, 32, 33, 48, 51, 3, 14, 18, 22, 25),]
dfExatas2 <- melt(dfExatas2, id.vars="Curso")
names(dfExatas2)[2:3] <- c("Ano","Percentual")
dfBiologicas = df[c(4, 23, 24, 29, 31, 36, 37, 38, 44, 45),]
dfBiologicas <- melt(dfBiologicas, id.vars="Curso")
names(dfBiologicas)[2:3] <- c("Ano","Percentual")

#### Humanas 1/2 ####
ggplot(dfHumanas1, aes(x=Ano, y=Percentual, colour=Curso, group=Curso, label=Curso)) +
  geom_line(size=1)+
  geom_point() +
  scale_color_viridis(option = "plasma", discrete = TRUE) + #uma palheta de cores personalizada
  scale_y_continuous(breaks = c(seq(0, max(dfHumanas1$Percentual, na.rm = T)+50, 2))) + #subdivide o eixo y
  theme(
    plot.title = element_text(color="gray65",hjust=0,vjust=1, size=rel(1.5)),
    plot.background = element_rect(fill="black"), #cor da parte externa do fundo
    panel.background = element_rect(fill="black"), #cor da parte interna do fundo
    # panel.border = element_rect(fill=NA,color="gray20", size=0.5, linetype="solid"), #preencher NAs com outras coisas
    panel.grid.major = element_line(colour ="gray30"), #grade maior
    panel.grid.minor = element_blank(), #grade menor
    axis.title = element_text(color="white"), #cor do titulo dos eixos
    axis.line = element_line(color="white"), #linha principal dos eixos
    axis.ticks = element_line(color="gray65"), #cor dos marcadores dos eixos
    axis.text = element_text(color="gray65"), #cor do texto dos eixos
    # axis.text.y  = element_text(hjust=1), #posicao do texto do eixo y
    legend.text = element_text(color="gray65", size=rel(1)), #cor do texto da legenda secundaria
    legend.background = element_rect(fill="black"), #cor do fundo da legenda secundaria
    legend.title= element_text(color="gray65"),#cor do titulo do preenchimento
    legend.key = element_rect(fill="black") #cor do fundo de cada valor
    
  ) +
  geom_dl(aes(label = Curso),
          method = list(list(dl.trans(x = x + 0.15), cex = 0.6, "last.points"))) + #label no final de cada linha
  coord_cartesian(xlim = c(1.6, 19.5), ylim = c(0.5, 35)) + #corrigir gap das barras
  # geom_text(data = dfHumanas1 %>% filter(Ano == last(Ano)), hjust = -0.1)                   
  xlab("Anos") +
  ylab("Percentual") +
  ggtitle("Taxa de Reprovação (em %) Anual Nos Cursos de Ciências Humanas(1/2) - UFCG")

#### Humanas 2/2 ####
ggplot(dfHumanas2, aes(x=Ano, y=Percentual, colour=Curso, group=Curso, label=Percentual)) +
  geom_line(size=1)+
  geom_point() +
  scale_color_viridis(option = "plasma", discrete = TRUE) + #uma palheta de cores personalizada
  scale_y_continuous(breaks = c(seq(0, max(dfHumanas2$Percentual, na.rm = T)+50, 2))) +
  theme(
    plot.title = element_text(color="gray65",hjust=0,vjust=1, size=rel(1.5)),
    plot.background = element_rect(fill="black"), #cor da parte externa do fundo
    panel.background = element_rect(fill="black"), #cor da parte interna do fundo
    # panel.border = element_rect(fill=NA,color="gray20", size=0.5, linetype="solid"), #preencher NAs com outras coisas
    panel.grid.major = element_line(colour ="gray30"), #grade maior
    panel.grid.minor = element_blank(), #grade menor
    axis.line = element_line(color="white"), #linha principal dos eixos
    axis.ticks = element_line(color="gray65"), #cor dos marcadores dos eixos
    axis.text = element_text(color="gray65"), #cor do texto dos eixos
    axis.title = element_text(color="white"), #cor do titulo dos eixos
    # axis.text.y  = element_text(hjust=1), #posicao do texto do eixo y
    legend.text = element_text(color="gray65", size=rel(1)), #cor do texto da legenda secundaria
    legend.background = element_rect(fill="black"), #cor do fundo da legenda secundaria
    # legend.position = "bottom", #posicao do preenchimento
    legend.title= element_text(color="gray65"), #cor do titulo do preenchimento
    legend.key = element_rect(fill="black")
  ) +
  geom_dl(aes(label = Curso),
          method = list(list(dl.trans(x = x + 0.15), cex = 0.6, "last.points"))) + #label no final de cada linha
  coord_cartesian(xlim = c(1.59, 12), ylim = c(0.5, 35)) + #corrigir gap das barras
  xlab("Anos") +
  ylab("Percentual") +
  ggtitle("Taxa de Reprovação (em %) Anual Nos Cursos de Ciências Humanas(2/2) - UFCG")

#### Exatas ####
ggplot(dfExatas2, aes(x=Ano, y=Percentual, colour=Curso, group=Curso, label=Percentual)) +
  geom_line(size=1)+
  geom_point() +
  scale_color_viridis(option = "plasma", discrete = TRUE) + #uma palheta de cores personalizada
  scale_y_continuous(breaks = c(seq(0, max(dfExatas2$Percentual, na.rm = T)+50, 2))) +
  theme(
    plot.title = element_text(color="gray65",hjust=0,vjust=1, size=rel(1.5)),
    plot.background = element_rect(fill="black"), #cor da parte externa do fundo
    panel.background = element_rect(fill="black"), #cor da parte interna do fundo
    # panel.border = element_rect(fill=NA,color="gray20", size=0.5, linetype="solid"), #preencher NAs com outras coisas
    panel.grid.major = element_line(colour ="gray30"), #grade maior
    panel.grid.minor = element_blank(), #grade menor
    axis.line = element_line(color="white"), #linha principal dos eixos
    axis.ticks = element_line(color="gray65"), #cor dos marcadores dos eixos
    axis.text = element_text(color="gray65"), #cor do texto dos eixos
    axis.title = element_text(color="white"), #cor do titulo dos eixos
    # axis.text.y  = element_text(hjust=1), #posicao do texto do eixo y
    legend.text = element_text(color="gray65", size=rel(1)), #cor do texto da legenda secundaria
    legend.background = element_rect(fill="black"), #cor do fundo da legenda secundaria
    # legend.position = "bottom", #posicao do preenchimento
    legend.title= element_text(color="gray65"), #cor do titulo do preenchimento
    legend.key = element_rect(fill="black")
  ) +
  geom_dl(aes(label = Curso),
          method = list(list(dl.trans(x = x + 0.15), cex = 0.6, "last.points"))) + #label no final de cada linha
  coord_cartesian(xlim = c(1.6, 19.5), ylim = c(0.5, 39)) + #corrigir gap das barras
  xlab("Anos") +
  ylab("Percentual") +
  ggtitle("Taxa de Reprovação (em %) Anual Nos Cursos de Ciências Exatas - UFCG")

#### Biológicas ####
ggplot(dfBiologicas, aes(x=Ano, y=Percentual, colour=Curso, group=Curso, label=Percentual)) +
  geom_line(size=1)+
  geom_point() +
  scale_color_viridis(option = "plasma", discrete = TRUE) + #uma palheta de cores personalizada
  scale_y_continuous(breaks = c(seq(0, max(dfBiologicas$Percentual, na.rm = T)+50, 2))) +
  theme(
    plot.title = element_text(color="gray65",hjust=0,vjust=1, size=rel(1.5)),
    plot.background = element_rect(fill="black"), #cor da parte externa do fundo
    panel.background = element_rect(fill="black"), #cor da parte interna do fundo
    # panel.border = element_rect(fill=NA,color="gray20", size=0.5, linetype="solid"), #preencher NAs com outras coisas
    panel.grid.major = element_line(colour ="gray30"), #grade maior
    panel.grid.minor = element_blank(), #grade menor
    axis.line = element_line(color="white"), #linha principal dos eixos
    axis.ticks = element_line(color="gray65"), #cor dos marcadores dos eixos
    axis.text = element_text(color="gray65"), #cor do texto dos eixos
    axis.title = element_text(color="white"), #cor do titulo dos eixos
    # axis.text.y  = element_text(hjust=1), #posicao do texto do eixo y
    legend.text = element_text(color="gray65", size=rel(1)), #cor do texto da legenda secundaria
    legend.background = element_rect(fill="black"), #cor do fundo da legenda secundaria
    # legend.position = "bottom", #posicao do preenchimento
    legend.title= element_text(color="gray65"), #cor do titulo do preenchimento
    legend.key = element_rect(fill="black")
  ) +
  geom_dl(aes(label = Curso),
          method = list(list(dl.trans(x = x + 0.15), cex = 0.6, "last.points"))) + #label no final de cada linha
  coord_cartesian(xlim = c(1.6, 19.5), ylim = c(0.5, 26)) + #corrigir gap das barras
  xlab("Anos") +
  ylab("Percentual") +
  ggtitle("Taxa de Reprovação (em %) Anual Nos Cursos de Ciências Biológicas - UFCG")

