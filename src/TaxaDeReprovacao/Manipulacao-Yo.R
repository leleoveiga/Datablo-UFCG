library(dplyr)
library(tidyr)
library(stringr)
library(readr)
library(ggplot2)
library(tibble)


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

 # as linhas a seguir foram usadas varias vezes com o $ alterado

listaDf = list(Reprovacao_2002, Reprovacao_2003, Reprovacao_2004, Reprovacao_2005,
                        Reprovacao_2006, Reprovacao_2007, Reprovacao_2008, Reprovacao_2009,
                        Reprovacao_2010, Reprovacao_2011, Reprovacao_2012, Reprovacao_2013,
                        Reprovacao_2014, Reprovacao_2015, Reprovacao_2016, Reprovacao_2017,
                        Reprovacao_2018, Reprovacao_2019)

for (i in listaDf) {
  i$Reprovações.1 <- NULL
  i$Ano <- NULL
}

names(listaDf[1])[2:4] <- c("Matrículas.02", "Reprovações.02", "Percentual.02")
names(listaDf[2])[2:4] <- c("Matrículas.03", "Reprovações.03", "Percentual.03")
names(listaDf[3])[2:4] <- c("Matrículas.04", "Reprovações.04", "Percentual.04")
names(listaDf[4])[2:4] <- c("Matrículas.05", "Reprovações.05", "Percentual.05")
names(listaDf[5])[2:4] <- c("Matrículas.06", "Reprovações.06", "Percentual.06")
names(listaDf[6])[2:4] <- c("Matrículas.07", "Reprovações.07", "Percentual.07")
names(listaDf[7])[2:4] <- c("Matrículas.08", "Reprovações.08", "Percentual.08")
names(listaDf[8])[2:4] <- c("Matrículas.09", "Reprovações.09", "Percentual.09")
names(listaDf[9])[2:4] <- c("Matrículas.10", "Reprovações.10", "Percentual.10")
names(listaDf[10])[2:4] <- c("Matrículas.11", "Reprovações.11", "Percentual.11")
names(listaDf[11])[2:4] <- c("Matrículas.12", "Reprovações.12", "Percentual.12")
names(listaDf[12])[2:4] <- c("Matrículas.13", "Reprovações.13", "Percentual.13")
names(listaDf[13])[2:4] <- c("Matrículas.14", "Reprovações.14", "Percentual.14")
names(listaDf[14])[2:4] <- c("Matrículas.15", "Reprovações.15", "Percentual.15")
names(listaDf[15])[2:4] <- c("Matrículas.16", "Reprovações.16", "Percentual.16")
names(listaDf[16])[2:4] <- c("Matrículas.17", "Reprovações.17", "Percentual.17")
names(listaDf[17])[2:4] <- c("Matrículas.18", "Reprovações.18", "Percentual.18")
names(listaDf[18])[2:4] <- c("Matrículas.19", "Reprovações.19", "Percentual.19")


listaDf[12]$Curso <- str_replace(listaDf[12]$Curso, "[NDVM]$", "")
listaDf[12]$Curso <- str_replace(listaDf[12]$Curso, "[:blank:]$", "")
listaDf[12]$Curso <- str_replace(listaDf[12]$Curso, "[\\-]$", "")
listaDf[12]$Curso <- str_replace(listaDf[12]$Curso, "[\\(]+[:alpha:]+[\\)]", "")
listaDf[12]$Curso <- str_replace(listaDf[12]$Curso, "[\\(]+[:alpha:]+[\\)]", "")
listaDf[12]$Curso <- str_replace(listaDf[12]$Curso, "[:blank:]$", "")
listaDf[12]$Curso <- str_replace(listaDf[12]$Curso, "[\\.]$", "")
listaDf[12]$Curso <- str_replace(listaDf[12]$Curso, "[:blank:]$", "")
listaDf[12]$Curso <- str_replace(listaDf[12]$Curso, "[\\.]$", "")




####Adição de Colunas Fator Ano####

for (i in listaDf) {
  i$Ano <- as.factor(as.numeric(i$Ano))
  i$Reprovações <- i$Reprovações.1 + Reprovações.2
  i$Matrículas <- i$Matrículas.1 + i$Matrículas.2
}

####Somando colunas de período####

for (i in listaDf) {
  i <-  add_column(i, Matrículas = NA, .after = 5)
}

####Criando Porcentagem Geral

for (i in listaDf) {
  Percentual = round((i$Reprovações / i$Matrículas) * 100, digits = 1)
  i <- add_column(i, Percentual = Percentual, .after = 3)
}

####Criando MegaDf####

MegaDF <- setNames(data.frame(matrix(ncol = 1, nrow = 0)), c("Curso"))
MegaDF$Curso <- as.character(MegaDF$Curso)

for (i in listaDf) {
  MegaDF <- full_join(MegaDF, i, by = "Curso")
}

write_delim(MegaDF, "MegaDF.csv", delim = ";")





