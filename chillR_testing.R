library(chillR)
library(ggplot2)
library(dplyr)

Winters_hours_gaps

hourtemps <- subset(Winters_hours_gaps, select = -c(Temp_gaps))

hourtemps

ggplot(aes(x=Winters_hours_gaps$Day, y=Winters_hours_gaps$Temp))
