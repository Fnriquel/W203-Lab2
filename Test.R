library(tidyverse)
library(magrittr)
library(ggplot2)
library(patchwork)
library(sandwich)
library(lmtest)
library(ggpmisc)


data_set <-read.csv("merged_data_cleaned.csv")
data_set2<- data_set %>% filter(altitude_mean_meters<6000)

plot1 <- data_set %>%
filter(altitude_mean_meters<6000 & altitude_mean_meters>500) %>%
  ggplot()+
  aes(x=altitude_mean_meters, y=Total.Cup.Points)+
  geom_jitter()+
  geom_smooth(method = "lm", se = FALSE)
plot1

lm1 <- lm(data_set2$Total.Cup.Points ~ data_set2$)

##Testing if it works
