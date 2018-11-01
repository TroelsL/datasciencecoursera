complete <- function(directory, id = 1:332) {
  list = list()
  count <- 1
  for(i in id)
  {
    path <- paste(directory, "/", formatC(i, width = 3, flag = "0"),".csv", sep = "")
    dat <- read.csv(path, header = TRUE)
    dat <- dat[complete.cases(dat),]
    
    list[[count]] <- c(i, nrow(dat))
    count <- count + 1
  }
  data <- do.call(rbind, list)
  colnames(data) <- c("id", "nobs")
  data
}
