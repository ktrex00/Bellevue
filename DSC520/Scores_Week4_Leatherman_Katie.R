#First assignment
setwd("~/Bellevue Local/520/dsc520")
library(ggplot2)
scores <- read.csv('data/scores.csv')
str(scores)

#The observational unit here is a student
#Variables mentioned are which section (categorical), total points (quantitative), and count (qualitative, assuming this is the number of students who acheived that score in the section)

regular <- subset(scores, Section == 'Regular', select = c("Count", "Score"))
sports <- subset(scores, Section == 'Sports', select = c("Count", "Score"))

ggplot(regular, aes(Score, Count)) + geom_point() + ggtitle('Student Scores in Regular Section') + xlab('Total Class Score') + ylab('Amount of Students')
ggplot(sports, aes(Score, Count)) + geom_point() + ggtitle('Student Scores in Sports Section') + xlab('Total Class Score') + ylab('Amount of Students')

#Looking at the graphs, it appears that more students scored higher in the Regular section, as it is skewed left
#The regular section indeed had students score higher than every other student in the sports section.
#The middle point of the regular graph lies farther to the right than that of the sports graph.
#I think an additional variable would easily be whether or not the students are familiar with sports, or if they themselves are athletes. If they aren't familiar with sports, the examples may not help them in the sports section.


#Second Assignment

library(readxl)
housing <- read_excel('data/week-6-housing.xlsx')
str(housing)
apply(housing['Sale Price'], 2, mean)
aggregate(housing$`Sale Price`, list(housing$year_built), mean)
library(plyr)
ddply(housing, ~year_built, summarize, yearly_price_mean=mean(bedrooms))

library(fitdistrplus)
descdist(housing$`Sale Price`)

ggplot(housing, aes(bedrooms)) + geom_histogram(bins=12)
ggplot(housing, aes(bath_full_count)) + geom_histogram(bins=25)
#Bedrooms and housing have normal distributions

ggplot(housing, aes(x = year_built, y = housing$`Sale Price`)) + geom_point()
#This plot is skewed left with a few outliers, especially in high prices from homes in the 30s on.

housing$house_age <- 2022 - housing$year_built
housing$total_bath <- (housing$bath_3qtr_count * .75) + housing$bath_full_count + (housing$bath_half_count * .5)
str(housing)
