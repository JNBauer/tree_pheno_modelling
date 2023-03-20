chill_sensitivity_temps <- function(chill_model_sensitivity_table,
                                    temperatures,
                                    temp_model,
                                    month_range=c(10,11,12,1,2,3),
                                    Tmins=c(-10:20),
                                    Tmaxs=c(-5:30),
                                    legend_label="Chill/day (CP)")
{
  library(ggplot2)
  library(colorRamps)
  
  cmst<-chill_model_sensitivity_table
  cmst<-cmst[which(cmst$Month %in% month_range),]
  cmst$Month_names<- factor(cmst$Month, levels=month_range,
                            labels=month.name[month_range])  
  
  DM_sensitivity<-
    ggplot(cmst,
           aes_string(x="Tmin",y="Tmax",fill=temp_model)) +
    geom_tile() +
    scale_fill_gradientn(colours=alpha(matlab.like(15), alpha = .5),
                         name=legend_label) +
    xlim(Tmins[1],Tmins[length(Tmins)]) +
    ylim(Tmaxs[1],Tmaxs[length(Tmaxs)])
  
  temperatures<-
    temperatures[which(temperatures$Month %in% month_range),]
  temperatures[which(temperatures$Tmax<temperatures$Tmin),
               c("Tmax","Tmin")]<-NA
  temperatures$Month_names <-
    factor(temperatures$Month,
           levels=month_range,
           labels=month.name[month_range])  
  
  DM_sensitivity +
    geom_point(data=temperatures,
               aes(x=Tmin,y=Tmax,fill=NULL,color="Temperature"),
               size=0.2) +
    facet_wrap(vars(Month_names)) +
    scale_color_manual(values = "black",
                       labels = "Daily temperature \nextremes (°C)",
                       name="Observed at site" ) +
    guides(fill = guide_colorbar(order = 1),
           color = guide_legend(order = 2)) +
    ylab("Tmax (°C)") +
    xlab("Tmin (°C)") + 
    theme_bw(base_size=15)
  
}