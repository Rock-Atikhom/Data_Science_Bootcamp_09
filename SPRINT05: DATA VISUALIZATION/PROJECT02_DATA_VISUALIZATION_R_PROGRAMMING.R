## LIBRARY
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(patchwork)


## 1. Which model of car has the highest fuel efficiency? 
## Which has the lowest?

most_hwy <- mpg %>%
  group_by(model) %>%
  summarise(avg_hwy = mean(hwy)) %>%
  arrange(desc(avg_hwy)) %>%
  select(model, avg_hwy) %>%
  head(10)

most_cty <- mpg %>%
  group_by(model) %>%
  summarise(avg_cty = mean(cty)) %>%
  arrange(desc(avg_cty)) %>%
  select(model, avg_cty) %>%
  head(10)


## GGPLOT

c1 <- ggplot(most_hwy, aes(reorder(toupper(model), (avg_hwy)), avg_hwy, fill = toupper(model))) +
  theme_minimal() +
  coord_flip() +
  geom_col(color = "black", alpha = 0.3) +
  scale_fill_brewer(palette = "Set3") +
  labs(title = "TOP 10 MODELS WITH THE HIGHEST FUEL EFFICIENCY ON HIGH",
       y = "AVERAGE HIGHWAY MILES PER GALLON",
       x = "MODEL",
       fill = "MODEL")

c2 <- ggplot(most_cty, aes(reorder(toupper(model), (avg_cty)), avg_cty, fill = toupper(model))) +
  theme_minimal() +
  coord_flip() +
  geom_col(color = "black", alpha = 0.3) +
  scale_fill_brewer(palette = "Set3") +
  labs(title = "TOP 10 MODELS WITH THE HIGHEST FUEL EFFICIENCY ON CITY",
       y = "AVERAGE CITY MILES PER GALLON",
       x = "MODEL",
       fill = "MODEL")

c1 / c2


## 2. Which model of car has the lowest fuel efficiency? 

low_hwy <- mpg %>%
  group_by(model) %>%
  summarise(avg_hwy = mean(hwy)) %>%
  arrange(avg_hwy) %>%
  select(model, avg_hwy) %>%
  head(10)

low_cty <- mpg %>%
  group_by(model) %>%
  summarise(avg_cty = mean(cty)) %>%
  arrange(avg_cty) %>%
  select(model, avg_cty) %>%
  head(10)


C3 <- ggplot(low_hwy, aes(reorder(toupper(model), avg_hwy), avg_hwy, color = toupper(model))) +
  theme_minimal() +
  geom_col(fill = "white", alpha = 0.3, position = "dodge") +
  scale_fill_stata(scheme = "s2color") +
  labs(title = "TOP 10 MODELS WITH THE LOWEST FUEL EFFICIENCY ON HIGHWAY",
       y = "AVERAGE HIGHWAY MILES PER GALLON",
       x = "MODEL",
       color = "MODEL") +
  scale_x_discrete(guide = guide_axis(n.dodge=2))


C4 <- ggplot(low_cty, aes(reorder(toupper(model), avg_cty), avg_cty, color = toupper(model))) +
  theme_minimal() +
  geom_col(fill = "white", alpha = 0.3, position = "dodge") +
  scale_fill_stata(scheme = "s2color") +
  labs(title = "TOP 10 MODELS WITH THE LOWEST FUEL EFFICIENCY ON CITY",
       y = "AVERAGE CITY MILES PER GALLON",
       x = "MODEL",
       color = "MODEL") +
  scale_x_discrete(guide = guide_axis(n.dodge=2))
  

## 2. What is the relationship between engine 
## displacement (displ) and fuel efficiency (mpg)?

m1 <- mpg %>%
  select(1:10) %>%
  mutate(hwy = NULL,
         hwy = cty)

ggplot() +
  theme_classic() +
  geom_point(data = mpg, aes(hwy, displ, color = "HWY"),size = 3, alpha = 0.3) +
  geom_point(data = m1, aes(hwy, displ, color = "CTY"),size = 3, alpha = 0.2) +
  geom_smooth(data = m1, aes(hwy, displ), se = F, colour = "salmon") +
  geom_smooth(data = mpg, aes(hwy, displ), se = F, colour = "greenyellow") +
  labs(y = "DISPL",
       x = " ",
       colour = "SYSTEM",
       title = "RELATIONSHIP BETWEEN 
ENNGINE DISPLACEMENT CITY, AND HIGHWAY") +
  theme(plot.title = element_text(size = 15, face = "bold")) +
  theme(axis.title.y = element_text(size = 10, face = "bold"))


## 3. RELATIONSHIP BETWEEN CYLINDERS, CITY, AND HIGHWAY
  
m2 <- mpg %>%
  select(everything()) %>%
  mutate(hwy = NULL,
         hwy = cty)

ggplot() +
  theme_classic() +
  geom_point(data = mpg, aes(cyl, hwy, color = "HWY"),size = 3, alpha = 0.3,) +
  geom_point(data = m2, aes(cyl, hwy, color = "CTY",),size = 3, alpha = 0.2) +
  geom_smooth(data = m2, aes(cyl, hwy), se = F, colour = "salmon") +
  geom_smooth(data = mpg, aes(cyl, hwy), se = F, colour = "greenyellow") +
  labs(y = "CYL",
       x = " ",
       colour = "PATTERN",
       title = "RELATIONSHIP BETWEEN 
ENNGINE DISPLACEMENT CITY, AND HIGHWAY") +
  theme(plot.title = element_text(size = 15, face = "bold")) +
  theme(axis.title.y = element_text(size = 10, face = "bold")) +
  xlim(NA, 8)


## 4. DISTRIBUTION OF CYLINDERS BY CAR CLASS

ggplot(mpg, aes(cyl, fill = toupper(class))) +
  geom_density(alpha = 0.5, position = "stack") +
  theme_classic() +
  scale_fill_brewer(palette = "Pastel1") +
  labs(title = "DISTRIBUTION OF CYLINDERS BY CAR CLASS ",
       x = "CYL",
       y = "DENSITY",
       fill = "CLASS") +
  theme(plot.title = element_text(size = 15, face = "bold"))


## 5. AVERAGE HIGHWAY AND CITY WAY BY TRANSMISSION

trans_c <- mpg %>%
  select(hwy, trans, cty, model) %>%
  mutate(trans = if_else(trans == c("manual(m5)", "manual(m5)"), "manual", "auto")) %>%
  group_by(model, trans) %>%
  summarise(avg_hwy = mean(hwy),
            avg_cty = mean(cty))


ggplot(trans_c, aes(avg_hwy, avg_cty, color = toupper(trans))) +
  theme_classic() +
  geom_point(alpha = 0.5, size = 4, shape = 19) +
  geom_boxplot(alpha = 0.1, size = 0.1) +
  facet_wrap(~trans) +
  labs(x = "AVERAGE HIGHWAY",
       y = "AVERAGE CITY WAT",
       color = "CATEGORY") +
  ggtitle("AVERAGE HIGHWAY AND CITY WAY BY TRANSMISSION") +
  theme(plot.title = element_text(size = 12, face = "bold"))
