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











