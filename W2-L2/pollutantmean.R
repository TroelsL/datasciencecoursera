pollutantmean <- function(directory, pollutant, id = 1:332) {
  count <- 0;
  total <- 0.0;
  for(i in id)
  {
    path <- paste(directory, "/", formatC(i, width = 3, flag = "0"),".csv", sep = "")
    dat <- read.csv(path, header = TRUE)
    dat <- dat[!is.na(dat[pollutant]),]
    if(nrow(dat) > 0) {
      count <- count + nrow(dat)
      total <- total + sum(dat[pollutant])
    }
  }
  total / count
}