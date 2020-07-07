library(dplyr)
library(tidyr)
library(stringr)
library(readr)
library(ggplot2)
library(tibble)
library(purrr)


####Consertando a CAGADA de LEO####

Reprovação_2005$Curso <- as.character(Reprovação_2005$Curso)
Reprovação_2005[21,1] <- "FÍSICA"
Reprovação_2005[22,1] <- "GEOGRAFIA"
Reprovação_2005$Curso <- as.factor(as.character(Reprovação_2005$Curso))


Reprovação_2007$Curso <- as.character(Reprovação_2007$Curso)
Reprovação_2007$Percentual  <- NULL
Reprovação_2007[6,1] <- "CIÊNCIAS BIOLÓGICAS"
Reprovação_2007[28,1] <- "GEOGRAFIA"
Reprovação_2007[36,1] <- "QUÍMICA"
Reprovação_2007[26:27,1] <- "FÍSICA"

Reprovação_2007 <- Reprovação_2007 %>% 
  group_by(Curso) %>% 
  summarise(Reprovações = sum(Reprovações),
            Matrículas = sum(Matrículas))

Percentual = round(
  (Reprovação_2007$Reprovações / Reprovação_2007$Matrículas) * 100, digits = 1)

Reprovação_2007 <- add_column(Reprovação_2007, Percentual = Percentual, .after = 3)
Reprovação_2007 <- as.data.frame(Reprovação_2007)
Reprovação_2007$Curso <- as.factor(as.character(Reprovação_2007$Curso))
            

Reprovação_2009$Curso <- as.character(Reprovação_2009$Curso)
Reprovação_2009[6,1] <- "CIÊNCIAS BIOLÓGICAS"
Reprovação_2009[44,1] <- "QUÍMICA"
Reprovação_2009[33,1] <- "INTERDISCIPLINAR EM EDUC. DO CAMPO"
Reprovação_2009$Curso <- as.factor(as.character(Reprovação_2009$Curso))


Reprovação_2011$Curso <- as.character(Reprovação_2011$Curso)
Reprovação_2011[7,1] <- "CIÊNCIAS BIOLÓGICAS"
Reprovação_2011[36,1] <- "INTERDISCIPLINAR EM EDUC. DO CAMPO"
Reprovação_2011[48,1] <- "QUÍMICA"
Reprovação_2011$Curso <- as.factor(as.character(Reprovação_2011$Curso))

Reprovacao_2013$Curso <- as.character(Reprovacao_2013$Curso)
Reprovacao_2013$Percentual  <- NULL
Reprovacao_2013[7,1] <- "CIÊNCIAS BIOLÓGICAS"
Reprovacao_2013[33,1] <- "FÍSICA"
Reprovacao_2013[36,1] <- "INTERDISCIPLINAR EM EDUC. DO CAMPO"
Reprovacao_2013[47,1] <- "QUÍMICA"

Reprovacao_2013 <- Reprovacao_2013 %>% 
  group_by(Curso) %>% 
  summarise(Reprovações = sum(Reprovações),
            Matrículas = sum(Matrículas))

Percentual = round(
  (Reprovacao_2013$Reprovações / Reprovacao_2013$Matrículas) * 100, digits = 1)

Reprovacao_2013 <- add_column(Reprovacao_2013, Percentual = Percentual, .after = 3)
Reprovacao_2013 <- as.data.frame(Reprovacao_2013)

Reprovacao_2013$Curso <- as.factor(Reprovacao_2013$Curso)

####Reorganização####

Reprovacao_2005[is.na(Reprovacao_2005)] <- 0.0
Reprovacao_2005$X <- NULL
Reprovacao_2007$X <- NULL
Reprovacao_2009$X <- NULL
Reprovacao_2011$X <- NULL
Reprovacao_2013$X <- NULL
Reprovacao_2015$X <- NULL
Reprovacao_2017$X <- NULL
Reprovacao_2017$X <- NULL
Reprovacao_2019$X <- NULL

Reprovacao_2002$Curso <- as.character(Reprovacao_2002$Curso)
Reprovacao_2002$Curso <- as.factor(as.character(Reprovacao_2002$Curso))
Reprovacao_2002[19,1] <- "GEOGRAFIA"

write_delim(Reprovacao_2002, "Reprovacao_2002.csv", delim = ";")
write_delim(Reprovacao_2004, "Reprovacao_2004.csv", delim = ";")
write_delim(Reprovacao_2006, "Reprovacao_2006.csv", delim = ";")
write_delim(Reprovacao_2008, "Reprovacao_2008.csv", delim = ";")
write_delim(Reprovacao_2010, "Reprovacao_2010.csv", delim = ";")
write_delim(Reprovacao_2012, "Reprovacao_2012.csv", delim = ";")
write_delim(Reprovacao_2014, "Reprovacao_2014.csv", delim = ";")
write_delim(Reprovacao_2016, "Reprovacao_2016.csv", delim = ";")
write_delim(Reprovacao_2018, "Reprovacao_2018.csv", delim = ";")
write_delim(Reprovacao_2003, "Reprovacao_2003.csv", delim = ";")
write_delim(Reprovacao_2005, "Reprovacao_2005.csv", delim = ";")
write_delim(Reprovacao_2007, "Reprovacao_2007.csv", delim = ";")
write_delim(Reprovacao_2009, "Reprovacao_2009.csv", delim = ";")
write_delim(Reprovacao_2011, "Reprovacao_2011.csv", delim = ";")
write_delim(Reprovacao_2013, "Reprovacao_2013.csv", delim = ";")
write_delim(Reprovacao_2015, "Reprovacao_2015.csv", delim = ";")
write_delim(Reprovacao_2017, "Reprovacao_2017.csv", delim = ";")
write_delim(Reprovacao_2019, "Reprovacao_2019.csv", delim = ";")

#editando dataframes

listaDf = list(Reprovacao_2002, Reprovacao_2003, Reprovacao_2004, Reprovacao_2005,
                        Reprovacao_2006, Reprovacao_2007, Reprovacao_2008, Reprovacao_2009,
                        Reprovacao_2010, Reprovacao_2011, Reprovacao_2012, Reprovacao_2013,
                        Reprovacao_2014, Reprovacao_2015, Reprovacao_2016, Reprovacao_2017,
                        Reprovacao_2018, Reprovacao_2019)

for (i in 1:length(listaDf)) {
  listaDf[[i]]$Reprovações.1 <- NULL
  listaDf[[i]]$Ano <- NULL
}

anos = c("02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19")
matriculas <- paste0('Matrículas.', anos)
reprovacoes <- paste0('Reprovações.', anos)
porcentagem <- paste0('Percentual.', anos)

for (i in 1:length(listaDf)){
  names(listaDf[[i]])[2] <- matriculas[i]
  names(listaDf[[i]])[3] <- reprovacoes[i]
  names(listaDf[[i]])[4] <- porcentagem[i]
}

listaDf[[12]]$Curso <- str_replace(listaDf[[12]]$Curso, "[NDVM]$", "")
listaDf[[12]]$Curso <- str_replace(listaDf[[12]]$Curso, "[:blank:]$", "")
listaDf[[12]]$Curso <- str_replace(listaDf[[12]]$Curso, "[\\-]$", "")
listaDf[[12]]$Curso <- str_replace(listaDf[[12]]$Curso, "[\\(]+[:alpha:]+[\\)]", "")
listaDf[[12]]$Curso <- str_replace(listaDf[[12]]$Curso, "[\\(]+[:alpha:]+[\\)]", "")
listaDf[[12]]$Curso <- str_replace(listaDf[[12]]$Curso, "[:blank:]$", "")
listaDf[[12]]$Curso <- str_replace(listaDf[[12]]$Curso, "[\\.]$", "")
listaDf[[12]]$Curso <- str_replace(listaDf[[12]]$Curso, "[:blank:]$", "")
listaDf[[12]]$Curso <- str_replace(listaDf[[12]]$Curso, "[\\.]$", "")

####Adição de Colunas Fator Ano####

for (i in 1:length(listaDf)) {
  listaDf[[i]]$Ano <- as.factor(as.numeric(listaDf[[i]]$Ano))
  listaDf[[i]]$Reprovações <- listaDf[[i]]$Reprovações.1 + Reprovações.2
  listaDf[[i]]$Matrículas <- listaDf[[i]]$Matrículas.1 + listaDf[[i]]$Matrículas.2
}

####Somando colunas de período####

for (i in 1:length(listaDf)) {
  listaDf[[i]] <-  add_column(listaDf[[i]], Matrículas = NA, .after = 5)
}

####Criando Porcentagem Geral

for (i in 1:length(listaDf)) {
  Percentual = round((listaDf[[i]]$Reprovações / listaDf[[i]]$Matrículas) * 100, digits = 1)
  listaDf[[i]] <- add_column(listaDf[[i]], Percentual = Percentual, .after = 3)
}

####Criando MegaDf####

MegaDF <- setNames(data.frame(matrix(ncol = 1, nrow = 0)), c("Curso"))
MegaDF$Curso <- as.character(MegaDF$Curso)

for (i in 1:length(listaDf)) {
  MegaDF <- full_join(MegaDF, listaDf[[i]], by = "Curso")
}

write_delim(MegaDF, "MegaDF.csv", delim = ";")

####Plots Engenharias####
  #Preparando DFs finos

#Engenharias
engenharias <- MegaDF[c(10:17, 30, 34:35, 37:39),] #Criando um DF com dados das engenharias
engenharias <- arrange(engenharias) 

n = 2
engenhariasmat <- engenharias[[1]][1:14] 
engenhariasmat <- as.data.frame(engenhariasmat)

while (n <= 55){ #Percorre o DF e salva apenas as colunas de matrículas
  engenhariasmat <- add_column(
    engenhariasmat, matrículas = engenharias[[n]][1:14])
  n = n + 3
}

colnames(engenhariasmat) <- paste0("", 2001:2019)
names(engenhariasmat)[1] <- "Curso"


n = 3
engenhariasrep <- engenharias[[1]][1:14] 
engenhariasrep <- as.data.frame(engenhariasrep)

while (n <= 55){ #Percorre o DF e salva apenas as colunas de matrículas
  engenhariasrep <- add_column(
    engenhariasrep, matrículas = engenharias[[n]][1:14])
  n = n + 3
}

colnames(engenhariasrep) <- paste0("", 2001:2019)
names(engenhariasrep)[1] <- "Curso"


n = 4
engenhariasper <- engenharias[[1]][1:14] 
engenhariasper <- as.data.frame(engenhariasper)

while (n <= 55){ #Percorre o DF e salva apenas as colunas de matrículas
  engenhariasper <- add_column(
    engenhariasper, matrículas = engenharias[[n]][1:14])
  n = n + 3
}

colnames(engenhariasper) <- paste0("", 2001:2019)
names(engenhariasper)[1] <- "Curso"

c <- as.vector(engenharias$Curso)
a <- c(2002:2019)

engenhariasmat <- as.data.frame(t(engenhariasmat))
engenhariasmat <- engenhariasmat[-1,]
names(engenhariasmat) <- c
engenhariasmat <- add_column(engenhariasmat, Ano = a, .after = 0)


engenhariasrep <- as.data.frame(t(engenhariasrep))
engenhariasrep <- engenhariasrep[-1,]
names(engenhariasrep) <- c


engenhariasper <- as.data.frame(t(engenhariasper))
engenhariasper <- engenhariasper[-1,]
names(engenhariasper) <- c

n <- 5
a <- 2
while (n <= 55){
  a <- c(a, n)
  n <- n + 3
}

test2 <- melt(engenhariasmat, id.vars="Curso")

test2 <- names(c())

ggplot(data = test2,
       mapping = aes(x = variable,
                     y = value,
                     group = Curso,
                     col = Curso)) +
  geom_line() + 
  geom_point()



df <- read.delim(
  file = "~/Documentos/Analise-de-Dados-da-UFCG/DadosProcessados/TaxaDeReprovacao/Manipulacao/dfCompleto/compiladoPorAno.csv",
  encoding = "UTF-8", sep = ";")

####Criação DF de área de conhecimento####



