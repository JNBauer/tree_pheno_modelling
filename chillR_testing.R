library(chillR)
library(ggplot2)
library(dplyr)

Winters_hours_gaps

hourtemps <- subset(Winters_hours_gaps, select = -c(Temp_gaps))

hourtemps

WH <- function(hourtemps)
  {
  hourtemps[,"Warming_hours"] <- hourtemps$Temp>25
  }

hourtemps <- (WH(hourtemps))

hourtemps <- subset(Winters_hours_gaps, select = -c(Temp_gaps))

hourtemps

WH_YEARMODA <- function(hourtemps, start_dateYEARMODA, end_dateYEARMODA)#, start_hour=12, end_hour=12)
{

  start_year <- as.numeric(substr(start_dateYEARMODA, 1, 4))
  start_month <- as.numeric(substr(start_dateYEARMODA, 5, 6))
  start_day <- as.numeric(substr(start_dateYEARMODA, 7, 8))

  end_year <- as.numeric(substr(end_dateYEARMODA, 1, 4))
  end_month <- as.numeric(substr(end_dateYEARMODA, 5, 6))
  end_day <- as.numeric(substr(end_dateYEARMODA, 7, 8))
  
  start_hour <- 12
  end_hour <-  12
  
  start_date <- which(hourtemps$Year==start_year & hourtemps$Month==start_month
                      & hourtemps$day==start_day & hourtemps$hour==start_hour)
  end_date <- which(hourtemps$Year==end_year & hourtemps$Month==end_month
                    & hourtemps$day==end_day & hourtemps$hour==end_hour)
  
  warm_hours <- WH(hourtemps)
  return(sum(warm_hours$Warming_hours[start_date:end_date]))

}

warming_hours_for_time_frame <- WH_YEARMODA(hourtemps, 20080305, 20080901)
warming_hours_for_time_frame
