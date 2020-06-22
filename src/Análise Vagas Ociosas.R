library(stringr)
library(dbplyr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(purrr)
#PROBLEMAS: Coluna Turno com alguns valores errados "A" e ")"
#           Compilar mesmos cursos em uma linha única
#OBJ: Gráfico de barras, mostrando a quantidade de vagas ociosas por curso

vagasOciosasPorCurso <- read.csv(file = '~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/vagasOciosasPorCurso.csv')

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

#Fundindo Linhas
data.edit1 <- data.edit1[c(-1,-47,-95,-2),] #excluindo linhas vazias

#Corrigindo ordem das linhas
data.edit1 <- arrange(data.edit1, `Curso`, `Campus`)

#Transformando Campus em fatos
data.edit1$Campus <- as.factor(data.edit1$Campus)

# USAR O STRINGR para manipular as strings de curso e uniformizá-las. em seguida 
# organizar com tidyr e diplyr

data.edit1$Turno <- str_extract(data.edit1$Curso, "\\- [:upper:]") #extrair de turnos e salvar em cursos "- (letramaius)"
data.edit1$Turno <- str_sub(data.edit1$Curso, start = -1) #Pegar apenas o último caractere
data.edit1$Turno <- as.factor(data.edit1$Turno)
data.edit1$Curso <- as.character(data.edit1$Curso)

#Tratando Strings:

data.edit1$Curso <- str_replace_all(data.edit1$Curso, "[-]", "")
data.edit1$Curso <- str_replace(data.edit1$Curso, "[M]$", "")
data.edit1$Curso <- str_replace(data.edit1$Curso, "[N]$", "")
data.edit1$Curso <- str_replace(data.edit1$Curso, "[D]$", "")
data.edit1$Curso <- str_replace(data.edit1$Curso, "[V]$", "")

data.edit1$Turno <- as.character(data.edit1$Turno)
data.edit1[76,7]  <- "D"
data.edit1[79:80,7]  <- "I"
data.edit1[41,7]  <- "I"

#data.edit1$Curso <- as.character(data.edit1$Curso) #foi necessário transformar em character antes de passar para factor
data.edit1$Curso <- as.factor(data.edit1$Curso)

#agrupando linhas de mesmo nome
#primeiro dividir em dataframes menores e então juntá-los

total_vagas1 <- data.edit1 %>% #Criando primeiro fragmento (total de vagas 1)
  group_by(Curso) %>% 
  summarise(Total_Vagas1 = sum(`Vaga 1 Sem`)) #Digitar sum(data.edit1$'Vaga 1 Sem)
total_vagas1 <- as.data.frame(total_vagas1)

total_vagas2 <- data.edit1 %>% #criando segundo fragmento (total vagas 2)
  group_by(Curso) %>% 
  summarise(Total_Vagas2 = sum(`Vaga 2 Sem`)) 
total_vagas2 <- as.data.frame(total_vagas2)

alunos_ativos <- data.edit1 %>% #criando 3º fragmento (Alunos Ativos)
  group_by(Curso) %>% 
  summarise(Alunos_Ativos = sum(`Alunos Ativos`)) 
alunos_ativos <- as.data.frame(alunos_ativos)

vagas_ociosas <- data.edit1 %>% #Criando 4º fragmento (Vagas Ociosas)
  group_by(Curso) %>% 
  summarise(Vagas_Ociosas = sum(`Vagas Ociosas`)) 
vagas_ociosas <- as.data.frame(vagas_ociosas)

#Finalmente, juntando os fragmentos na construção da tabela Final.Separado
Final.Separado <- inner_join(total_vagas1, total_vagas2, by = "Curso")
Final.Separado <- inner_join(Final.Separado, vagas_ociosas, by = "Curso")  
Final.Separado <- inner_join(Final.Separado, alunos_ativos, by = "Curso")  

names(Final.Separado)[2:5] <- c("Vagas 1º Sem","Vagas 2º Sem","Vagas Ociosas","Alunos Ativos")

#Criando agrupamentos por curso
total_vagas <- data.edit1 %>% #Criando primeiro fragmento (total de vagas 1 e total vagas 2)
  group_by(Curso) %>% 
  summarise(Total_Vagas = sum(`Vaga 1 Sem`, `Vaga 2 Sem`))
total_vagas <- as.data.frame(total_vagas)

#Finalmente, juntando os fragmentos na construção da tabela Final.Total
Final.Total <- inner_join(total_vagas, vagas_ociosas , by = "Curso")
Final.Total <- inner_join(Final.Total, alunos_ativos, by = "Curso")  

names(Final.Total)[2:4] <- c("Total Vagas","Vagas Ociosas","Alunos Ativos")

######################
ggplot(data = Final.Total,
       mapping = aes(x = `Total Vagas`,
                     y = `Vagas Ociosas`,
                     size = `Alunos Ativos`,
                     colour = Curso)) +
  scale_size_continuous(range = c(1,15)) +
  xlab("Vagas de Ingressantes(1º e 2º Semestre)") +
  ylab("Vagas Ociosas") +
  geom_point()
########################
ggplot(data = Final.Total,
       mapping = aes(x = `Total Vagas`,
                     y = reorder(Curso, -`Total Vagas`))) +
  geom_col() +
  xlab("Vagas") +
  ylab("Curso") +
  ggtitle("Vagas Disponíveis Anualmente Para Ingressantes por Curso - UFCG")
##########################
ggplot(data = Final.Total,
       mapping = aes(x = `Alunos Ativos`,
                     y = reorder(Curso, -`Alunos Ativos`), label = `Alunos Ativos`)) +
  geom_bar(fill = "#00628c", stat = "identity") +
  geom_bar(fill = "#08b5ff", mapping = aes(x = `Vagas Ociosas`,
                                 y = reorder(Curso, -`Alunos Ativos`)), stat = "identity") +
  xlab("Vagas Ociosas / Alunos Ativos") +
  ylab("Curso") +
  ggtitle("Cursos - UFCG")
###########################
ggplot(data = Final.Total,
       mapping = aes(x = `Alunos Ativos`,
                     y = reorder(Curso, -`Alunos Ativos`), label = `Alunos Ativos`)) +
  coord_cartesian(xlim = c(50, 1000)) +
  geom_col(fill = "#0366d6") +
  geom_text(size = 4, hjust = -0.5) +
  xlab("Alunos Ativos") +
  ylab("Curso") +
  ggtitle("Alunos Ativos por Curso - UFCG")
###########################
ggplot(data = Final.Total,
       mapping = aes(x = `Vagas Ociosas`,
                     y = reorder(Curso, -`Vagas Ociosas`))) +
  geom_col() +
  xlab("Vagas Ociosas") +
  ylab("Curso") +
  ggtitle("Vagas Ociosas por Curso - UFCG")

#Criando agrupamentos por Turno
Turnos <- data.edit1

total_vagas <- Turnos %>% 
  group_by(Turno) %>% 
  summarise(`Vagas Totais` = sum(`Vaga 1 Sem`, `Vaga 2 Sem`))
total_vagas <- as.data.frame(total_vagas)

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
       mapping = aes(x = reorder(Turno, -`Vagas Totais`),
                     y = `Vagas Totais`)) +
  xlab("Turnos") +
  ylab("Vagas 1º Semestre") +
  geom_col(fill = "darkblue") +
  ggtitle("Vagas Totais Para Ingressantes por Turno - UFCG")
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
Campus <- data.edit1

total_vagas <- Campus %>% 
  group_by(Campus) %>% 
  summarise(`Vagas Totais` = sum(`Vaga 1 Sem`, `Vaga 2 Sem`))
total_vagas <- as.data.frame(total_vagas)

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
       mapping = aes(x = reorder(Campus, -`Vagas Totais`),
                     y = `Vagas Totais`)) +
  xlab("Campus") +
  ylab("Vagas Totais") +
  geom_col(fill = "darkblue") +
  ggtitle("Vagas Totais Para Ingressantes por Campus - UFCG")
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