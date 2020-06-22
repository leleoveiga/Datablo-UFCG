####Limpeza dos Dados 2014####

reprovacao_14 <- taxaReprovacaoAnoPorCurso2014

reprovacao_14 <- reprovacao_14[c(-1,-2,-3,-28,-29,-58,-59,-88,-89,-118,-119),]

names(reprovacao_14)[1:7] <- c(
  "Curso", "Reprovações.1", "Matrículas.1", "%.1", "Reprovações.2", "Matrículas.2", "%.2")

reprovacao_14$Curso <- str_sub(reprovacao_14$Curso, start = 12 ) 
reprovacao_14$Curso <- str_sub(reprovacao_14$Curso, end = -1)

reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[NDVM]$", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[:blank:]$", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[\\-]$", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[\\(]+[:alpha:]+[\\)]", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[:blank:]$", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[\\.]$", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[:blank:]$", "")
reprovacao_14$Curso <- str_replace(reprovacao_14$Curso, "[\\.]$", "")

reprovacao_14$`%.1` <- NULL
reprovacao_14$`%.2` <- NULL

reprovacao_14$Reprovações.1 <- as.numeric(as.character(reprovacao_14$Reprovações.1))
reprovacao_14$Matrículas.1 <- as.numeric(as.character(reprovacao_14$Matrículas.1))
reprovacao_14$Reprovações.2 <- as.numeric(as.character(reprovacao_14$Reprovações.2))
reprovacao_14$Matrículas.2 <- as.numeric(as.character(reprovacao_14$Matrículas.2))

reprovacao_14 <- arrange(reprovacao_14, Curso)

reprovacao_14[c(8:13),1] <- "CIÊNCIAS"
reprovacao_14[c(49:53),1] <- "ENGENHARIA ELÉTRICA"
reprovacao_14[c(77:93),1] <- "LETRAS"

reprovacao_14 <- reprovacao_14 %>% 
  group_by(Curso) %>% 
  summarise(Reprovações.1 = sum(Reprovações.1),
            Matrículas.1 = sum(Matrículas.1),
            Reprovações.2 = sum(Reprovações.2),
            Matrículas.2 = sum(Matrículas.2))

####Recalculando Porcentagens 2014####

porcentagem.total.1 = round(
  (reprovacao_14$Reprovações.1 / reprovacao_14$Matrículas.1) * 100, digits = 1)

reprovacao_14 <- add_column(reprovacao_14, Porcentagem.1 = porcentagem.total.1, .after = 3)

porcentagem.total.2 = round(
  (reprovacao_14$Reprovações.2 / reprovacao_14$Matrículas.2) * 100, digits = 1)

reprovacao_14 <- add_column(reprovacao_14, Porcentagem.2 = porcentagem.total.2, .after = 6)

write_delim(reprovacao_14, "Reprovacao_2014.csv", delim = ";")
