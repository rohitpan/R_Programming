complete <- function (directory,id = 1:332)
{
  #wd <- getwd()
  # add one or two zeros to ID so that they match the CSV file names
  filenames <- sprintf("%03d.csv", id)
  
  # path to specdata folder
  # if no path is provided, default is working directory
  files_list <- file.path(directory, filenames)
  
  #dataset <- lapply(filedir,read.csv)
  
  dat <- data.frame(id=rep(0,length(files_list)),nobs=rep(0,length(files_list))) #creates an empty data frame
  for (i in 1:length(files_list)) { #loops through the files, rbinding them together
    temp_dat <- read.csv(files_list[i])
    dat[i,] <- c(id[i],nrow(na.omit(temp_dat)))
  }
  dat
}