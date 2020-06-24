
test <- function(){
  x <- 4
  y <- 1
  dataframe <- get(readline(prompt = "Nome do DataFrame: "))
  while(y <= dim(dataframe)[1]) {
    if(is.nan(dataframe[[x]][y]) == TRUE){
      dataframe[[x]][y] <- 0.0
    }
    y <- y + 1
    if(y > dim(dataframe)[1]){
      x <- x + 3
    }
  }
  print(dataframe)
}

test <- function(dataframe){
  x <- 4
  y <- 1
  while(y <= dim(dataframe)[1] & x <= 7) {
    if(is.nan(dataframe[[x]][y]) == TRUE){
      dataframe[[x]][y] <- 0.0
    }
    y <- y + 1
    if(y > dim(dataframe)[1]){
      x <- x + 3
      y <- 1
    }
  }
  get(readline(prompt = "Insira nome dataframe: ")) <<- dataframe
  # write_delim(dataframe, readline(
    # prompt = "Nome de salvamento: "), delim = ";")
  # read_csv("")
}


cobaia <- Reprovacao_2010
cobaia[[7]][1] <- NaN
cobaia[[7]][51] <- NaN

# A função funciona, só precisa adicionar um contador pro x e um mecanismo
# para salvar as mudanças no dataframe original


dataframe <- get(readline(prompt = "Nome do DataFrame: "))
