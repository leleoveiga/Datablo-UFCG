

caminhao <- NULL
nArquivos <- seq(1:37)

arquivos <- dir(path = '~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo')
caminho <- '~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo'

for (i in arquivos){
  caminhao <- c(caminhao, (paste(caminho, i, sep = "/")))
}
 #Estudar como ler vários arquivos de uma só vez
{
"Ano2002.1" <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2002.1.csv")
'Ano2002.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2002.2.csv")
'Ano2003.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2003.1.csv")
'Ano2003.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2003.2.csv")
'Ano2004.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2004.1.csv")
'Ano2004.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2004.2.csv")
'Ano2005.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2005.1.csv")
'Ano2005.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2005.2.csv")
'Ano2006.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2006.1.csv")
'Ano2006.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2006.2.csv")
'Ano2007.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2007.1.csv")
'Ano2007.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2007.2.csv")
'Ano2008.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2008.1.csv")
'Ano2008.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2008.2.csv")
'Ano2009.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2009.1.csv")
'Ano2009.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2009.2.csv")
'Ano2010.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2010.1.csv")
'Ano2010.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2010.2.csv")
'Ano2011.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2011.1.csv")
'Ano2011.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2011.2.csv")
'Ano2012.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2012.1.csv")
'Ano2012.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2012.2.csv")
'Ano2013.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2013.1.csv")
'Ano2013.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2013.2.csv")
'Ano2014.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2014.1.csv")
'Ano2014.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2014.2.csv")
'Ano2015.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2015.1.csv")
'Ano2015.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2015.2.csv")
'Ano2016.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2016.1.csv")
'Ano2016.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2016.2.csv")
'Ano2017.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2017.1.csv")
'Ano2017.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2017.2.csv")
'Ano2018.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2018.1.csv")
'Ano2018.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2018.2.csv")
'Ano2019.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2019.1.csv")
'Ano2019.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2019.2.csv")
'Ano2020.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/DadosCrus/MatriculasPorSexo/2020.1.csv")
}

{
Ano2002.1 <- Ano2002.1[nrow(Ano2002.1),]
Ano2002.2 <- Ano2002.2[nrow(Ano2002.2),]
Ano2003.1 <- Ano2003.1[nrow(Ano2003.1),]
Ano2003.2 <- Ano2003.2[nrow(Ano2003.2),]
Ano2004.1 <- Ano2004.1[nrow(Ano2004.1),]
Ano2004.2 <- Ano2004.2[nrow(Ano2004.2),]
Ano2005.1 <- Ano2005.1[nrow(Ano2005.1),]
Ano2005.2 <- Ano2005.2[nrow(Ano2005.2),]
Ano2006.1 <- Ano2006.1[nrow(Ano2006.1),]
Ano2006.2 <- Ano2006.2[nrow(Ano2006.2),]
Ano2007.1 <- Ano2007.1[nrow(Ano2007.1),]
Ano2007.2 <- Ano2007.2[nrow(Ano2007.2),]
Ano2008.1 <- Ano2008.1[nrow(Ano2008.1),]
Ano2008.2 <- Ano2008.2[nrow(Ano2008.2),]
Ano2009.1 <- Ano2009.1[nrow(Ano2009.1),]
Ano2009.2 <- Ano2009.2[nrow(Ano2009.2),]

Ano2010.1 <- Ano2010.1[nrow(Ano2010.1),]
Ano2010.2 <- Ano2010.2[nrow(Ano2010.2),]
Ano2011.1 <- Ano2011.1[nrow(Ano2011.1),]
Ano2011.2 <- Ano2011.2[nrow(Ano2011.2),]
Ano2012.1 <- Ano2012.1[nrow(Ano2012.1),]
Ano2012.2 <- Ano2012.2[nrow(Ano2012.2),]
Ano2013.1 <- Ano2013.1[nrow(Ano2013.1),]
Ano2013.2 <- Ano2013.2[nrow(Ano2013.2),]
Ano2014.1 <- Ano2014.1[nrow(Ano2014.1),]
Ano2014.2 <- Ano2014.2[nrow(Ano2014.2),]
Ano2015.1 <- Ano2015.1[nrow(Ano2015.1),]
Ano2015.2 <- Ano2015.2[nrow(Ano2015.2),]
Ano2016.1 <- Ano2016.1[nrow(Ano2016.1),]
Ano2016.2 <- Ano2016.2[nrow(Ano2016.2),]
Ano2017.1 <- Ano2017.1[nrow(Ano2017.1),]
Ano2017.2 <- Ano2017.2[nrow(Ano2017.2),]
Ano2018.1 <- Ano2018.1[nrow(Ano2018.1),]
Ano2018.2 <- Ano2018.2[nrow(Ano2018.2),]
Ano2019.1 <- Ano2019.1[nrow(Ano2019.1),]
Ano2019.2 <- Ano2019.2[nrow(Ano2019.2),]
Ano2020.1 <- Ano2020.1[nrow(Ano2020.1),]
}

{
Ano2002.1
Ano2002.2
Ano2003.1
Ano2003.2
Ano2004.1
Ano2004.2
Ano2005.1
Ano2005.2
Ano2006.1
Ano2006.2
Ano2007.1
Ano2007.2
Ano2008.1
Ano2008.2
Ano2009.1
Ano2009.2
Ano2010.1
Ano2010.2
Ano2011.1
Ano2011.2
Ano2012.1
Ano2012.2
Ano2013.1
Ano2013.2
Ano2014.1
Ano2014.2
Ano2015.1
Ano2015.2
Ano2016.1
Ano2016.2
Ano2017.1
Ano2017.2
Ano2018.1
Ano2018.2
Ano2019.1
Ano2019.2
Ano2020.1
}

{
names(Ano2002.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2002.1$Período <- as.character(Ano2002.1$Período)
Ano2002.1$Período[1] <- '2002-1'

names(Ano2002.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2002.2$Período <- as.character(Ano2002.2$Período)
Ano2002.2$Período[1] <- '2002-2'

names(Ano2003.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2003.1$Período <- as.character(Ano2003.1$Período)
Ano2003.1$Período[1] <- '2003-1'

names(Ano2003.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2003.2$Período <- as.character(Ano2003.2$Período)
Ano2003.2$Período[1] <- '2003-2'

names(Ano2004.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2004.1$Período <- as.character(Ano2004.1$Período)
Ano2004.1$Período[1] <- '2004-1'

names(Ano2004.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2004.2$Período <- as.character(Ano2004.2$Período)
Ano2004.2$Período[1] <- '2004-2'

names(Ano2005.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2005.1$Período <- as.character(Ano2005.1$Período)
Ano2005.1$Período[1] <- '2005-1'

names(Ano2005.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2005.2$Período <- as.character(Ano2005.2$Período)
Ano2005.2$Período[1] <- '2005-2'

names(Ano2006.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2006.1$Período <- as.character(Ano2006.1$Período)
Ano2006.1$Período[1] <- '2006-1'

names(Ano2006.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2006.2$Período <- as.character(Ano2006.2$Período)
Ano2006.2$Período[1] <- '2006-2'

names(Ano2007.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2007.1$Período <- as.character(Ano2007.1$Período)
Ano2007.1$Período[1] <- '2007-1'

names(Ano2007.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2007.2$Período <- as.character(Ano2007.2$Período)
Ano2007.2$Período[1] <- '2007-2'

names(Ano2008.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2008.1$Período <- as.character(Ano2008.1$Período)
Ano2008.1$Período[1] <- '2008-1'

names(Ano2008.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2008.2$Período <- as.character(Ano2008.2$Período)
Ano2008.2$Período[1] <- '2008-2'

names(Ano2009.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2009.1$Período <- as.character(Ano2009.1$Período)
Ano2009.1$Período[1] <- '2009-1'

names(Ano2009.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2009.2$Período <- as.character(Ano2009.2$Período)
Ano2009.2$Período[1] <- '2009-2'

names(Ano2010.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2010.1$Período <- as.character(Ano2010.1$Período)
Ano2010.1$Período[1] <- '2010-1'

names(Ano2010.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2010.2$Período <- as.character(Ano2010.2$Período)
Ano2010.2$Período[1] <- '2010-2'

names(Ano2011.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2011.1$Período <- as.character(Ano2011.1$Período)
Ano2011.1$Período[1] <- '2011-1'

names(Ano2011.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2011.2$Período <- as.character(Ano2011.2$Período)
Ano2011.2$Período[1] <- '2011-2'

names(Ano2012.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2012.1$Período <- as.character(Ano2012.1$Período)
Ano2012.1$Período[1] <- '2012-1'

names(Ano2012.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2012.2$Período <- as.character(Ano2012.2$Período)
Ano2012.2$Período[1] <- '2012-2'

names(Ano2013.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2013.1$Período <- as.character(Ano2013.1$Período)
Ano2013.1$Período[1] <- '2013-1'

names(Ano2013.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2013.2$Período <- as.character(Ano2013.2$Período)
Ano2013.2$Período[1] <- '2013-2'

names(Ano2014.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2014.1$Período <- as.character(Ano2014.1$Período)
Ano2014.1$Período[1] <- '2014-1'

names(Ano2014.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2014.2$Período <- as.character(Ano2014.2$Período)
Ano2014.2$Período[1] <- '2014-2'

names(Ano2015.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2015.1$Período <- as.character(Ano2015.1$Período)
Ano2015.1$Período[1] <- '2015-1'

names(Ano2015.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2015.2$Período <- as.character(Ano2015.2$Período)
Ano2015.2$Período[1] <- '2015-2'

names(Ano2016.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2016.1$Período <- as.character(Ano2016.1$Período)
Ano2016.1$Período[1] <- '2016-1'

names(Ano2016.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2016.2$Período <- as.character(Ano2016.2$Período)
Ano2016.2$Período[1] <- '2016-2'

names(Ano2017.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2017.1$Período <- as.character(Ano2017.1$Período)
Ano2017.1$Período[1] <- '2017-1'

names(Ano2017.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2017.2$Período <- as.character(Ano2017.2$Período)
Ano2017.2$Período[1] <- '2017-2'

names(Ano2018.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2018.1$Período <- as.character(Ano2018.1$Período)
Ano2018.1$Período[1] <- '2018-1'

names(Ano2018.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2018.2$Período <- as.character(Ano2018.2$Período)
Ano2018.2$Período[1] <- '2018-2'

names(Ano2019.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2019.1$Período <- as.character(Ano2019.1$Período)
Ano2019.1$Período[1] <- '2019-1'

names(Ano2019.2)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2019.2$Período <- as.character(Ano2019.2$Período)
Ano2019.2$Período[1] <- '2019-2'

names(Ano2020.1)[1:4] <- c('Período', 'Feminino', 'Masculino', 'Total')
Ano2020.1$Período <- as.character(Ano2020.1$Período)
Ano2020.1$Período[1] <- '2020-1'
}

dfFinal = setNames(data.frame(matrix(ncol = 1, nrow = 0)), c("Período"))
dfFinal$Período <- as.character(dfFinal$Período)

listaDf <- list(Ano2002.1, Ano2002.2, Ano2003.1, Ano2003.2, Ano2004.1, Ano2004.2,
                Ano2005.1, Ano2005.2, Ano2006.1, Ano2006.2, Ano2007.1, Ano2007.2,
                Ano2008.1, Ano2008.2, Ano2009.1, Ano2009.2, Ano2010.1, Ano2010.2,
                Ano2011.1, Ano2011.2, Ano2012.1, Ano2012.2, Ano2013.1, Ano2013.2,
                Ano2014.1, Ano2014.2, Ano2015.1, Ano2015.2, Ano2016.1, Ano2016.2,
                Ano2017.1, Ano2017.2, Ano2018.1, Ano2018.2, Ano2019.1, Ano2019.2,
                Ano2020.1)

for (i in 1:length(listaDf)) {
  dfFinal <- rbind(dfFinal, listaDf[[i]])
}

row.names(dfFinal) <- NULL   #Corrige linhas com numeros errados

write_delim(
  dfFinal, "~/Documentos/Analise-de-Dados-da-UFCG/DadosProcessados/MatriculasSemestraisPorSexo.csv", delim = ";")

#### Plots ####

dfDerretido <- dfFinal

dfDerretido <- melt(dfDerretido, id.vars = 'Período')
dfDerretido <- dfDerretido[-c(75:111),]
dfDerretido$value <- as.numeric(dfDerretido$value)

ggplot(data = dfDerretido,
       mapping = aes(
         x = Período,
         y = value,
         group = variable,
         Col = Período,
         label = value,
         colour = variable
       )) +
  theme(panel.background = element_rect(fill='#131313'),
        plot.title = element_text(colour = "grey65"),
        plot.background = element_rect(fill='#131313'),
        panel.grid.major = element_line(colour ="grey65"),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        title = element_text(size = 25),
        axis.ticks = element_line(color="grey65"),
        axis.text = element_text(color="grey65"),
        axis.title = element_text(color="grey65"),
        axis.line = element_line(color="white"),
        axis.text.x = element_text(angle = 45, vjust = .5, size = 17.0),
        axis.text.y = element_text(angle = 0, vjust = .3, size = 15.0),
        legend.background = element_rect(fill = '#131313'),
        legend.margin = margin(t = 0, r = 5, b = 0, l = 5, unit = "pt"),
        legend.text = element_text(color = 'white', size = 15.0),
        legend.title = element_blank(),
        legend.box.background = element_rect(fill = '#131313')) +
  scale_y_continuous(breaks = c(seq(0, max(dfDerretido$value, na.rm = T) + 1000, 1000))) +
  xlab(NULL) +
  ylab(NULL) +
  ggtitle("Quantidade de Matriculados por Sexo por Período - UFCG") +
  geom_line(size = 0.5) +
  geom_point(size = 1.3) +
  geom_line()








