library(stringr)
library(dbplyr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(purrr)
library(tibble)
library(readr)

dfPadrao <- read.csv(file = "~/Analise-de-Dados-da-UFCG/Dados Crus/Taxas de Reprovação/taxaReprovacaoAnoPorCurso2011.csv", encoding = "UTF-8")
dfEditado <- read.csv(file = "~/Analise-de-Dados-da-UFCG/Dados Crus/Taxas de Reprovação/taxaReprovacaoAnoPorCurso2011.csv", encoding = "UTF-8")

####Limpeza e organização básica do dataframe####
names(dfEditado)[1:7] <- c("Curso", "Reprovações.1", "Matrículas.1", "Porcentagem.1"
                           ,"Reprovações.2", "Matrículas.2", "Porcentagem.2")
dfEditado$Porcentagem.1 <- NULL
dfEditado$Porcentagem.2 <- NULL
dfEditado <- dfEditado[c(-1, -2, -3, -28, -29, -58, -59, -88, -89, -118, -119),]
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
dfEditado$Curso[8:15] <- str_sub(dfEditado$Curso[8:15], end = 8) #ciências geral
dfEditado$Curso[26:30] <- str_sub(dfEditado$Curso[26:30], end = 16) #ciências sociais
dfEditado$Curso[54:58] <- str_sub(dfEditado$Curso[54:58], end = 19) #eng. elétrica
dfEditado$Curso[64:65] <- str_sub(dfEditado$Curso[64:65], end = 9) #filosofia
dfEditado$Curso[66:70] <- str_sub(dfEditado$Curso[66:70], end = 6) #física
dfEditado$Curso[71:74] <- str_sub(dfEditado$Curso[71:74], end = 9) #geografia
dfEditado$Curso[77:83] <- str_sub(dfEditado$Curso[77:83], end = 8) #historia
dfEditado$Curso[86:105] <- str_sub(dfEditado$Curso[86:105], end = 6) #letras
dfEditado$Curso[107:112] <- str_sub(dfEditado$Curso[107:112], end = 10) #matematica
dfEditado$Curso[118:119] <- str_sub(dfEditado$Curso[118:119], end = 6) #musica
dfEditado$Curso[123:126] <- str_sub(dfEditado$Curso[123:126], end = 9) #pedagogia

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

write_delim(dfAgrupado, "~/Analise-de-Dados-da-UFCG/Dados Processados/Taxas de reprovação/Reprovação_2011.csv", delim = ";")

