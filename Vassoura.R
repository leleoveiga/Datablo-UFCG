# test <- function(){
#  x <- 4
#  y <- 1
#  dataframe <- get(readline(prompt = "Nome do DataFrame: "))
#  while(y <= dim(dataframe)[1]) {
#    if(is.nan(dataframe[[x]][y]) == TRUE){
#      dataframe[[x]][y] <- 0.0
#    }
#    y <- y + 1
#    if(y > dim(dataframe)[1]){
#      x <- x + 3
#    }
#  }
#  print(dataframe)
#}

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
  # write_delim(dataframe, readline(
    # prompt = "Nome de salvamento: "), delim = ";")
  # read_csv("")
}


