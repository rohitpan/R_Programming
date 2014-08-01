corr <- function (directory,threshold = 0)
{
  #wd <- getwd()
  # add one or two zeros to ID so that they match the CSV file names
  filenames <- list.files(directory,pattern="*.csv")
  
  # path to specdata folder
  # if no path is provided, default is working directory
  files_list <- file.path(directory, filenames)
  
  #dataset <- lapply(filedir,read.csv)
  vec <- numeric()
  #dat <- data.frame(id=rep(0,length(files_list)),nobs=rep(0,length(files_list))) #creates an empty data frame
  for (i in 1:length(files_list)) { #loops through the files, rbinding them together
    temp_dat <- read.csv(files_list[i])
    temp_dat_wo_na <- na.omit(temp_dat)
    if( nrow(temp_dat_wo_na) > threshold)
      vec <- c(vec,cor(temp_dat_wo_na$sulfate,temp_dat_wo_na$nitrate))
  }
  vec
}