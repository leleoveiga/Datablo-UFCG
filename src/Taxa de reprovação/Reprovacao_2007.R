library(stringr)
library(dbplyr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(purrr)
library(tibble)

dfPadrao <- read.csv(file = "~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/Taxas de Reprovação/taxaReprovacaoAnoPorCurso2007.csv")
dfEditado <- read.csv(file = "~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/Taxas de Reprovação/taxaReprovacaoAnoPorCurso2007.csv")

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

####Renomeando os cursos pra depois unificar####
dfEditado$Curso[1:6] <- str_sub(dfEditado$Curso[1:6], end = 13) #administração
dfEditado$Curso[10:19] <- str_sub(dfEditado$Curso[10:19], end = 8) #ciências geral
dfEditado$Curso[28:31] <- str_sub(dfEditado$Curso[28:31], end = 16) #ciências sociais
dfEditado$Curso[47:51] <- str_sub(dfEditado$Curso[47:51], end = 19) #eng. elétrica
dfEditado$Curso[63:70] <- str_sub(dfEditado$Curso[63:70], end = 8) #historia
dfEditado$Curso[72:81] <- str_sub(dfEditado$Curso[72:81], end = 6) #letras
dfEditado$Curso[85:90] <- str_sub(dfEditado$Curso[85:90], end = 10) #matematica
dfEditado$Curso[95:107] <- str_sub(dfEditado$Curso[95:107], end = 9) #pedagogia

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

write.csv(dfAgrupado, file = "~/Documentos/Analise-de-Dados-da-UFCG/Dados Processados/Taxas de reprovação/Reprovacao_2007.csv")
