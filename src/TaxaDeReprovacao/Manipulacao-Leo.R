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

for (x in listaDf) {
  dfFinal <- full_join(dfFinal, x, by = "Curso" )
}
