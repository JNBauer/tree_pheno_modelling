library(chillR)
library(ggplot2)
library(dplyr)


Winters_hours_gaps

Chilling_Hours(Winters_hours_gaps$Temp)[1:100] # model takes vector with temperatures

output <- chilling(make_JDay(Winters_hours_gaps),Start_JDay = 90, End_JDay = 100)
output

# Utah model 2009 The Chilling hours sometimes reffered . In addition to the models typcially used in California, one modified version of
own_utah_steps <- data.frame(
  lower=c(-291,0,1,2,3,4,5,6),
  upper=c(0,1,2,3,4,5,6,100),
  weight=c(0,0.5,1,2,3,2,1,0))

own_utah_steps

own_utah <- function(x) step_model(x,df)

test <- own_utah(Winters_hours_gaps$Temp)[90:100]
test

output<-tempResponse(make_JDay(Winters_hours_gaps),
                     Start_JDay = 90, End_JDay = 100, 
                     models=list(Own_Utah_Model=own_utah, Chill_portions=Dynamic_Model),
                     whole_record = TRUE)
output
