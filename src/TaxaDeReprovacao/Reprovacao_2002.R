library(stringr)
library(dbplyr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(purrr)
library(tibble)
library(readr)

dfPadrao <- read.csv(file = "~/Analise-de-Dados-da-UFCG/Dados Crus/TaxaDeReprovacao/taxaReprovacaoAnoPorCurso2002.csv", encoding = "UTF-8")
dfEditado <- read.csv(file = "~/Analise-de-Dados-da-UFCG/Dados Crus/TaxaDeReprovacao/taxaReprovacaoAnoPorCurso2002.csv", encoding = "UTF-8")

####Limpeza e organização básica do dataframe####
names(dfEditado)[1:7] <- c("Curso", "Reprovações.1", "Matrículas.1", "Porcentagem.1"
                               ,"Reprovações.2", "Matrículas.2", "Porcentagem.2")
dfEditado$Porcentagem.1 <- NULL
dfEditado$Porcentagem.2 <- NULL
dfEditado <- dfEditado[c(-1, -2, -3, -28, -29, -58, -59, -88, -89),]
dfEditado$Curso <- str_sub(dfEditado$Curso, 12)
dfEditado <- arrange(dfEditado, `Curso`)

####Convertendo colunas de factor pra numérico####
dfEditado$Reprovações.1 <- as.numeric(as.character(dfEditado$Reprovações.1))
dfEditado$Matrículas.1 <- as.numeric(as.character(dfEditado$Matrículas.1))
dfEditado$Reprovações.2 <- as.numeric(as.character(dfEditado$Reprovações.2))
dfEditado$Matrículas.2 <- as.numeric(as.character(dfEditado$Matrículas.2))

####Retirando os turnos dos cursos####
dfEditado$Curso <- str_replace(dfEditado$Curso, "[MNDV]$", "")
dfEditado$Curso <- str_trim(dfEditado$Curso)
dfEditado$Curso <- str_replace(dfEditado$Curso, "[\\-]$","")
dfEditado$Curso <- str_trim(dfEditado$Curso)
dfEditado$Curso <- str_replace(dfEditado$Curso, "[\\(]+[:alpha:]+[\\)]", "")
dfEditado$Curso <- str_trim(dfEditado$Curso)

####Renomeando os cursos pra depois unificar####
dfEditado$Curso[1:6] <- str_sub(dfEditado$Curso[1:6], end = 13)
dfEditado$Curso[9:18] <- str_sub(dfEditado$Curso[9:18], end = 8)
dfEditado$Curso[23:26] <- str_sub(dfEditado$Curso[23:26], end = 16)
dfEditado$Curso[36:40] <- str_sub(dfEditado$Curso[36:40], end = 19)
dfEditado$Curso[44] <- str_sub(dfEditado$Curso[44], end = 6)
dfEditado$Curso[49:54] <- str_sub(dfEditado$Curso[49:54], end = 8)
dfEditado$Curso[56:64] <- str_sub(dfEditado$Curso[56:64], end = 6)
dfEditado$Curso[68:71] <- str_sub(dfEditado$Curso[68:71], end = 10)
dfEditado$Curso[75:87] <- str_sub(dfEditado$Curso[75:87], end = 9)

####Juntar os dados por agrupamento dos cursos####
dfAgrupado <- dfEditado %>%
  group_by(Curso) %>% 
  summarise(Reprovações.1 = sum(Reprovações.1), Matrículas.1 = sum(Matrículas.1)
            , Reprovações.2 = sum(Reprovações.2), Matrículas.2 = sum(Matrículas.2))
dfAgrupado <- as.data.frame(dfAgrupado)

####Criando a coluna de porcentagem baseada no total####
porcentagem.total.1 = round((dfAgrupado$Reprovações.1 / dfAgrupado$Matrículas.1) * 100, digits = 1)
dfAgrupado <- add_column(dfAgrupado, Porcentagem.1 = porcentagem.total.1, .after = 3)
porcentagem.total.2 = round((dfAgrupado$Reprovações.2 / dfAgrupado$Matrículas.2) * 100, digits = 1)
dfAgrupado <- add_column(dfAgrupado, Porcentagem.2 = porcentagem.total.2, .after = 6)

dfAgrupado[is.na(dfAgrupado)] <- 0.0

write_delim(dfAgrupado, "~/Analise-de-Dados-da-UFCG/Dados Processados/TaxaDeReprovacao/Reprovacao_2002.csv", delim = ";")


