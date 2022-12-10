library(dplyr)
library(ggplot2)
#What is the average value of my variable across all the counties (in the current year)?t?
co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
average_val_of_coalco2 <- co2_data %>% filter(year == 2021) %>% summarise(coal_co2_average = mean(coal_co2, na.rm = TRUE))%>% pull(coal_co2_average)
print(average_val_of_coalco2)

#Where is my variable the highest / lowest?
max_val_of_coalco2 <- co2_data %>% filter(coal_co2 == max(coal_co2, na.rm = TRUE)) %>% pull(country)
print(max_val_of_coalco2)
min_val_of_coalco2 <- co2_data %>% filter(coal_co2 == min(coal_co2, na.rm = TRUE)) %>% group_by(country) %>% summarise(coal_co2 = mean(coal_co2, na.rm = TRUE)) %>% pull(country) 
print(min_val_of_coalco2)

#How much has my variable change over the last N years?
coal_co2_change <- function(N_year){
  a <- co2_data %>% group_by(year) %>%  summarise(coal_co2 = mean(coal_co2, na.rm = TRUE)) %>% 
    filter(year >= (2021-(N_year-1)))
  return(a)
}
coal_co2_change(3)

