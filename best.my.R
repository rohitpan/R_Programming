best <- function(state, outcome)
{
  
  
  
  table <- read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings='Not Available')
  state_vector <- unique(table$State)
  
  if( match(outcome,c("heart attack", "heart failure", "pneumonia" ), nomatch = -1) == -1 ) stop("error here")
  if ( !(state %in% state_vector)) stop("error here")
  
  state_table <- table[table$State == state, ]
  if (outcome == "heart attack")
    mr <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  else if (outcome == "heart failure")
    mr <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  else if (outcome == "pneumonia")
    mr <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Pneumonia"
  
  cat(mr)
  ncol(table_state)
  nrow(table_state)
}