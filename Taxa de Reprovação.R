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





