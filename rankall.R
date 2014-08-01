rankall <- function(outcome, num = "best" ){
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  #if (!state %in% data$State) {
  #  stop("invalid state")
  #}
  state <- sort(unique(data$State))
  
  #col_names <- c("hospital","state")
  dat <- data.frame(hospital = character(), state = character(),stringsAsFactors = FALSE) #creates an empty data frame
  
  #colnames(dat) <- col_names # assign colnames to dat frame
  
  for(i in seq_along(state))
  {
  datas <- data[data$State==state[i],]
  if (outcome == 'heart attack') {
    death <- suppressWarnings(as.numeric(datas[,11]))
  } else if (outcome == 'heart failure') {
    death <- suppressWarnings(as.numeric(datas[,17]))
  } else if (outcome == 'pneumonia') {
    death <- suppressWarnings(as.numeric(datas[,23]))
  } else {
    stop("invalid outcome")
  }
  
  a <- rank(death, na.last=NA)
  
  if (num=="best") {
    r <- 1
  } else if (num =="worst") {
    r <- length(a)
  } else if (num <= length(a) ) {
    r <- num
  } else {
    r <- NA
  }
  
  if (is.na(r)) {
    hospital_name <- NA
  } else {
    hospital_name <- datas$Hospital.Name[order(death, datas$Hospital.Name)[r]]
  }
  
  #hospital_name <- datas$Hospital.Name[order(death, datas$Hospital.Name)[r]]
  
  #dat$hospital[i] <- hospital
  #dat$state[i] <- state[i]
  
  dat <- rbind(dat, data.frame(hospital = hospital_name, state = state[i]))
  
  }
  dat
}