library(dplyr)
library(readxl)
housing <- read_excel('data/week-6-housing.xlsx')
str(housing)
names(housing)[names(housing) == 'Sale Price'] <- 'sale_price'
names(housing)[names(housing) == 'Sale Date'] <- 'sale_date'

by_year <- housing %>% group_by(year_built)
str(by_year)

by_year %>% summarize(n())

housing_remodeled <- housing %>% filter(year_renovated != 0)
housing_remodeled$year_renovated

housing <- housing_remodeled %>% mutate(years_before_remodel = year_renovated - year_built)
housing$years_before_remodel

housing %>% select(sq_ft_lot, bedrooms)

by_year %>% arrange(desc('Sale Price'))

library(purrr)
has_element(housing$year_built, 1971)

compact(housing$ctyname)

current_year <- list(rep(2022, 169))
current_housing <- cbind(housing, current_year)
str(current_housing)
new_house <- c('2007-06-11', 890000, 1, 3, NA, 'R1')
new_housing <- rbind(housing, new_house)
str(new_housing)

test_string <- "This is a test string. A sentence for me to experiment on!"

library(stringr)
split <- str_split(test_string, "\\. ")
split
paste(split)
