library(stringr)
library(dbplyr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(purrr)
#PROBLEMAS: Coluna Turno com alguns valores errados "A" e ")"
#           Compilar mesmos cursos em uma linha única
#OBJ: Gráfico de barras, mostrando a quantidade de vagas ociosas por curso

vagasOciosasPorCurso <- read.csv(file = 'vagasOciosasPorCurso.csv')
View(vagasOciosasPorCurso)
str(vagasOciosasPorCurso)

#Correção dos Títulos das Colunas:
names(vagasOciosasPorCurso)[1:10] <- c("Código","Curso","Campus","Alunos Ativos","Vaga 1 Sem","Vaga 2 Sem","Área","Duração Padrão","Fator de Retenção","Vagas Ociosas")

#Criando DF para manipulação, deixando o original como Backup
data.edit1 <- vagasOciosasPorCurso

#Excluindo colunas inúteis e Convertendo strings para numéricos
data.edit1$Código <- NULL 
data.edit1$`Duração Padrão` <- NULL 
data.edit1$Área <- NULL 
data.edit1$`Fator de Retenção` <- NULL 
data.edit1$`Alunos Ativos` <- as.numeric(levels(data.edit1$`Alunos Ativos`))[data.edit1$`Alunos Ativos`]
data.edit1$`Vaga 1 Sem` <- as.numeric(data.edit1$`Vaga 1 Sem`) 
data.edit1$`Vaga 2 Sem` <- as.numeric(data.edit1$`Vaga 2 Sem`) 
data.edit1$`Vagas Ociosas` <- as.numeric(data.edit1$`Vagas Ociosas`)

#Fundindo Linhas:
data.edit2 <- data.edit1[c(-1,-47,-95,-2),] #excluindo linhas vazias
data.edit2$Campus <- as.factor(data.edit2$Campus)
separate(data.edit2, Curso, sep = "-", into = c("Curso", "Turno")) #não funciona, pesquisar dps
class(data.edit2$Curso)

data.test <- data.edit2

# USAR O STRINGR para manipular as strings de curso e uniformizá-las. em seguida 
# organizar com tidyr e diplyr

data.test$Turno <- str_extract(data.test$Curso, "\\- [:upper:]") #extrair de turnos e salvar em cursos "- (letramaius)"
data.test$Turno <- str_sub(data.test$Curso, start = -1) #Pegar apenas o último caractere
data.test$Turno <- as.factor(data.test$Turno)
data.test$Curso <- as.character(data.test$Curso)

#Tratando Strings:
levels(data.test$Turno)

curso <- data.test$Curso #criando vetores com as colunas

curso <- str_replace_all(curso, "[-]", "")
curso <- str_replace(curso, "[M]$", "")
curso <- str_replace(curso, "[N]$", "")
curso <- str_replace(curso, "[D]$", "")
curso <- str_replace(curso, "[V]$", "")

data.test$Curso <- curso #substitui a col cursos pelos valores limpos
#data.test$Curso <- as.character(data.test$Curso) #foi necessário transformar em character antes de passar para factor
data.test$Curso <- as.factor(data.test$Curso)

#agrupando linhas de mesmo nome
#primeiro dividir em dataframes menores e então juntá-los
data.test2 <- data.test

total_vagas1 <- data.test2 %>% #Criando primeiro fragmento (total de vagas 1)
  group_by(Curso) %>% 
  summarise(Total_Vagas1 = sum(`Vaga 1 Sem`)) #Digitar sum(data.test2$'Vaga 1 Sem)
total_vagas1 <- as.data.frame(total_vagas1)

total_vagas2 <- data.test2 %>% #criando segundo fragmento (total vagas 2)
  group_by(Curso) %>% 
  summarise(Total_Vagas2 = sum(`Vaga 2 Sem`)) 
total_vagas2 <- as.data.frame(total_vagas2)

alunos_ativos <- data.test2 %>% #criando 3º fragmento (Alunos Ativos)
  group_by(Curso) %>% 
  summarise(Alunos_Ativos = sum(`Alunos Ativos`)) 
alunos_ativos <- as.data.frame(alunos_ativos)

vagas_ociosas <- data.test2 %>% #Criando 4º fragmento (Vagas Ociosas)
  group_by(Curso) %>% 
  summarise(Vagas_Ociosas = sum(`Vagas Ociosas`)) 
vagas_ociosas <- as.data.frame(vagas_ociosas)

#Finalmente, juntando os fragmentos na construção da tabela final
Final <- inner_join(total_vagas1, total_vagas2, by = "Curso")
Final <- inner_join(Final, vagas_ociosas, by = "Curso")  
Final <- inner_join(Final, alunos_ativos, by = "Curso")  

