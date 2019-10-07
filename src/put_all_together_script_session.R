# start of session putting it all together
library(tidyverse)
gapminder <- read_csv("data/gapminder.csv")
filtered_data <- select(gapminder, country, year, pop)
filtered_data
#testing pipe %>% 
filter(gapminder, country == "Australia", year >= 1997)
# testing pipe
gapminder %>% filter(country == "Australia", year >= 1997)
# reasoning challenge 1
filtered_data <- filter(gapminder, country == "Australia", year, pop)
glimpse(filtered_data)
view(filtered_data)
final_data <- select(filtered_data, country, year, pop)
view(final_data)
glimpse(final_data)
#select seems to work on a previously <- defined object, in this case derived from filtered_data
#challenge 2
gapminder %>% filter(country == "Australia", year >= 1997)

# combining
# challenge 3
gapminder %>% select(country, year, pop) %>% filter(country == "Australia")
# columns were selected first. Rows were filtered after.
#renaming pop = population
gapminder %>% select(country, year, population = pop) %>% filter(country == "Australia")
#or
gapminder %>% select(country, year, pop) %>% filter(country == "Australia") %>% rename(population = pop)
# to keep the output as a variable, a name must be assigned
data_for_Australia <- gapminder %>% select(country, year, pop) %>% filter(country == "Australia") %>% rename(population = pop)
glimpse(data_for_Australia)
#one line steps
data_for_Aust <- gapminder %>% 
  select(country, year, pop) %>% 
  filter(country == "Australia") %>% 
  rename(population = pop)
rm(data_for_Australia)
# pre-challenge 4
gapminder
data_1972 <- gapminder %>%
  filter(year == 1972) %>% 
  arrange(desc(pop)) %>%
  filter(pop >= 100000000)
head(data_1972, 1)

#Challenge 4
#for lifeExp for 1987
gapminder
data_1987 <- gapminder %>%
  filter(year == 1987) %>% 
  arrange(desc(lifeExp))
head(data_1987, 10)

#for lifeExp for 2007
gapminder
data_2007 <- gapminder %>%
  filter(year == 2007) %>% 
  arrange(desc(lifeExp))
head(data_2007, 10)

