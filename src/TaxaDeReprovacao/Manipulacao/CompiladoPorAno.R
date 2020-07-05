library(dplyr)
library(tidyr)
library(stringr)
library(readr)
library(ggplot2)
library(tibble)

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

#Criando dataframe final apenas com coluna curso pra juntar as outras depois
dfFinal = setNames(data.frame(matrix(ncol = 1, nrow = 0)), c("Curso"))
dfFinal$Curso <- as.character(dfFinal$Curso)

#Criando a lista de nomes das colunas pra renomear
anos = c("02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19")
matriculas <- paste0('Matrículas.', anos)
reprovacoes <- paste0('Reprovações.', anos)
porcentagem <- paste0('Percentual.', anos)

#Junta matriculas, reprovacoes e porcentagem por ano, e junta no dataframe final
for (i in 1:length(listaDf)) {
  listaDf[[i]]$Matrículas <- listaDf[[i]]$Matrículas.1 + listaDf[[i]]$Matrículas.2
  listaDf[[i]]$Reprovações <- listaDf[[i]]$Reprovações.1 + listaDf[[i]]$Reprovações.2
  listaDf[[i]]$Percentual <- round((listaDf[[i]]$Reprovações / listaDf[[i]]$Matrículas) * 100, digits = 1)
  listaDf[[i]]$Matrículas.1 <- NULL
  listaDf[[i]]$Matrículas.2 <- NULL
  listaDf[[i]]$Reprovações.1 <- NULL
  listaDf[[i]]$Reprovações.2 <- NULL
  listaDf[[i]]$Porcentagem.1 <- NULL
  listaDf[[i]]$Porcentagem.2 <- NULL
  names(listaDf[[i]])[2] <- matriculas[i]
  names(listaDf[[i]])[3] <- reprovacoes[i]
  names(listaDf[[i]])[4] <- porcentagem[i]
  dfFinal <- full_join(dfFinal, listaDf[[i]], by = "Curso" )
}

write_delim(dfFinal, "~/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Manipulacao/dfCompleto/compiladoPorAno.csv", delim = ";")
