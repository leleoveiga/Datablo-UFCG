library(dplyr)
library(tidyr)
library(stringr)
library(readr)
library(ggplot2)
library(tibble)

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

Reprovacao_2005$X <- NULL
Reprovacao_2005[is.na(Reprovacao_2005)] <- 0.0

Reprovacao_2007$X <- NULL
Reprovacao_2009$X <- NULL
Reprovacao_2011$X <- NULL
Reprovacao_2013$X <- NULL
Reprovacao_2015$X <- NULL
Reprovacao_2017$X <- NULL
Reprovacao_2017$X <- NULL
Reprovacao_2019$X <- NULL
