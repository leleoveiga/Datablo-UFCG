
test <- function(){
  x <- 4
  y <- 1
  dataframe <- get(readline(prompt = "Nome do DataFrame: "))
  while(y <= dim(Reprovacao_2010)[1]) {
    if(is.nan(dataframe[[x]][y]) == TRUE){dataframe[[x]][y] <- 0.0}
    y <- y + 1
  }
  x <- x + 3
}

 # A função funciona, só precisa adicionar um contador pro x e um mecanismo
# para salvar as mudanças no dataframe original


dataframe <- get(readline(prompt = "Nome do DataFrame: "))
