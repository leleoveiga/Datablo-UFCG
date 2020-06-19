library(stringr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(purrr)
library(readr)
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

reprovacao_04 <- reprovacao_04[c(-1,-2,-3,-28,-29,-58,-59,-88,-89),]

names(reprovacao_04)[1:7] <- c(
  "Curso", "Reprovações.1", "Matrículas.1", "%.1", "Reprovações.2", "Matrículas.2", "%.2")

reprovacao_04$Curso <- str_sub(reprovacao_04$Curso, start = 12 ) 
reprovacao_04$Curso <- str_sub(reprovacao_04$Curso, end = -1)







