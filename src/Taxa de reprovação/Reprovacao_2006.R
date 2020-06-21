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
