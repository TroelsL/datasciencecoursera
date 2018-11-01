corr <- function(directory, threshold = 0) {
  list = list()
  count <- 1
  for(file in list.files(directory))
  {
    path <- paste(directory, "/", file, sep = "")
    dat <- read.csv(path, header = TRUE)
    dat <- dat[complete.cases(dat),]
    if(nrow(dat) >= threshold && nrow(dat) > 0)
    {
      list[[count]] <- cor(dat$sulfate, dat$nitrate)
      count <- count + 1  
    }
  }
  unlist(list)
}