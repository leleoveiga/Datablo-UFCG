library(tidyverse)
library(reshape2)
library(GGally)
df <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Manipulacao/dfCompleto/compiladoPorAno.csv", encoding = "UTF-8", sep = ";")

#um for com os 2 ifs nao funciona por algum motivo
for (i in 2:55){
  if (str_sub(names(df[i]), end=1) == "M") {
    df[i] = NULL
  }
}
for (i in 2:55){
  if (str_sub(names(df[i]), end=1) == "P" ) {
    df[i] = NULL
  }
}

#separando em 2 tipos de dataframe. Fase de testes
names(df)[2:19] = c("02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19")
df1 <- melt(df, id.vars="Curso")
df2 <- df
names(df1)[2:3] <- c("Ano","Reprovações") 
dfArea = df

#humanas
#1,46, 2, 28, 5, 6, 47, 7, 8, 9, 40, 19, 20, 41, 21, 42, 43, 26, 49, 50, 52
#exatas
#33, 3, 10, 34, 35, 12, 13, 39, 30, 14, 15, 17, 48, 18, 22, 25, 32, 51, 27
#biológicas
#4, 31, 29, 37, ?38, 36, 23, 24, 44, 45


#### Primeiro plot ####
ggplot(df1, aes(x=Ano, y=Reprovações, col=Curso, group=Curso, label=Reprovações)) +
  geom_line()+
  geom_point() +
  scale_fill_viridis_c(option = "cividis") + #uma palheta de cores personalizada
  theme(
    plot.title = element_text(color="white",hjust=0,vjust=1, size=rel(1.5)),
    plot.background = element_rect(fill="gray20"), #cor da parte externa do fundo
    panel.background = element_rect(fill="gray20"), #cor da parte interna do fundo
    # panel.border = element_rect(fill=NA,color="gray20", size=0.5, linetype="solid"), #preencher NAs com outras coisas
    panel.grid.major = element_line(colour ="gray30"), #grade maior
    panel.grid.minor = element_blank(), #grade menor
    axis.line = element_blank(), #nao sei
    axis.ticks = element_line(color="gray75"), #cor dos marcadores dos eixos
    axis.text = element_text(color="gray75"), #cor do texto dos eixos
    axis.title = element_text(color="white"), #cor do titulo dos eixos
    # axis.text.y  = element_text(hjust=1), #posicao do texto do eixo y
    legend.text = element_text(color="gray75", size=rel(1)), #cor do texto da legenda secundaria
    legend.background = element_rect(fill="gray20"), #cor do fundo da legenda secundaria
    # legend.position = "bottom", #posicao do preenchimento
    legend.title= element_text(color="gray75") #cor do titulo do preenchimento
  ) +
  geom_text(size = rel(4), hjust = -0.5, color = "gray75") + #texto nas barras
  coord_cartesian(xlim = c(0, 18.5), ylim = c(20, 1650)) + #corrigir gap das barras
  xlab("Anos") +
  ylab("Reprovações(Cadeiras)") +
  ggtitle("Reprovações(Cadeiras) x Ano.")


