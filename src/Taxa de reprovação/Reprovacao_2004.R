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