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
