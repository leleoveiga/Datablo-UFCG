library(dplyr)
library(tidyr)
library(stringr)
library(readr)
library(ggplot2)
library(tibble)

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

write_delim(Reprovacao_2002, "Reprovacao_2002.csv", delim = ";")
write_delim(Reprovacao_2004, "Reprovação_2004.csv", delim = ";")
write_delim(Reprovacao_2006, "Reprovação_2006.csv", delim = ";")
write_delim(Reprovacao_2008, "Reprovação_2008.csv", delim = ";")
write_delim(Reprovacao_2010, "Reprovação_2010.csv", delim = ";")
write_delim(Reprovacao_2012, "Reprovação_2012.csv", delim = ";")
write_delim(Reprovacao_2014, "Reprovação_2014.csv", delim = ";")
write_delim(Reprovacao_2016, "Reprovação_2016.csv", delim = ";")
write_delim(Reprovacao_2018, "Reprovação_2018.csv", delim = ";")
write_delim(Reprovacao_2003, "Reprovacao_2003.csv", delim = ";")
write_delim(Reprovacao_2005, "Reprovação_2005.csv", delim = ";")
write_delim(Reprovacao_2007, "Reprovação_2007.csv", delim = ";")
write_delim(Reprovacao_2009, "Reprovação_2009.csv", delim = ";")
write_delim(Reprovacao_2011, "Reprovação_2011.csv", delim = ";")
write_delim(Reprovacao_2013, "Reprovação_2013.csv", delim = ";")
write_delim(Reprovacao_2015, "Reprovação_2015.csv", delim = ";")
write_delim(Reprovacao_2017, "Reprovação_2017.csv", delim = ";")
write_delim(Reprovacao_2019, "Reprovação_2019.csv", delim = ";")
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

Reprovacao_2002$Reprovações.2 <- NULL
Reprovacao_2003$Reprovações.2 <- NULL
Reprovacao_2004$Reprovações.2 <- NULL
Reprovacao_2005$Reprovações.2 <- NULL
Reprovacao_2006$Reprovações.2 <- NULL
Reprovacao_2007$Reprovações.2 <- NULL
Reprovacao_2008$Reprovações.2 <- NULL
Reprovacao_2009$Reprovações.2 <- NULL
Reprovacao_2010$Reprovações.2 <- NULL
Reprovacao_2011$Reprovações.2 <- NULL
Reprovacao_2012$Reprovações.2 <- NULL
Reprovacao_2013$Reprovações.2 <- NULL
Reprovacao_2014$Reprovações.2 <- NULL
Reprovacao_2015$Reprovações.2 <- NULL
Reprovacao_2016$Reprovações.2 <- NULL
Reprovacao_2017$Reprovações.2 <- NULL
Reprovacao_2018$Reprovações.2 <- NULL
Reprovacao_2019$Reprovações.2 <- NULL

####Adição de Colunas Fator Ano####

Reprovacao_2002 <- add_column(Reprovacao_2002, Ano = 2002, .after = 7)
Reprovacao_2003 <- add_column(Reprovacao_2003, Ano = 2003, .after = 7)
Reprovacao_2004 <- add_column(Reprovacao_2004, Ano = 2004, .after = 7)
Reprovacao_2005 <- add_column(Reprovacao_2005, Ano = 2005, .after = 7)
Reprovacao_2006 <- add_column(Reprovacao_2006, Ano = 2006, .after = 7)
Reprovacao_2007 <- add_column(Reprovacao_2007, Ano = 2007, .after = 7)
Reprovacao_2008 <- add_column(Reprovacao_2008, Ano = 2008, .after = 7)
Reprovacao_2009 <- add_column(Reprovacao_2009, Ano = 2009, .after = 7)
Reprovacao_2010 <- add_column(Reprovacao_2010, Ano = 2010, .after = 7)
Reprovacao_2011 <- add_column(Reprovacao_2011, Ano = 2011, .after = 7)
Reprovacao_2012 <- add_column(Reprovacao_2012, Ano = 2012, .after = 7)
Reprovacao_2013 <- add_column(Reprovacao_2013, Ano = 2013, .after = 7)
Reprovacao_2014 <- add_column(Reprovacao_2014, Ano = 2014, .after = 7)
Reprovacao_2015 <- add_column(Reprovacao_2015, Ano = 2015, .after = 7)
Reprovacao_2016 <- add_column(Reprovacao_2016, Ano = 2016, .after = 7)
Reprovacao_2017 <- add_column(Reprovacao_2017, Ano = 2017, .after = 7)
Reprovacao_2018 <- add_column(Reprovacao_2018, Ano = 2018, .after = 7)
Reprovacao_2019 <- add_column(Reprovacao_2019, Ano = 2019, .after = 7)


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










