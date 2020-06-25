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

reprovacao_18[is.na(reprovacao_18)] <- 0.0

write_delim(reprovacao_18, "Reprovacao_2018.csv", delim = ";")


