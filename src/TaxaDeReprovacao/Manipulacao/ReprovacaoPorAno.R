library(tidyverse)
library(reshape2)
library(GGally)
df2002 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2002.csv", encoding = "UTF-8", sep = ";")
df2003 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2003.csv", encoding = "UTF-8", sep = ";")
df2004 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2004.csv", encoding = "UTF-8", sep = ";")
df2005 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2005.csv", encoding = "UTF-8", sep = ";")
df2006 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2006.csv", encoding = "UTF-8", sep = ";")
df2007 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2007.csv", encoding = "UTF-8", sep = ";")
df2008 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2008.csv", encoding = "UTF-8", sep = ";")
df2009 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2009.csv", encoding = "UTF-8", sep = ";")
df2010 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2010.csv", encoding = "UTF-8", sep = ";")
df2011 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2011.csv", encoding = "UTF-8", sep = ";")
df2012 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2012.csv", encoding = "UTF-8", sep = ";")
df2013 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2013.csv", encoding = "UTF-8", sep = ";")
df2014 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2014.csv", encoding = "UTF-8", sep = ";")
df2015 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2015.csv", encoding = "UTF-8", sep = ";")
df2016 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2016.csv", encoding = "UTF-8", sep = ";")
df2017 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2017.csv", encoding = "UTF-8", sep = ";")
df2018 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2018.csv", encoding = "UTF-8", sep = ";")
df2019 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Reprovacao_2019.csv", encoding = "UTF-8", sep = ";")

listaDf = list(df2002, df2003, df2004, df2005, df2006, df2007, df2008, df2009,
               df2010, df2011, df2012, df2013, df2014, df2015, df2016, df2017, df2018, df2019)

dfFinal = setNames(data.frame(matrix(ncol = 1, nrow = 0)), c("Curso"))
dfFinal$Curso <- as.character(dfFinal$Curso)

anos = c("02", "03", "04", "05", "06",
         "07", "08", "09", "10", "11",
         "12", "13", "14", "15", "16",
         "17", "18", "19")

reprovacoes <- paste0('', anos)

for (i in 1:length(listaDf)){
  listaDf[[i]]$Reprovações <- listaDf[[i]]$Reprovações.1 + listaDf[[i]]$Reprovações.2
  listaDf[[i]]$Reprovações.1 <- NULL
  listaDf[[i]]$Reprovações.2 <- NULL
  listaDf[[i]]$Matrículas.1 <- NULL
  listaDf[[i]]$Matrículas.2 <- NULL
  listaDf[[i]]$Porcentagem.1 <- NULL
  listaDf[[i]]$Porcentagem.2 <- NULL
  names(listaDf[[i]])[2] <- reprovacoes[i]
  dfFinal <- full_join(dfFinal, listaDf[[i]], by = "Curso" )  
}

#write_delim(dfFinal, "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Manipulacao/dfCompleto/reprovacaoPorAno.csv", delim = ";")

df1 <- melt(dfFinal, id.vars="Curso")
df2 <- dfFinal
names(df1)[2:3] <- c("Ano","Reprovações") 

#### Primeiro plot ####
ggplot(df1, aes(x=Ano, y=Reprovações, col=Curso, group = Curso)) + 
  geom_line() + 
  geom_point()

#### Testar esse tipo de plot dps ####
ggparcoord(df2,
           columns = 2:19, groupColumn = 1
) 


ggplot(data = Final.Total,
       mapping = aes(fill = `Vagas Ociosas`, x = `Alunos Ativos`,
                     y = reorder(Curso, -`Alunos Ativos`),
                     label = `Alunos Ativos`)) +
  geom_col() +
  scale_fill_viridis_c(option = "cividis") + #uma palheta de cores personalizada
  theme(
    plot.title = element_text(color="white",hjust=0,vjust=1, size=rel(1.5)),
    plot.background = element_rect(fill="gray20"), #cor da parte externa do fundo
    panel.background = element_rect(fill="gray20"), #cor da parte interna do fundo
    # # panel.border = element_rect(fill=NA,color="gray20", size=0.5, linetype="solid"), #preencher NAs com outras coisas
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
  coord_cartesian(xlim = c(48, 1000), ylim = c(1.1, 61)) + #corrigir gap das barras
  xlab("Alunos Ativos") +
  ylab("Cursos") +
  ggtitle("Alunos ativos x curso.")

ggplot(dfFinal, aes(x=dfFinal[2:19], y=Curso, group=Curso)) +
  geom_line(aes(linetype=Curso))+
  geom_point() +
# ggplot(data = dfFinal,
#        mapping = aes(x = Curso, y = dfFinal[1:19])) +
  # geom_line(fill = "#ff4400") +
  # scale_fill_viridis_c(option = "cividis") + #uma palheta de cores personalizada
  # theme(
  #   plot.title = element_text(color="white",hjust=0,vjust=1, size=rel(1.5)),
  #   plot.background = element_rect(fill="gray20"), #cor da parte externa do fundo
  #   panel.background = element_rect(fill="gray20"), #cor da parte interna do fundo
  #   # # panel.border = element_rect(fill=NA,color="gray20", size=0.5, linetype="solid"), #preencher NAs com outras coisas
  #   panel.grid.major = element_line(colour ="gray30"), #grade maior
  #   panel.grid.minor = element_blank(), #grade menor
  #   axis.line = element_blank(), #nao sei
  #   axis.ticks = element_line(color="gray75"), #cor dos marcadores dos eixos
  #   axis.text = element_text(color="gray75"), #cor do texto dos eixos
  #   axis.title = element_text(color="white"), #cor do titulo dos eixos
  #   # axis.text.y  = element_text(hjust=1), #posicao do texto do eixo y
  #   legend.text = element_text(color="gray75", size=rel(1)), #cor do texto da legenda secundaria
  #   legend.background = element_rect(fill="gray20"), #cor do fundo da legenda secundaria
  #   # legend.position = "bottom", #posicao do preenchimento
  #   legend.title= element_text(color="gray75") #cor do titulo do preenchimento
  # ) +
  # geom_text(size = rel(4), hjust = -0.5, color = "gray75") + #texto nas barras
  # coord_cartesian(xlim = c(48, 1000), ylim = c(1.1, 61)) + #corrigir gap das barras
  xlab("Anos") +
  ylab("Reprovações") +
  ggtitle("Alunos ativos x curso.")
