library(stringr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(purrr)
library(readr)
####Limpeza dos Dados 2003####

names(taxaReprovacaoAnoPorCurso2003)[1:7] <- c(
  "Curso", "Reprovaçoes.1", "Matriculas.1", "%.1", "Reprovaçoes.2", "Matriculas.2", "%.2")

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

reprovacao_03$Reprovaçoes.1 <- as.numeric(as.character(reprovacao_03$Reprovaçoes.1))
reprovacao_03$Matriculas.1 <- as.numeric(as.character(reprovacao_03$Matriculas.1))
reprovacao_03$Reprovaçoes.2 <- as.numeric(as.character(reprovacao_03$Reprovaçoes.2))
reprovacao_03$Matriculas.2 <- as.numeric(as.character(reprovacao_03$Matriculas.2))

reprovacao_03 <- reprovacao_03 %>% 
  group_by(Curso) %>% 
  summarise(Reprovaçoes.1 = sum(Reprovaçoes.1),
            Matriculas.1 = sum(Matriculas.1),
            Reprovaçoes.2 = sum(Reprovaçoes.2),
            Matriculas.2 = sum(Matriculas.2))

write_delim(reprovacao_03, "Reprovação 2003.csv", delim = ";")

####Limpeza dos Dados 2004####




