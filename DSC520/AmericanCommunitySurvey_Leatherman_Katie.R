library(ggplot2)
theme_set(theme_dark())
setwd("~/Bellevue Local/520/dsc520")
survey <- read.csv('data/acs-14-1yr-s0201.csv')
#open and read csv file as 'survey'

str(survey)

#Elements of the data consist of ID numbers (strings), geographical regions (strings), 
#population IDs (binary/boolean), races (seem to be strings of numbers), 

nrow(survey)
ncol(survey)

HShist <- ggplot(survey, aes(HSDegree)) + geom_histogram(bins = 20, aes(y = ..density..)) + ggtitle('Rates of High School Graduation by County') + xlab('Percent of population who obtained a degree') + ylab('Number of counties')

#The data is unimodal, there is one peak. 
#The distribution is not quite symmetrical, it skews left
#The data is not quite bell-shaped due to the skew
#It is not approximately normal, due to the skew
#There is a negative skew

HShist + stat_function(fun = dnorm, args = list(mean = mean(survey$HSDegree), sd = sd(survey$HSDegree)), colour = 'black', size = 1)

library(qqplotr)
ggplot(mapping = aes(sample = survey$HSDegree)) + stat_qq_point(size = 2)

#The plot is close to normal. A normal distribution shows as a straight diagonal line in a probability plot.
#A skewed plot will present a curve to the probability plot, as this one does.

library(pastecs)
stat.desc(survey$HSDegree)

library(psych)
describe(survey$HSDegree)

#Skew is listed as -1.67, which indicates that the data is highly skewed (<-1.67)
#Kurtosis is 4.35, which indicates a heavily peaked distribution.
#Z-score simply measures the distance of one input from the mean in standard deviations. This give a pure number measurement of how far off that observation is.
#Increasing the sample size generally will decrease the skew and kurtosis numbers. As datasets become larger, they tend more and more towards normal.
#As datasets get smaller, more skew and kurtosis generally appears.
