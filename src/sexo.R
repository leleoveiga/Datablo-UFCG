

caminhao <- NULL
nArquivos <- seq(1:37)

arquivos <- dir(path = '~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo')
caminho <- '~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo'

for (i in arquivos){
  caminhao <- c(caminhao, (paste(caminho, i, sep = "/")))
}
 #Estudar como ler vários arquivos de uma só vez
{
"Ano2002.1" <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2002.1.csv")
'Ano2002.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2002.2.csv")
'Ano2003.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2003.1.csv")
'Ano2003.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2003.2.csv")
'Ano2004.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2004.1.csv")
'Ano2004.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2004.2.csv")
'Ano2005.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2005.1.csv")
'Ano2005.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2005.2.csv")
'Ano2006.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2006.1.csv")
'Ano2006.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2006.2.csv")
'Ano2007.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2007.1.csv")
'Ano2007.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2007.2.csv")
'Ano2008.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2008.1.csv")
'Ano2008.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2008.2.csv")
'Ano2009.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2009.1.csv")
'Ano2009.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2009.2.csv")
'Ano2010.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2010.1.csv")
'Ano2010.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2010.2.csv")
'Ano2011.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2011.1.csv")
'Ano2011.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2011.2.csv")
'Ano2012.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2012.1.csv")
'Ano2012.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2012.2.csv")
'Ano2013.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2013.1.csv")
'Ano2013.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2013.2.csv")
'Ano2014.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2014.1.csv")
'Ano2014.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2014.2.csv")
'Ano2015.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2015.1.csv")
'Ano2015.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2015.2.csv")
'Ano2016.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2016.1.csv")
'Ano2016.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2016.2.csv")
'Ano2017.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2017.1.csv")
'Ano2017.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2017.2.csv")
'Ano2018.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2018.1.csv")
'Ano2018.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2018.2.csv")
'Ano2019.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2019.1.csv")
'Ano2019.2' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2019.2.csv")
'Ano2020.1' <- read.csv("~/Documentos/Analise-de-Dados-da-UFCG/Dados Crus/MatriculasPorSexo/2020.1.csv")
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



















