library(tidyverse)
library(magrittr)
library(ggplot2)
library(patchwork)
library(sandwich)
library(lmtest)

data_set <-read.csv("merged_data_cleaned.csv")
data_set2<- data_set %>% filter(altitude_mean_meters<6000) %>% filter(Total.Cup.Points >0)

lm1 <- lm(data_set2$Total.Cup.Points ~ altitude_mean_meters, data = data_set2)

plot1 <- data_set2 %>%
  ggplot()+
  aes(x=altitude_mean_meters, y=Total.Cup.Points)+
  geom_jitter()+
  geom_smooth(method = "lm", se = FALSE)+
  annotate("text", x=3500, y=65, label= bquote(y==~"0.000823x + 81.09, "~R^2==~"0.023") )
plot1



plot2 <- data_set2 %>%
  ggplot()+
  aes(altitude_mean_meters)+
  geom_density()
plot2

plot3 <- data_set2 %>%
  ggplot()+
  aes(Total.Cup.Points)+
  geom_density()
plot3