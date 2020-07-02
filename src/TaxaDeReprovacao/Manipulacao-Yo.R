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
write_delim(Reprovação_2004, "Reprovacao_2004.csv", delim = ";")
write_delim(Reprovação_2006, "Reprovacao_2006.csv", delim = ";")
write_delim(Reprovação_2008, "Reprovacao_2008.csv", delim = ";")
write_delim(Reprovação_2010, "Reprovacao_2010.csv", delim = ";")
write_delim(Reprovação_2012, "Reprovacao_2012.csv", delim = ";")
write_delim(Reprovação_2014, "Reprovacao_2014.csv", delim = ";")
write_delim(Reprovação_2016, "Reprovacao_2016.csv", delim = ";")
write_delim(Reprovação_2018, "Reprovacao_2018.csv", delim = ";")
write_delim(Reprovacao_2003, "Reprovacao_2003.csv", delim = ";")
write_delim(Reprovação_2005, "Reprovacao_2005.csv", delim = ";")
write_delim(Reprovação_2007, "Reprovacao_2007.csv", delim = ";")
write_delim(Reprovação_2009, "Reprovacao_2009.csv", delim = ";")
write_delim(Reprovação_2011, "Reprovacao_2011.csv", delim = ";")
write_delim(Reprovação_2013, "Reprovacao_2013.csv", delim = ";")
write_delim(Reprovação_2015, "Reprovacao_2015.csv", delim = ";")
write_delim(Reprovação_2017, "Reprovacao_2017.csv", delim = ";")
write_delim(Reprovação_2019, "Reprovacao_2019.csv", delim = ";")

 # as linhas a seguir foram usadas varias vezes com o $ alterado
Reprovacao_2002$Reprovações.1 <- NULL
Reprovacao_2003$Reprovações.1 <- NULL
Reprovacao_2004$Reprovações.1 <- NULL
Reprovacao_2005$Reprovações.1 <- NULL
Reprovacao_2006$Reprovações.1 <- NULL
Reprovacao_2007$Reprovações.1 <- NULL
Reprovacao_2008$Reprovações.1 <- NULL
Reprovacao_2009$Reprovações.1 <- NULL
Reprovacao_2010$Reprovações.1 <- NULL
Reprovacao_2011$Reprovações.1 <- NULL
Reprovacao_2012$Reprovações.1 <- NULL
Reprovacao_2013$Reprovações.1 <- NULL
Reprovacao_2014$Reprovações.1 <- NULL
Reprovacao_2015$Reprovações.1 <- NULL
Reprovacao_2016$Reprovações.1 <- NULL
Reprovacao_2017$Reprovações.1 <- NULL
Reprovacao_2018$Reprovações.1 <- NULL
Reprovacao_2019$Reprovações.1 <- NULL

Reprovacao_2002$Ano <- NULL
Reprovacao_2003$Ano <- NULL
Reprovação_2004$Ano <- NULL
Reprovação_2005$Ano <- NULL
Reprovação_2006$Ano <- NULL
Reprovação_2007$Ano <- NULL
Reprovação_2008$Ano <- NULL
Reprovação_2009$Ano <- NULL
Reprovação_2010$Ano <- NULL
Reprovação_2011$Ano <- NULL
Reprovação_2012$Ano <- NULL
Reprovação_2013$Ano <- NULL
Reprovação_2014$Ano <- NULL
Reprovação_2015$Ano <- NULL
Reprovação_2016$Ano <- NULL
Reprovação_2017$Ano <- NULL
Reprovação_2018$Ano <- NULL
Reprovação_2019$Ano <- NULL

names(Reprovacao_2002)[2:4] <- c("Matrículas.02", "Reprovações.02", "Percentual.02")
names(Reprovacao_2003)[2:4] <- c("Matrículas.03", "Reprovações.03", "Percentual.03")
names(Reprovação_2004)[2:4] <- c("Matrículas.04", "Reprovações.04", "Percentual.04")
names(Reprovação_2005)[2:4] <- c("Matrículas.05", "Reprovações.05", "Percentual.05")
names(Reprovação_2006)[2:4] <- c("Matrículas.06", "Reprovações.06", "Percentual.06")
names(Reprovação_2007)[2:4] <- c("Matrículas.07", "Reprovações.07", "Percentual.07")
names(Reprovação_2008)[2:4] <- c("Matrículas.08", "Reprovações.08", "Percentual.08")
names(Reprovação_2009)[2:4] <- c("Matrículas.09", "Reprovações.09", "Percentual.09")
names(Reprovação_2010)[2:4] <- c("Matrículas.10", "Reprovações.10", "Percentual.10")
names(Reprovação_2011)[2:4] <- c("Matrículas.11", "Reprovações.11", "Percentual.11")
names(Reprovação_2012)[2:4] <- c("Matrículas.12", "Reprovações.12", "Percentual.12")
names(Reprovacao_2013)[2:4] <- c("Matrículas.13", "Reprovações.13", "Percentual.13")
names(Reprovação_2014)[2:4] <- c("Matrículas.14", "Reprovações.14", "Percentual.14")
names(Reprovação_2015)[2:4] <- c("Matrículas.15", "Reprovações.15", "Percentual.15")
names(Reprovação_2016)[2:4] <- c("Matrículas.16", "Reprovações.16", "Percentual.16")
names(Reprovação_2017)[2:4] <- c("Matrículas.17", "Reprovações.17", "Percentual.17")
names(Reprovação_2018)[2:4] <- c("Matrículas.18", "Reprovações.18", "Percentual.18")
names(Reprovação_2019)[2:4] <- c("Matrículas.19", "Reprovações.19", "Percentual.19")


Reprovação_2013$Curso <- str_replace(Reprovação_2013$Curso, "[NDVM]$", "")
Reprovação_2013$Curso <- str_replace(Reprovação_2013$Curso, "[:blank:]$", "")
Reprovação_2013$Curso <- str_replace(Reprovação_2013$Curso, "[\\-]$", "")
Reprovação_2013$Curso <- str_replace(Reprovação_2013$Curso, "[\\(]+[:alpha:]+[\\)]", "")
Reprovação_2013$Curso <- str_replace(Reprovação_2013$Curso, "[\\(]+[:alpha:]+[\\)]", "")
Reprovação_2013$Curso <- str_replace(Reprovação_2013$Curso, "[:blank:]$", "")
Reprovação_2013$Curso <- str_replace(Reprovação_2013$Curso, "[\\.]$", "")
Reprovação_2013$Curso <- str_replace(Reprovação_2013$Curso, "[:blank:]$", "")
Reprovação_2013$Curso <- str_replace(Reprovação_2013$Curso, "[\\.]$", "")




####Adição de Colunas Fator Ano####



Reprovacao_2002$Ano <- as.factor(as.numeric(Reprovacao_2002$Ano))
Reprovacao_2003$Ano <- as.factor(as.numeric(Reprovacao_2003$Ano))
Reprovacao_2004$Ano <- as.factor(as.numeric(Reprovacao_2004$Ano))
Reprovacao_2005$Ano <- as.factor(as.numeric(Reprovacao_2005$Ano))
Reprovacao_2006$Ano <- as.factor(as.numeric(Reprovacao_2006$Ano))
Reprovacao_2007$Ano <- as.factor(as.numeric(Reprovacao_2007$Ano))
Reprovacao_2008$Ano <- as.factor(as.numeric(Reprovacao_2008$Ano))
Reprovacao_2009$Ano <- as.factor(as.numeric(Reprovacao_2009$Ano))
Reprovacao_2010$Ano <- as.factor(as.numeric(Reprovacao_2010$Ano))
Reprovacao_2011$Ano <- as.factor(as.numeric(Reprovacao_2011$Ano))
Reprovacao_2012$Ano <- as.factor(as.numeric(Reprovacao_2012$Ano))
Reprovacao_2013$Ano <- as.factor(as.numeric(Reprovacao_2013$Ano))
Reprovacao_2014$Ano <- as.factor(as.numeric(Reprovacao_2014$Ano))
Reprovacao_2015$Ano <- as.factor(as.numeric(Reprovacao_2015$Ano))
Reprovacao_2016$Ano <- as.factor(as.numeric(Reprovacao_2016$Ano))
Reprovacao_2017$Ano <- as.factor(as.numeric(Reprovacao_2017$Ano))
Reprovacao_2018$Ano <- as.factor(as.numeric(Reprovacao_2018$Ano))
Reprovacao_2019$Ano <- as.factor(as.numeric(Reprovacao_2019$Ano))


Reprovacao_2002$Reprovações <- Reprovacao_2002$Reprovações.1 + Reprovacao_2002$Reprovações.2
Reprovacao_2003$Reprovações <- Reprovacao_2003$Reprovações.1 + Reprovacao_2003$Reprovações.2
Reprovacao_2004$Reprovações <- Reprovacao_2004$Reprovações.1 + Reprovacao_2004$Reprovações.2
Reprovacao_2005$Reprovações <- Reprovacao_2005$Reprovações.1 + Reprovacao_2005$Reprovações.2
Reprovacao_2006$Reprovações <- Reprovacao_2006$Reprovações.1 + Reprovacao_2006$Reprovações.2
Reprovacao_2007$Reprovações <- Reprovacao_2007$Reprovações.1 + Reprovacao_2007$Reprovações.2
Reprovacao_2008$Reprovações <- Reprovacao_2008$Reprovações.1 + Reprovacao_2008$Reprovações.2
Reprovacao_2009$Reprovações <- Reprovacao_2009$Reprovações.1 + Reprovacao_2009$Reprovações.2
Reprovacao_2010$Reprovações <- Reprovacao_2010$Reprovações.1 + Reprovacao_2010$Reprovações.2
Reprovacao_2011$Reprovações <- Reprovacao_2011$Reprovações.1 + Reprovacao_2011$Reprovações.2
Reprovacao_2012$Reprovações <- Reprovacao_2012$Reprovações.1 + Reprovacao_2012$Reprovações.2
Reprovacao_2013$Reprovações <- Reprovacao_2013$Reprovações.1 + Reprovacao_2013$Reprovações.2
Reprovacao_2014$Reprovações <- Reprovacao_2014$Reprovações.1 + Reprovacao_2014$Reprovações.2
Reprovacao_2015$Reprovações <- Reprovacao_2015$Reprovações.1 + Reprovacao_2015$Reprovações.2
Reprovacao_2016$Reprovações <- Reprovacao_2016$Reprovações.1 + Reprovacao_2016$Reprovações.2
Reprovacao_2017$Reprovações <- Reprovacao_2017$Reprovações.1 + Reprovacao_2017$Reprovações.2
Reprovacao_2018$Reprovações <- Reprovacao_2018$Reprovações.1 + Reprovacao_2018$Reprovações.2
Reprovacao_2019$Reprovações <- Reprovacao_2019$Reprovações.1 + Reprovacao_2019$Reprovações.2


Reprovacao_2002$Matrículas <- Reprovacao_2002$Matrículas.1 + Reprovacao_2002$Matrículas.2
Reprovacao_2003$Matrículas <- Reprovacao_2003$Matrículas.1 + Reprovacao_2003$Matrículas.2
Reprovacao_2004$Matrículas <- Reprovacao_2004$Matrículas.1 + Reprovacao_2004$Matrículas.2
Reprovacao_2005$Matrículas <- Reprovacao_2005$Matrículas.1 + Reprovacao_2005$Matrículas.2
Reprovacao_2006$Matrículas <- Reprovacao_2006$Matrículas.1 + Reprovacao_2006$Matrículas.2
Reprovacao_2007$Matrículas <- Reprovacao_2007$Matrículas.1 + Reprovacao_2007$Matrículas.2
Reprovacao_2008$Matrículas <- Reprovacao_2008$Matrículas.1 + Reprovacao_2008$Matrículas.2
Reprovacao_2009$Matrículas <- Reprovacao_2009$Matrículas.1 + Reprovacao_2009$Matrículas.2
Reprovacao_2010$Matrículas <- Reprovacao_2010$Matrículas.1 + Reprovacao_2010$Matrículas.2
Reprovacao_2011$Matrículas <- Reprovacao_2011$Matrículas.1 + Reprovacao_2011$Matrículas.2
Reprovacao_2012$Matrículas <- Reprovacao_2012$Matrículas.1 + Reprovacao_2012$Matrículas.2
Reprovacao_2013$Matrículas <- Reprovacao_2013$Matrículas.1 + Reprovacao_2013$Matrículas.2
Reprovacao_2014$Matrículas <- Reprovacao_2014$Matrículas.1 + Reprovacao_2014$Matrículas.2
Reprovacao_2015$Matrículas <- Reprovacao_2015$Matrículas.1 + Reprovacao_2015$Matrículas.2
Reprovacao_2016$Matrículas <- Reprovacao_2016$Matrículas.1 + Reprovacao_2016$Matrículas.2
Reprovacao_2017$Matrículas <- Reprovacao_2017$Matrículas.1 + Reprovacao_2017$Matrículas.2
Reprovacao_2018$Matrículas <- Reprovacao_2018$Matrículas.1 + Reprovacao_2018$Matrículas.2
Reprovacao_2019$Matrículas <- Reprovacao_2019$Matrículas.1 + Reprovacao_2019$Matrículas.2


####Somando colunas de período####

Reprovacao_2002 <- add_column(Reprovacao_2002, Matrículas = NA, .after = 5)
Reprovacao_2003 <- add_column(Reprovacao_2003, Matrículas = NA, .after = 5)
Reprovacao_2004 <- add_column(Reprovacao_2004, Matrículas = NA, .after = 5)
Reprovacao_2005 <- add_column(Reprovacao_2005, Matrículas = NA, .after = 5)
Reprovacao_2006 <- add_column(Reprovacao_2006, Matrículas = NA, .after = 5)
Reprovacao_2007 <- add_column(Reprovacao_2007, Matrículas = NA, .after = 5)
Reprovacao_2008 <- add_column(Reprovacao_2008, Matrículas = NA, .after = 5)
Reprovacao_2009 <- add_column(Reprovacao_2009, Matrículas = NA, .after = 5)
Reprovacao_2010 <- add_column(Reprovacao_2010, Matrículas = NA, .after = 5)
Reprovacao_2011 <- add_column(Reprovacao_2011, Matrículas = NA, .after = 5)
Reprovacao_2012 <- add_column(Reprovacao_2012, Matrículas = NA, .after = 5)
Reprovacao_2013 <- add_column(Reprovacao_2013, Matrículas = NA, .after = 5)
Reprovacao_2014 <- add_column(Reprovacao_2014, Matrículas = NA, .after = 5)
Reprovacao_2015 <- add_column(Reprovacao_2015, Matrículas = NA, .after = 5)
Reprovacao_2016 <- add_column(Reprovacao_2016, Matrículas = NA, .after = 5)
Reprovacao_2017 <- add_column(Reprovacao_2017, Matrículas = NA, .after = 5)
Reprovacao_2018 <- add_column(Reprovacao_2018, Matrículas = NA, .after = 5)
Reprovacao_2019 <- add_column(Reprovacao_2019, Matrículas = NA, .after = 5)

Reprovacao_2002 <- add_column(Reprovacao_2002, Reprovações = NA, .after = 6)
Reprovacao_2003 <- add_column(Reprovacao_2003, Reprovações = NA, .after = 6)
Reprovacao_2004 <- add_column(Reprovacao_2004, Reprovações = NA, .after = 6)
Reprovacao_2005 <- add_column(Reprovacao_2005, Reprovações = NA, .after = 6)
Reprovacao_2006 <- add_column(Reprovacao_2006, Reprovações = NA, .after = 6)
Reprovacao_2007 <- add_column(Reprovacao_2007, Reprovações = NA, .after = 6)
Reprovacao_2008 <- add_column(Reprovacao_2008, Reprovações = NA, .after = 6)
Reprovacao_2009 <- add_column(Reprovacao_2009, Reprovações = NA, .after = 6)
Reprovacao_2010 <- add_column(Reprovacao_2010, Reprovações = NA, .after = 6)
Reprovacao_2011 <- add_column(Reprovacao_2011, Reprovações = NA, .after = 6)
Reprovacao_2012 <- add_column(Reprovacao_2012, Reprovações = NA, .after = 6)
Reprovacao_2013 <- add_column(Reprovacao_2013, Reprovações = NA, .after = 6)
Reprovacao_2014 <- add_column(Reprovacao_2014, Reprovações = NA, .after = 6)
Reprovacao_2015 <- add_column(Reprovacao_2015, Reprovações = NA, .after = 6)
Reprovacao_2016 <- add_column(Reprovacao_2016, Reprovações = NA, .after = 6)
Reprovacao_2017 <- add_column(Reprovacao_2017, Reprovações = NA, .after = 6)
Reprovacao_2018 <- add_column(Reprovacao_2018, Reprovações = NA, .after = 6)
Reprovacao_2019 <- add_column(Reprovacao_2019, Reprovações = NA, .after = 6)

####Criando Porcentagem Geral

Percentual = round(
  (Reprovacao_2002$Reprovações / Reprovacao_2002$Matrículas) * 100, digits = 1)

Reprovacao_2002 <- add_column(Reprovacao_2002, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2003$Reprovações / Reprovacao_2003$Matrículas) * 100, digits = 1)

Reprovacao_2003 <- add_column(Reprovacao_2003, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2004$Reprovações / Reprovacao_2004$Matrículas) * 100, digits = 1)

Reprovacao_2004 <- add_column(Reprovacao_2004, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2005$Reprovações / Reprovacao_2005$Matrículas) * 100, digits = 1)

Reprovacao_2005 <- add_column(Reprovacao_2005, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2006$Reprovações / Reprovacao_2006$Matrículas) * 100, digits = 1)

Reprovacao_2006 <- add_column(Reprovacao_2006, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2007$Reprovações / Reprovacao_2007$Matrículas) * 100, digits = 1)

Reprovacao_2007 <- add_column(Reprovacao_2007, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2008$Reprovações / Reprovacao_2008$Matrículas) * 100, digits = 1)

Reprovacao_2008 <- add_column(Reprovacao_2008, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2009$Reprovações / Reprovacao_2009$Matrículas) * 100, digits = 1)

Reprovacao_2009 <- add_column(Reprovacao_2009, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2010$Reprovações / Reprovacao_2010$Matrículas) * 100, digits = 1)

Reprovacao_2010 <- add_column(Reprovacao_2010, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2011$Reprovações / Reprovacao_2011$Matrículas) * 100, digits = 1)

Reprovacao_2011 <- add_column(Reprovacao_2011, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2012$Reprovações / Reprovacao_2012$Matrículas) * 100, digits = 1)

Reprovacao_2012 <- add_column(Reprovacao_2012, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2013$Reprovações / Reprovacao_2013$Matrículas) * 100, digits = 1)

Reprovacao_2013 <- add_column(Reprovacao_2013, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2014$Reprovações / Reprovacao_2014$Matrículas) * 100, digits = 1)

Reprovacao_2014 <- add_column(Reprovacao_2014, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2015$Reprovações / Reprovacao_2015$Matrículas) * 100, digits = 1)

Reprovacao_2015 <- add_column(Reprovacao_2015, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2016$Reprovações / Reprovacao_2016$Matrículas) * 100, digits = 1)

Reprovacao_2016 <- add_column(Reprovacao_2016, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2017$Reprovações / Reprovacao_2017$Matrículas) * 100, digits = 1)

Reprovacao_2017 <- add_column(Reprovacao_2017, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2018$Reprovações / Reprovacao_2018$Matrículas) * 100, digits = 1)

Reprovacao_2018 <- add_column(Reprovacao_2018, Percentual = Percentual, .after = 3)

Percentual = round(
  (Reprovacao_2019$Reprovações / Reprovacao_2019$Matrículas) * 100, digits = 1)

Reprovacao_2019 <- add_column(Reprovacao_2019, Percentual = Percentual, .after = 3)

####Criando MegaDf####

MegaDF <- full_join(Reprovacao_2002, Reprovacao_2003, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovação_2004, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovação_2005, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovação_2006, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovação_2007, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovação_2008, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovação_2009, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovação_2010, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovação_2011, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovação_2012, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovacao_2013, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovação_2014, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovação_2015, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovação_2016, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovação_2017, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovação_2018, by = "Curso")
MegaDF <- full_join(MegaDF, Reprovação_2019, by = "Curso")

write_delim(MegaDF, "MegaDF.csv", delim = ";")





