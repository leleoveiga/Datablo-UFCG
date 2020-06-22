library(stringr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(purrr)
library(readr)
library(tibble)
####Limpeza dos Dados 2003####

names(taxaReprovacaoAnoPorCurso2003)[1:7] <- c(
  "Curso", "Reprovações.1", "Matrículas.1", "%.1", "Reprovações.2", "Matrículas.2", "%.2")

reprovacao_03 <- taxaReprovacaoAnoPorCurso2003
reprovacao_03 <- reprovacao_03[c(-1,-2,-3,-28,-29,-58,-59,-88,-89),]

reprovacao_03$Curso <- str_sub(reprovacao_03$Curso, start = 12 ) 
reprovacao_03$Curso <- str_sub(reprovacao_03$Curso, end = -1)

reprovacao_03$Curso <- str_replace(reprovacao_03$Curso, "[NDVM]$", "")
reprovacao_03$Curso <- str_replace(reprovacao_03$Curso, "[:blank:]$", "")
reprovacao_03$Curso <- str_replace(reprovacao_03$Curso, "[\\-]$", "")
reprovacao_03$Curso <- str_replace(reprovacao_03$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_03$Curso <- str_replace(reprovacao_03$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_03$Curso <- str_replace(reprovacao_03$Curso, "[:blank:]$", "")
reprovacao_03$Curso <- str_replace(reprovacao_03$Curso, "[\\.]$", "")
reprovacao_03$Curso <- str_replace(reprovacao_03$Curso, "[:blank:]$", "")
reprovacao_03$Curso <- str_replace(reprovacao_03$Curso, "[\\.]$", "")

reprovacao_03 <- arrange(reprovacao_03, Curso)

reprovacao_03[c(9:17),1] <- "CIÊNCIAS"
reprovacao_03[c(39:40),1] <- "ENGENHARIA ELÉTRICA"
reprovacao_03[c(59:68),1] <- "LETRAS"
reprovacao_03[c(80:88),1] <- "PEDAGOGIA"

reprovacao_03$`%.1` <- NULL
reprovacao_03$`%.2` <- NULL

reprovacao_03$Reprovações.1 <- as.numeric(as.character(reprovacao_03$Reprovações.1))
reprovacao_03$Matrículas.1 <- as.numeric(as.character(reprovacao_03$Matrículas.1))
reprovacao_03$Reprovações.2 <- as.numeric(as.character(reprovacao_03$Reprovações.2))
reprovacao_03$Matrículas.2 <- as.numeric(as.character(reprovacao_03$Matrículas.2))

reprovacao_03 <- reprovacao_03 %>% 
  group_by(Curso) %>% 
  summarise(Reprovações.1 = sum(Reprovações.1),
            Matrículas.1 = sum(Matrículas.1),
            Reprovações.2 = sum(Reprovações.2),
            Matrículas.2 = sum(Matrículas.2))

####Recalculando Porcentagens 2003####

porcentagem.total.1 = round(
  (reprovacao_03$Reprovações.1 / reprovacao_03$Matrículas.1) * 100, digits = 1)

reprovacao_03 <- add_column(reprovacao_03, Porcentagem.1 = porcentagem.total.1, .after = 3)

porcentagem.total.2 = round(
  (reprovacao_03$Reprovações.2 / reprovacao_03$Matrículas.2) * 100, digits = 1)

reprovacao_03 <- add_column(reprovacao_03, Porcentagem.2 = porcentagem.total.2, .after = 6)

write_delim(reprovacao_03, "Reprovação 2003.csv", delim = ";")

####Limpeza dos Dados 2004####

reprovacao_04 <- taxaReprovacaoAnoPorCurso2004

reprovacao_04 <- reprovacao_04[c(-1,-2,-3,-28,-29,-58,-59,-88,-89),]

names(reprovacao_04)[1:7] <- c(
  "Curso", "Reprovações.1", "Matrículas.1", "%.1", "Reprovações.2", "Matrículas.2", "%.2")

reprovacao_04$Curso <- str_sub(reprovacao_04$Curso, start = 12 ) 
reprovacao_04$Curso <- str_sub(reprovacao_04$Curso, end = -1)

reprovacao_04$Curso <- str_replace(reprovacao_04$Curso, "[NDVM]$", "")
reprovacao_04$Curso <- str_replace(reprovacao_04$Curso, "[:blank:]$", "")
reprovacao_04$Curso <- str_replace(reprovacao_04$Curso, "[\\-]$", "")
reprovacao_04$Curso <- str_replace(reprovacao_04$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_04$Curso <- str_replace(reprovacao_04$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_04$Curso <- str_replace(reprovacao_04$Curso, "[:blank:]$", "")
reprovacao_04$Curso <- str_replace(reprovacao_04$Curso, "[\\.]$", "")
reprovacao_04$Curso <- str_replace(reprovacao_04$Curso, "[:blank:]$", "")
reprovacao_04$Curso <- str_replace(reprovacao_04$Curso, "[\\.]$", "")

reprovacao_04 <- arrange(reprovacao_04, Curso)

reprovacao_04$`%.1` <- NULL
reprovacao_04$`%.2` <- NULL

reprovacao_04[c(9:18),1] <- "CIÊNCIAS"
reprovacao_04[c(37:43),1] <- "ENGENHARIA ELÉTRICA"
reprovacao_04[c(59:72),1] <- "LETRAS"
reprovacao_04[c(80:92),1] <- "PEDAGOGIA"

reprovacao_04$Reprovações.1 <- as.numeric(as.character(reprovacao_04$Reprovações.1))
reprovacao_04$Matrículas.1 <- as.numeric(as.character(reprovacao_04$Matrículas.1))
reprovacao_04$Reprovações.2 <- as.numeric(as.character(reprovacao_04$Reprovações.2))
reprovacao_04$Matrículas.2 <- as.numeric(as.character(reprovacao_04$Matrículas.2))

reprovacao_04 <- reprovacao_04 %>% 
  group_by(Curso) %>% 
  summarise(Reprovações.1 = sum(Reprovações.1),
            Matrículas.1 = sum(Matrículas.1),
            Reprovações.2 = sum(Reprovações.2),
            Matrículas.2 = sum(Matrículas.2))

####Recalculando Porcentagens 2004####

porcentagem.total.1 = round(
  (reprovacao_04$Reprovações.1 / reprovacao_04$Matrículas.1) * 100, digits = 1)

reprovacao_04 <- add_column(reprovacao_04, Porcentagem.1 = porcentagem.total.1, .after = 3)

porcentagem.total.2 = round(
  (reprovacao_04$Reprovações.2 / reprovacao_04$Matrículas.2) * 100, digits = 1)

reprovacao_04 <- add_column(reprovacao_04, Porcentagem.2 = porcentagem.total.2, .after = 6)

write_delim(reprovacao_04, "Reprovacao_2004.csv", delim = ";")

####Limpeza dos Dados 2006####

reprovacao_06 <- taxaReprovacaoAnoPorCurso2006

reprovacao_06 <- reprovacao_06[c(-1,-2,-3,-28,-29,-58,-59,-88,-89),]

names(reprovacao_06)[1:7] <- c(
  "Curso", "Reprovações.1", "Matrículas.1", "%.1", "Reprovações.2", "Matrículas.2", "%.2")

reprovacao_06$Curso <- str_sub(reprovacao_06$Curso, start = 12 ) 
reprovacao_06$Curso <- str_sub(reprovacao_06$Curso, end = -1)

reprovacao_06$Curso <- str_replace(reprovacao_06$Curso, "[NDVM]$", "")
reprovacao_06$Curso <- str_replace(reprovacao_06$Curso, "[:blank:]$", "")
reprovacao_06$Curso <- str_replace(reprovacao_06$Curso, "[\\-]$", "")
reprovacao_06$Curso <- str_replace(reprovacao_06$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_06$Curso <- str_replace(reprovacao_06$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_06$Curso <- str_replace(reprovacao_06$Curso, "[:blank:]$", "")
reprovacao_06$Curso <- str_replace(reprovacao_06$Curso, "[\\.]$", "")
reprovacao_06$Curso <- str_replace(reprovacao_06$Curso, "[:blank:]$", "")
reprovacao_06$Curso <- str_replace(reprovacao_06$Curso, "[\\.]$", "")

reprovacao_06 <- arrange(reprovacao_06, Curso)

reprovacao_06$`%.1` <- NULL
reprovacao_06$`%.2` <- NULL

reprovacao_06[c(8:17),1] <- "CIÊNCIAS"
reprovacao_06[c(40:45),1] <- "ENGENHARIA ELÉTRICA"
reprovacao_06[c(63:76),1] <- "LETRAS"
reprovacao_06[c(85:97),1] <- "PEDAGOGIA"

reprovacao_06$Reprovações.1 <- as.numeric(as.character(reprovacao_06$Reprovações.1))
reprovacao_06$Matrículas.1 <- as.numeric(as.character(reprovacao_06$Matrículas.1))
reprovacao_06$Reprovações.2 <- as.numeric(as.character(reprovacao_06$Reprovações.2))
reprovacao_06$Matrículas.2 <- as.numeric(as.character(reprovacao_06$Matrículas.2))

reprovacao_06 <- reprovacao_06 %>% 
  group_by(Curso) %>% 
  summarise(Reprovações.1 = sum(Reprovações.1),
            Matrículas.1 = sum(Matrículas.1),
            Reprovações.2 = sum(Reprovações.2),
            Matrículas.2 = sum(Matrículas.2))

####Recalculando Porcentagens 2006####

porcentagem.total.1 = round(
  (reprovacao_06$Reprovações.1 / reprovacao_06$Matrículas.1) * 100, digits = 1)

reprovacao_06 <- add_column(reprovacao_06, Porcentagem.1 = porcentagem.total.1, .after = 3)

porcentagem.total.2 = round(
  (reprovacao_06$Reprovações.2 / reprovacao_06$Matrículas.2) * 100, digits = 1)

reprovacao_06 <- add_column(reprovacao_06, Porcentagem.2 = porcentagem.total.2, .after = 6)

write_delim(reprovacao_06, "Reprovacao_2006.csv", delim = ";")

####Limpeza dos Dados 2008####

reprovacao_08 <- taxaReprovacaoAnoPorCurso2008

reprovacao_08 <- reprovacao_08[c(-1,-2,-3,-28,-29,-58,-59,-88,-89),]

names(reprovacao_08)[1:7] <- c(
  "Curso", "Reprovações.1", "Matrículas.1", "%.1", "Reprovações.2", "Matrículas.2", "%.2")

reprovacao_08$Curso <- str_sub(reprovacao_08$Curso, start = 12 ) 
reprovacao_08$Curso <- str_sub(reprovacao_08$Curso, end = -1)

reprovacao_08$Curso <- str_replace(reprovacao_08$Curso, "[NDVM]$", "")
reprovacao_08$Curso <- str_replace(reprovacao_08$Curso, "[:blank:]$", "")
reprovacao_08$Curso <- str_replace(reprovacao_08$Curso, "[\\-]$", "")
reprovacao_08$Curso <- str_replace(reprovacao_08$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_08$Curso <- str_replace(reprovacao_08$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_08$Curso <- str_replace(reprovacao_08$Curso, "[:blank:]$", "")
reprovacao_08$Curso <- str_replace(reprovacao_08$Curso, "[\\.]$", "")
reprovacao_08$Curso <- str_replace(reprovacao_08$Curso, "[:blank:]$", "")
reprovacao_08$Curso <- str_replace(reprovacao_08$Curso, "[\\.]$", "")

reprovacao_08 <- arrange(reprovacao_08, Curso)

reprovacao_08$`%.1` <- NULL
reprovacao_08$`%.2` <- NULL

reprovacao_08[c(9:18),1] <- "CIÊNCIAS"
reprovacao_08[c(45:50),1] <- "ENGENHARIA ELÉTRICA"
reprovacao_08[c(70:83),1] <- "LETRAS"
reprovacao_08[c(94:104),1] <- "PEDAGOGIA"

reprovacao_08$Reprovações.1 <- as.numeric(as.character(reprovacao_08$Reprovações.1))
reprovacao_08$Matrículas.1 <- as.numeric(as.character(reprovacao_08$Matrículas.1))
reprovacao_08$Reprovações.2 <- as.numeric(as.character(reprovacao_08$Reprovações.2))
reprovacao_08$Matrículas.2 <- as.numeric(as.character(reprovacao_08$Matrículas.2))

reprovacao_08 <- reprovacao_08 %>% 
  group_by(Curso) %>% 
  summarise(Reprovações.1 = sum(Reprovações.1),
            Matrículas.1 = sum(Matrículas.1),
            Reprovações.2 = sum(Reprovações.2),
            Matrículas.2 = sum(Matrículas.2))

####Recalculando Porcentagens 2008####

porcentagem.total.1 = round(
  (reprovacao_08$Reprovações.1 / reprovacao_08$Matrículas.1) * 100, digits = 1)

reprovacao_08 <- add_column(reprovacao_08, Porcentagem.1 = porcentagem.total.1, .after = 3)

porcentagem.total.2 = round(
  (reprovacao_08$Reprovações.2 / reprovacao_08$Matrículas.2) * 100, digits = 1)

reprovacao_08 <- add_column(reprovacao_08, Porcentagem.2 = porcentagem.total.2, .after = 6)

write_delim(reprovacao_08, "Reprovacao_2008.csv", delim = ";")

####Limpeza dos Dados 2010####

reprovacao_10 <- taxaReprovacaoAnoPorCurso2010

reprovacao_10 <- reprovacao_10[c(-1,-2,-3,-28,-29,-58,-59,-88,-89,-118,-119),]

names(reprovacao_10)[1:7] <- c(
  "Curso", "Reprovações.1", "Matrículas.1", "%.1", "Reprovações.2", "Matrículas.2", "%.2")

reprovacao_10$Curso <- str_sub(reprovacao_10$Curso, start = 12 ) 
reprovacao_10$Curso <- str_sub(reprovacao_10$Curso, end = -1)

reprovacao_10$Curso <- str_replace(reprovacao_10$Curso, "[NDVM]$", "")
reprovacao_10$Curso <- str_replace(reprovacao_10$Curso, "[:blank:]$", "")
reprovacao_10$Curso <- str_replace(reprovacao_10$Curso, "[\\-]$", "")
reprovacao_10$Curso <- str_replace(reprovacao_10$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_10$Curso <- str_replace(reprovacao_10$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_10$Curso <- str_replace(reprovacao_10$Curso, "[:blank:]$", "")
reprovacao_10$Curso <- str_replace(reprovacao_10$Curso, "[\\.]$", "")
reprovacao_10$Curso <- str_replace(reprovacao_10$Curso, "[:blank:]$", "")
reprovacao_10$Curso <- str_replace(reprovacao_10$Curso, "[\\.]$", "")

reprovacao_10$`%.1` <- NULL
reprovacao_10$`%.2` <- NULL

reprovacao_10$Reprovações.1 <- as.numeric(as.character(reprovacao_10$Reprovações.1))
reprovacao_10$Matrículas.1 <- as.numeric(as.character(reprovacao_10$Matrículas.1))
reprovacao_10$Reprovações.2 <- as.numeric(as.character(reprovacao_10$Reprovações.2))
reprovacao_10$Matrículas.2 <- as.numeric(as.character(reprovacao_10$Matrículas.2))

reprovacao_10 <- arrange(reprovacao_10, Curso)

reprovacao_10[c(8:15),1] <- "CIÊNCIAS"
reprovacao_10[c(52:57),1] <- "ENGENHARIA ELÉTRICA"
reprovacao_10[c(84:96),1] <- "LETRAS"

reprovacao_10 <- reprovacao_10 %>% 
  group_by(Curso) %>% 
  summarise(Reprovações.1 = sum(Reprovações.1),
            Matrículas.1 = sum(Matrículas.1),
            Reprovações.2 = sum(Reprovações.2),
            Matrículas.2 = sum(Matrículas.2))

####Recalculando Porcentagens 2010####

porcentagem.total.1 = round(
  (reprovacao_10$Reprovações.1 / reprovacao_10$Matrículas.1) * 100, digits = 1)

reprovacao_10 <- add_column(reprovacao_10, Porcentagem.1 = porcentagem.total.1, .after = 3)

porcentagem.total.2 = round(
  (reprovacao_10$Reprovações.2 / reprovacao_10$Matrículas.2) * 100, digits = 1)

reprovacao_10 <- add_column(reprovacao_10, Porcentagem.2 = porcentagem.total.2, .after = 6)

write_delim(reprovacao_10, "Reprovacao_2010.csv", delim = ";")

####Limpeza dos Dados 2012####

reprovacao_12 <- taxaReprovacaoAnoPorCurso2012

reprovacao_12 <- reprovacao_12[c(-1,-2,-3,-28,-29,-58,-59,-88,-89,-118,-119),]

names(reprovacao_12)[1:7] <- c(
  "Curso", "Reprovações.1", "Matrículas.1", "%.1", "Reprovações.2", "Matrículas.2", "%.2")

reprovacao_12$Curso <- str_sub(reprovacao_12$Curso, start = 12 ) 
reprovacao_12$Curso <- str_sub(reprovacao_12$Curso, end = -1)

reprovacao_12$Curso <- str_replace(reprovacao_12$Curso, "[NDVM]$", "")
reprovacao_12$Curso <- str_replace(reprovacao_12$Curso, "[:blank:]$", "")
reprovacao_12$Curso <- str_replace(reprovacao_12$Curso, "[\\-]$", "")
reprovacao_12$Curso <- str_replace(reprovacao_12$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_12$Curso <- str_replace(reprovacao_12$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_12$Curso <- str_replace(reprovacao_12$Curso, "[:blank:]$", "")
reprovacao_12$Curso <- str_replace(reprovacao_12$Curso, "[\\.]$", "")
reprovacao_12$Curso <- str_replace(reprovacao_12$Curso, "[:blank:]$", "")
reprovacao_12$Curso <- str_replace(reprovacao_12$Curso, "[\\.]$", "")

reprovacao_12$`%.1` <- NULL
reprovacao_12$`%.2` <- NULL

reprovacao_12$Reprovações.1 <- as.numeric(as.character(reprovacao_12$Reprovações.1))
reprovacao_12$Matrículas.1 <- as.numeric(as.character(reprovacao_12$Matrículas.1))
reprovacao_12$Reprovações.2 <- as.numeric(as.character(reprovacao_12$Reprovações.2))
reprovacao_12$Matrículas.2 <- as.numeric(as.character(reprovacao_12$Matrículas.2))

reprovacao_12 <- arrange(reprovacao_12, Curso)

reprovacao_12[c(8:13),1] <- "CIÊNCIAS"
reprovacao_12[c(48:53),1] <- "ENGENHARIA ELÉTRICA"
reprovacao_12[c(77:93),1] <- "LETRAS"

reprovacao_12 <- reprovacao_12 %>% 
  group_by(Curso) %>% 
  summarise(Reprovações.1 = sum(Reprovações.1),
            Matrículas.1 = sum(Matrículas.1),
            Reprovações.2 = sum(Reprovações.2),
            Matrículas.2 = sum(Matrículas.2))

####Recalculando Porcentagens 2012####

porcentagem.total.1 = round(
  (reprovacao_12$Reprovações.1 / reprovacao_12$Matrículas.1) * 100, digits = 1)

reprovacao_12 <- add_column(reprovacao_12, Porcentagem.1 = porcentagem.total.1, .after = 3)

porcentagem.total.2 = round(
  (reprovacao_12$Reprovações.2 / reprovacao_12$Matrículas.2) * 100, digits = 1)

reprovacao_12 <- add_column(reprovacao_12, Porcentagem.2 = porcentagem.total.2, .after = 6)

write_delim(reprovacao_12, "Reprovacao_2012.csv", delim = ";")

####Limpeza dos Dados 2014####

reprovacao_14 <- taxaReprovacaoAnoPorCurso2014

reprovacao_14 <- reprovacao_14[c(-1,-2,-3,-28,-29,-58,-59,-88,-89,-118,-119),]

names(reprovacao_14)[1:7] <- c(
  "Curso", "Reprovações.1", "Matrículas.1", "%.1", "Reprovações.2", "Matrículas.2", "%.2")

reprovacao_14$Curso <- str_sub(reprovacao_14$Curso, start = 12 ) 
reprovacao_14$Curso <- str_sub(reprovacao_14$Curso, end = -1)

reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[NDVM]$", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[:blank:]$", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[\\-]$", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[:blank:]$", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[\\.]$", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[:blank:]$", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[\\.]$", "")

reprovacao_14$`%.1` <- NULL
reprovacao_14$`%.2` <- NULL

reprovacao_14$Reprovações.1 <- as.numeric(as.character(reprovacao_14$Reprovações.1))
reprovacao_14$Matrículas.1 <- as.numeric(as.character(reprovacao_14$Matrículas.1))
reprovacao_14$Reprovações.2 <- as.numeric(as.character(reprovacao_14$Reprovações.2))
reprovacao_14$Matrículas.2 <- as.numeric(as.character(reprovacao_14$Matrículas.2))

reprovacao_14 <- arrange(reprovacao_14, Curso)

reprovacao_14[c(8:13),1] <- "CIÊNCIAS"
reprovacao_14[c(49:53),1] <- "ENGENHARIA ELÉTRICA"
reprovacao_14[c(77:93),1] <- "LETRAS"

reprovacao_14 <- reprovacao_14 %>% 
  group_by(Curso) %>% 
  summarise(Reprovações.1 = sum(Reprovações.1),
            Matrículas.1 = sum(Matrículas.1),
            Reprovações.2 = sum(Reprovações.2),
            Matrículas.2 = sum(Matrículas.2))

####Recalculando Porcentagens 2014####

porcentagem.total.1 = round(
  (reprovacao_14$Reprovações.1 / reprovacao_14$Matrículas.1) * 100, digits = 1)

reprovacao_14 <- add_column(reprovacao_14, Porcentagem.1 = porcentagem.total.1, .after = 3)

porcentagem.total.2 = round(
  (reprovacao_14$Reprovações.2 / reprovacao_14$Matrículas.2) * 100, digits = 1)

reprovacao_14 <- add_column(reprovacao_14, Porcentagem.2 = porcentagem.total.2, .after = 6)

write_delim(reprovacao_14, "Reprovacao_2014.csv", delim = ";")

####Limpeza dos Dados 2016####

reprovacao_16 <- taxaReprovacaoAnoPorCurso2016

reprovacao_16 <- reprovacao_16[c(-1,-2,-3,-28,-29,-58,-59,-88,-89),]

names(reprovacao_16)[1:7] <- c(
  "Curso", "Reprovações.1", "Matrículas.1", "%.1", "Reprovações.2", "Matrículas.2", "%.2")

reprovacao_16$Curso <- str_sub(reprovacao_16$Curso, start = 12 ) 
reprovacao_16$Curso <- str_sub(reprovacao_16$Curso, end = -1)

reprovacao_16$Curso <- str_replace(reprovacao_16$Curso, "[NDVM]$", "")
reprovacao_16$Curso <- str_replace(reprovacao_16$Curso, "[:blank:]$", "")
reprovacao_16$Curso <- str_replace(reprovacao_16$Curso, "[\\-]$", "")
reprovacao_16$Curso <- str_replace(reprovacao_16$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_16$Curso <- str_replace(reprovacao_16$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_16$Curso <- str_replace(reprovacao_16$Curso, "[:blank:]$", "")
reprovacao_16$Curso <- str_replace(reprovacao_16$Curso, "[\\.]$", "")
reprovacao_16$Curso <- str_replace(reprovacao_16$Curso, "[:blank:]$", "")
reprovacao_16$Curso <- str_replace(reprovacao_16$Curso, "[\\.]$", "")

reprovacao_16$`%.1` <- NULL
reprovacao_16$`%.2` <- NULL

reprovacao_16$Reprovações.1 <- as.numeric(as.character(reprovacao_16$Reprovações.1))
reprovacao_16$Matrículas.1 <- as.numeric(as.character(reprovacao_16$Matrículas.1))
reprovacao_16$Reprovações.2 <- as.numeric(as.character(reprovacao_16$Reprovações.2))
reprovacao_16$Matrículas.2 <- as.numeric(as.character(reprovacao_16$Matrículas.2))

reprovacao_16 <- arrange(reprovacao_16, Curso)

reprovacao_16[c(66:78),1] <- "LETRAS"

reprovacao_16 <- reprovacao_16 %>% 
  group_by(Curso) %>% 
  summarise(Reprovações.1 = sum(Reprovações.1),
            Matrículas.1 = sum(Matrículas.1),
            Reprovações.2 = sum(Reprovações.2),
            Matrículas.2 = sum(Matrículas.2))

####Recalculando Porcentagens 2016####

porcentagem.total.1 = round(
  (reprovacao_16$Reprovações.1 / reprovacao_16$Matrículas.1) * 100, digits = 1)

reprovacao_16 <- add_column(reprovacao_16, Porcentagem.1 = porcentagem.total.1, .after = 3)

porcentagem.total.2 = round(
  (reprovacao_16$Reprovações.2 / reprovacao_16$Matrículas.2) * 100, digits = 1)

reprovacao_16 <- add_column(reprovacao_16, Porcentagem.2 = porcentagem.total.2, .after = 6)

write_delim(reprovacao_16, "Reprovacao_2016.csv", delim = ";")

####Limpeza dos Dados 2018####

reprovacao_18 <- taxaReprovacaoAnoPorCurso2018

reprovacao_18 <- reprovacao_18[c(-1,-2,-3,-28,-29,-58,-59,-88,-89),]

names(reprovacao_18)[1:7] <- c(
  "Curso", "Reprovações.1", "Matrículas.1", "%.1", "Reprovações.2", "Matrículas.2", "%.2")

reprovacao_18$Curso <- str_sub(reprovacao_18$Curso, start = 12 ) 
reprovacao_18$Curso <- str_sub(reprovacao_18$Curso, end = -1)

reprovacao_18$Curso <- str_replace(reprovacao_18$Curso, "[NDVM]$", "")
reprovacao_18$Curso <- str_replace(reprovacao_18$Curso, "[:blank:]$", "")
reprovacao_18$Curso <- str_replace(reprovacao_18$Curso, "[\\-]$", "")
reprovacao_18$Curso <- str_replace(reprovacao_18$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_18$Curso <- str_replace(reprovacao_18$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_18$Curso <- str_replace(reprovacao_18$Curso, "[:blank:]$", "")
reprovacao_18$Curso <- str_replace(reprovacao_18$Curso, "[\\.]$", "")
reprovacao_18$Curso <- str_replace(reprovacao_18$Curso, "[:blank:]$", "")
reprovacao_18$Curso <- str_replace(reprovacao_18$Curso, "[\\.]$", "")

reprovacao_18$`%.1` <- NULL
reprovacao_18$`%.2` <- NULL

reprovacao_18$Reprovações.1 <- as.numeric(as.character(reprovacao_18$Reprovações.1))
reprovacao_18$Matrículas.1 <- as.numeric(as.character(reprovacao_18$Matrículas.1))
reprovacao_18$Reprovações.2 <- as.numeric(as.character(reprovacao_18$Reprovações.2))
reprovacao_18$Matrículas.2 <- as.numeric(as.character(reprovacao_18$Matrículas.2))

reprovacao_18 <- arrange(reprovacao_18, Curso)

reprovacao_18[c(63:71),1] <- "LETRAS"

reprovacao_18 <- reprovacao_18 %>% 
  group_by(Curso) %>% 
  summarise(Reprovações.1 = sum(Reprovações.1),
            Matrículas.1 = sum(Matrículas.1),
            Reprovações.2 = sum(Reprovações.2),
            Matrículas.2 = sum(Matrículas.2))

####Recalculando Porcentagens 2018####

porcentagem.total.1 = round(
  (reprovacao_18$Reprovações.1 / reprovacao_18$Matrículas.1) * 100, digits = 1)

reprovacao_18 <- add_column(reprovacao_18, Porcentagem.1 = porcentagem.total.1, .after = 3)

porcentagem.total.2 = round(
  (reprovacao_18$Reprovações.2 / reprovacao_18$Matrículas.2) * 100, digits = 1)

reprovacao_18 <- add_column(reprovacao_18, Porcentagem.2 = porcentagem.total.2, .after = 6)

write_delim(reprovacao_18, "Reprovacao_2018.csv", delim = ";")


