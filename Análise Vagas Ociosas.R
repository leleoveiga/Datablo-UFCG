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
data.edit1$`Vaga 1 Sem` <- as.numeric(levels(data.edit1$`Vaga 1 Sem`))[data.edit1$`Vaga 1 Sem`] 
data.edit1$`Vaga 2 Sem` <- as.numeric(levels(data.edit1$`Vaga 2 Sem`))[data.edit1$`Vaga 2 Sem`] 
data.edit1$`Vagas Ociosas` <- as.numeric(levels(data.edit1$`Vagas Ociosas`))[data.edit1$`Vagas Ociosas`] 

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
###################
#Criando agrupamentos por curso
total_vagas <- data.test2 %>% #Criando primeiro fragmento (total de vagas 1)
  group_by(Curso) %>% 
  summarise(Total_Vagas = sum(`Vaga 1 Sem`, `Vaga 2 Sem`)) #Digitar sum(data.test2$'Vaga 1 Sem)
total_vagas <- as.data.frame(total_vagas)

#total_vagas2 <- data.test2 %>% #criando segundo fragmento (total vagas 2)
#  group_by(Curso) %>% 
#  summarise(Total_Vagas2 = sum(`Vaga 2 Sem`)) 
#total_vagas2 <- as.data.frame(total_vagas2)

alunos_ativos <- data.test2 %>% #criando 3º fragmento (Alunos Ativos)
  group_by(Curso) %>% 
  summarise(Alunos_Ativos = sum(`Alunos Ativos`)) 
alunos_ativos <- as.data.frame(alunos_ativos)

vagas_ociosas <- data.test2 %>% #Criando 4º fragmento (Vagas Ociosas)
  group_by(Curso) %>% 
  summarise(Vagas_Ociosas = sum(`Vagas Ociosas`)) 
vagas_ociosas <- as.data.frame(vagas_ociosas)

#Finalmente, juntando os fragmentos na construção da tabela final
Final <- inner_join(total_vagas, vagas_ociosas , by = "Curso")
#Final <- inner_join(Final, vagas_ociosas, by = "Curso")  
Final <- inner_join(Final, alunos_ativos, by = "Curso")  

#Plotando Gráficos FINAL:
Curso <- Final$Curso
Curso <- as.character(Curso)
"Alunos Ativos" <- Final$Alunos_Ativos
"Vagas Ociosas" <- Final$Vagas_Ociosas
"Vagas Totais" <- "Alunos Ativos" + "Vagas Ociosas"

names(Final)[2:5] <- c("Vagas 1º Semestre","Vagas 2º Semestre","Vagas Ociosas","Alunos Ativos")

#Agregado <- aggregate(`Alunos Ativos` ~ Curso + `Vagas Ociosas`, data = Final, FUN = sum)
#ggplot(Agregado, aes(x = `Alunos Ativos`, y = Curso, fill = factor(`Vagas Ociosas`))) +
#  geom_col(position = "stack")
######################
ggplot(data = Final,
       mapping = aes(x = `Alunos Ativos`,
                     y = `Vagas Ociosas`,
                     colour = Curso,)) +
  geom_point()
######################
ggplot(data = Final,
       mapping = aes(x = `Total_Vagas`,
                     y = `Vagas_Ociosas`,
                     size = `Alunos_Ativos`,
                     colour = Curso)) +
  scale_size_continuous(range = c(1,15)) +
  xlab("Vagas de Ingressantes(1º e 2º Semestre)") +
  ylab("Vagas Ociosas") +
  geom_point()
########################
ggplot(data = Final,
       mapping = aes(x = `Total_Vagas`,
                     y = reorder(Curso, -`Total_Vagas`))) +
  geom_col() +
  xlab("Vagas") +
  ylab("Curso") +
  ggtitle("Vagas Disponíveis Anualmente Para Ingressantes por Curso - UFCG")
##########################
ggplot(data = Final,
       mapping = aes(x = `Alunos_Ativos`,
                     y = reorder(Curso, -`Alunos_Ativos`))) +
  geom_col() +
  xlab("Alunos Ativos") +
  ylab("Curso") +
  ggtitle("Alunos Ativos por Curso - UFCG")
###########################
ggplot(data = Final,
       mapping = aes(x = `Vagas_Ociosas`,
                     y = reorder(Curso, -`Vagas_Ociosas`))) +
  geom_col() +
  xlab("Vagas Ociosas") +
  ylab("Curso") +
  ggtitle("Vagas Ociosas por Curso - UFCG")
#Criando agrupamentos por Turno
Turnos <- data.test2
Turnos$Turno
Turnos[76,7] <- "D"
Turnos[79:80,7] <- "I"
Turnos[41,7] <- "I"

total_vagas <- Turnos %>% 
  group_by(Turno) %>% 
  summarise(`Vagas Totais` = sum(`Vaga 1 Sem`, `Vaga 2 Sem`))
total_vagas <- as.data.frame(total_vagas)

#total_vagas2 <- Turnos %>% 
#  group_by(Turno) %>% 
#  summarise(`Vagas 2º Sem` = sum(`Vaga 2 Sem`))
#total_vagas2 <- as.data.frame(total_vagas2)

alunos_ativos <- Turnos %>% 
  group_by(Turno) %>% 
  summarise(`Alunos Ativos` = sum(`Alunos Ativos`))
alunos_ativos <- as.data.frame(alunos_ativos)

vagas_ociosas <- Turnos %>% 
  group_by(Turno) %>% 
  summarise(`Vagas Ociosas` = sum(`Vagas Ociosas`))
vagas_ociosas <- as.data.frame(vagas_ociosas)

#Juntando fragmentos criados
Turnos2 <- inner_join(total_vagas, alunos_ativos, by = "Turno")
Turnos2 <- inner_join(Turnos2, vagas_ociosas, by = "Turno")

#Renomeando Turnos
Turnos2[1:5,1] <- c("Diurno", "Integral", "Matutino", "Noturno", "Vespertino")

#Plotando gráficos Turnos2
ggplot(data = Turnos2,
       mapping = aes(x = reorder(Turno, -`Alunos Ativos`),
                     y = `Alunos Ativos`)) +
  xlab("Turnos") +
  ylab("Alunos Ativos") +
  geom_col(fill = "darkblue") +
  ggtitle("Alunos Ativos por Turnos - UFCG")
###########
ggplot(data = Turnos2,
       mapping = aes(x = reorder(Turno, -`Vagas 1º Sem`),
                     y = `Vagas 1º Sem`)) +
  xlab("Turnos") +
  ylab("Vagas 1º Semestre") +
  geom_col(fill = "darkblue") +
  ggtitle("Vagas Para Ingressantes 1º Semestre por Turno - UFCG")
################
ggplot(data = Turnos2,
       mapping = aes(x = reorder(Turno, -`Vagas 2º Sem`),
                     y = `Vagas 2º Sem`)) +
  xlab("Turnos") +
  ylab("Vagas 2º Semestre") +
  geom_col(fill = "darkblue") +
  ggtitle("Vagas Para Ingressantes 2º Semestre por Turno - UFCG")
#############
ggplot(data = Turnos2,
       mapping = aes(x = reorder(Turno, -`Vagas Ociosas`),
                     y = `Vagas Ociosas`)) +
  xlab("Turnos") + 
  ylab("Vagas Ociosas") +
  geom_col(fill = "darkblue") +
  ggtitle("Vagas Ociosas por Turno - UFCG")
###############
ggplot(data = Turnos2,
       mapping = aes(x = `Vagas Totais`,
                     y = `Vagas Ociosas`,
                     size = `Alunos Ativos`,
                     colour = Turno)) +
  xlab("Vagas de Ingressantes (1º e 2º Semestre)") +
  ylab("Vagas Ociosas") +
  ggtitle("Vagas Totais Para Ingressantes x Vagas Ociosas x Alunos Ativos/Turno") +
  scale_size_continuous(range = c(1,15)) +
  geom_point()

#Criando agrupamentos por campus
Campus <- data.test2

total_vagas <- Campus %>% 
  group_by(Campus) %>% 
  summarise(`Vagas Totais` = sum(`Vaga 1 Sem`, `Vaga 2 Sem`))
total_vagas <- as.data.frame(total_vagas)

#total_vagas2 <- Campus %>%     #retrabalhado para plots de dispersão
#  group_by(Campus) %>% 
#  summarise(`Vagas 2º Sem` = sum(`Vaga 2 Sem`))
#total_vagas2 <- as.data.frame(total_vagas2)

alunos_ativos <- Campus %>% 
  group_by(Campus) %>% 
  summarise(`Alunos Ativos` = sum(`Alunos Ativos`))
alunos_ativos <- as.data.frame(alunos_ativos)

vagas_ociosas <- Campus %>% 
  group_by(Campus) %>% 
  summarise(`Vagas Ociosas` = sum(`Vagas Ociosas`))
vagas_ociosas <- as.data.frame(vagas_ociosas)

#Juntando Fragmentos criados (Retrabalhado para plots de dispersão)
Campi <- inner_join(total_vagas, alunos_ativos , by = "Campus")
Campi <- inner_join(Campi, vagas_ociosas, by = "Campus")

#Campi <- inner_join(total_vagas1, total_vagas2, by = "Campus")
#Campi <- inner_join(Campi, alunos_ativos, by = "Campus")
#Campi <- inner_join(Campi, vagas_ociosas, by = "Campus")

#Plotando gráficos Campi
ggplot(data = Campi,
       mapping = aes(x = reorder(Campus, -`Vagas Ociosas`),
                     y = `Vagas Ociosas`)) +
  xlab("Campus") +
  ylab("Vagas Ociosas") + 
  geom_col(fill = "darkblue") +
  ggtitle("Vagas Ociosas Por Campus - UFCG")
##########################
ggplot(data = Campi,
       mapping = aes(x = reorder(Campus, -`Alunos Ativos`),
                     y = `Alunos Ativos`)) +
  xlab("Campus") +
  ylab("Alunos Ativos") +
  geom_col(fill = "darkblue") +
  ggtitle("Alunos Ativos por Campus - UFCG")
###########################
ggplot(data = Campi,
       mapping = aes(x = reorder(Campus, -`Vagas 2º Sem`),
                     y = `Vagas 2º Sem`)) +
  xlab("Campus") +
  ylab("Vagas 2º Semestre") +
  geom_col(fill = "darkblue") +
  ggtitle("Vagas Para Ingressantes 2º Semestre por Campus - UFCG")
#########################
ggplot(data = Campi,
       mapping = aes(x = reorder(Campus, -`Vagas 1º Sem`),
                     y = `Vagas 1º Sem`)) +
  xlab("Campus") +
  ylab("Vagas 2º Semestre") +
  geom_col(fill = "darkblue") +
  ggtitle("Vagas Para Ingressantes 1º Semestre por Campus - UFCG")
##########################
ggplot(data = Campi,
       mapping = aes(x = `Vagas Totais`,
                     y = `Vagas Ociosas`,
                     size = `Alunos Ativos`,
                     colour = Campus)) +
  xlab("Vagas de Ingressantes (1º e 2º Semestre)") +
  ylab("Vagas Ociosas") +
  ggtitle("Vagas Totais Para Ingressantes x Vagas Ociosas x Alunos Ativos") +
  scale_size_continuous(range = c(1,15)) +
  geom_point()

