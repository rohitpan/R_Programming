
pollutantmean <- function (directory,pollutant,id = 1:332)
{
  wd <- getwd()
  
  #message("current working dir", wd)
  #for(i in id)
  #{ 
   # print(i)
   # file <- paste(wd,"/",directory,"/","0",i,".","csv",sep = '')
    #print(file)
    #data <- read.csv("/Users/Tenacity/Downloads/R/specdata/030.csv")
    #data <- read.csv(file)
    #print(data)
    #data$"sulfate"
    #print(data)
    #names(data)
    #polmean <- mean(data[[pollutant]],na.rm=TRUE)
  #}
  
  # add one or two zeros to ID so that they match the CSV file names
  filenames <- sprintf("%03d.csv", id)
  
  # path to specdata folder
  # if no path is provided, default is working directory
  files_list <- file.path(directory, filenames)
  
  #dataset <- lapply(filedir,read.csv)
  
  dat <- data.frame() #creates an empty data frame
  for (i in 1:length(files_list)) { #loops through the files, rbinding them together
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  
  polmean <- mean(dat[[pollutant]],na.rm=TRUE)
  polmean
}