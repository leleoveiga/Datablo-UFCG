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

Reprovacao_2002[is.na(Reprovacao_2002)] <- 0.0
Reprovacao_2004[is.na(Reprovacao_2004)] <- 0.0
Reprovacao_2006[is.na(Reprovacao_2006)] <- 0.0
Reprovacao_2008[is.na(Reprovacao_2008)] <- 0.0
Reprovacao_2010[is.na(Reprovacao_2010)] <- 0.0
Reprovacao_2012[is.na(Reprovacao_2012)] <- 0.0
Reprovacao_2014[is.na(Reprovacao_2014)] <- 0.0
Reprovacao_2016[is.na(Reprovacao_2016)] <- 0.0
Reprovacao_2018[is.na(Reprovacao_2018)] <- 0.0

write_delim(Reprovacao_2002, "Reprovacao_2002.csv", delim = ";")
write_delim(Reprovacao_2004, "Reprovação_2004.csv", delim = ";")
write_delim(Reprovacao_2006, "Reprovação_2006.csv", delim = ";")
write_delim(Reprovacao_2008, "Reprovação_2008.csv", delim = ";")
write_delim(Reprovacao_2010, "Reprovação_2010.csv", delim = ";")
write_delim(Reprovacao_2012, "Reprovação_2012.csv", delim = ";")
write_delim(Reprovacao_2014, "Reprovação_2014.csv", delim = ";")
write_delim(Reprovacao_2016, "Reprovação_2016.csv", delim = ";")
write_delim(Reprovacao_2018, "Reprovação_2018.csv", delim = ";")

Reprovacao_2002 <- Reprovacao_2002[,-1]



