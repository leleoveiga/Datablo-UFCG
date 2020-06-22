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