library(dplyr)
library(tidyr)
library(stringr)
library(readr)
library(ggplot2)
library(tibble)

df2002 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2002.csv", encoding = "UTF-8", sep = ";")
df2003 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2003.csv", encoding = "UTF-8", sep = ";")
df2004 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2004.csv", encoding = "UTF-8", sep = ";")
df2005 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2005.csv", encoding = "UTF-8", sep = ";")
df2006 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2006.csv", encoding = "UTF-8", sep = ";")
df2007 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2007.csv", encoding = "UTF-8", sep = ";")
df2008 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2008.csv", encoding = "UTF-8", sep = ";")
df2009 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2009.csv", encoding = "UTF-8", sep = ";")
df2010 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2010.csv", encoding = "UTF-8", sep = ";")
df2011 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2011.csv", encoding = "UTF-8", sep = ";")
df2012 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2012.csv", encoding = "UTF-8", sep = ";")
df2013 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2013.csv", encoding = "UTF-8", sep = ";")
df2014 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2014.csv", encoding = "UTF-8", sep = ";")
df2015 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2015.csv", encoding = "UTF-8", sep = ";")
df2016 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2016.csv", encoding = "UTF-8", sep = ";")
df2017 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2017.csv", encoding = "UTF-8", sep = ";")
df2018 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2018.csv", encoding = "UTF-8", sep = ";")
df2019 <- read.delim(file = "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2019.csv", encoding = "UTF-8", sep = ";")

listaDf = list(df2002, df2003, df2004, df2005, df2006, df2007, df2008, df2009,
               df2010, df2011, df2012, df2013, df2014, df2015, df2016, df2017, df2018, df2019)

dfFinal = setNames(data.frame(matrix(ncol = 1, nrow = 0)), c("Curso"))
dfFinal$Curso <- as.character(dfFinal$Curso)

# o for n salva alterações, ver dps
for (i in 1:length(listaDf)) {
  listaDf[[i]]$Matrículas <- listaDf[[i]]$Matrículas.1 + listaDf[[i]]$Matrículas.2
  listaDf[[i]]$Reprovações <- listaDf[[i]]$Reprovações.1 + listaDf[[i]]$Reprovações.2
  listaDf[[i]]$Porcentagem <- round((listaDf[[i]]$Reprovações / listaDf[[i]]$Matrículas) * 100, digits = 1)
  listaDf[[i]]$Matrículas.1 <- NULL
  listaDf[[i]]$Matrículas.2 <- NULL
  listaDf[[i]]$Reprovações.1 <- NULL
  listaDf[[i]]$Reprovações.2 <- NULL
  listaDf[[i]]$Porcentagem.1 <- NULL
  listaDf[[i]]$Porcentagem.2 <- NULL
}

names(listaDf[[1]])[2:4] <- c("Matrículas.02", "Reprovações.02", "Percentual.02")
names(listaDf[[2]])[2:4] <- c("Matrículas.03", "Reprovações.03", "Percentual.03")
names(listaDf[[3]])[2:4] <- c("Matrículas.04", "Reprovações.04", "Percentual.04")
names(listaDf[[4]])[2:4] <- c("Matrículas.05", "Reprovações.05", "Percentual.05")
names(listaDf[[5]])[2:4] <- c("Matrículas.06", "Reprovações.06", "Percentual.06")
names(listaDf[[6]])[2:4] <- c("Matrículas.07", "Reprovações.07", "Percentual.07")
names(listaDf[[7]])[2:4] <- c("Matrículas.08", "Reprovações.08", "Percentual.08")
names(listaDf[[8]])[2:4] <- c("Matrículas.09", "Reprovações.09", "Percentual.09")
names(listaDf[[9]])[2:4] <- c("Matrículas.10", "Reprovações.10", "Percentual.10")
names(listaDf[[10]])[2:4] <- c("Matrículas.11", "Reprovações.11", "Percentual.11")
names(listaDf[[11]])[2:4] <- c("Matrículas.12", "Reprovações.12", "Percentual.12")
names(listaDf[[12]])[2:4] <- c("Matrículas.13", "Reprovações.13", "Percentual.13")
names(listaDf[[13]])[2:4] <- c("Matrículas.14", "Reprovações.14", "Percentual.14")
names(listaDf[[14]])[2:4] <- c("Matrículas.15", "Reprovações.15", "Percentual.15")
names(listaDf[[15]])[2:4] <- c("Matrículas.16", "Reprovações.16", "Percentual.16")
names(listaDf[[16]])[2:4] <- c("Matrículas.17", "Reprovações.17", "Percentual.17")
names(listaDf[[17]])[2:4] <- c("Matrículas.18", "Reprovações.18", "Percentual.18")
names(listaDf[[18]])[2:4] <- c("Matrículas.19", "Reprovações.19", "Percentual.19")

for (i in 1:length(listaDf)){
  dfFinal <- full_join(dfFinal, listaDf[[i]], by = "Curso" )
}
