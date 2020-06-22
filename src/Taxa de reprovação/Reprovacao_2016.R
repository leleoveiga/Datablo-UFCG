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