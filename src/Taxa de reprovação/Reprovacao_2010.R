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