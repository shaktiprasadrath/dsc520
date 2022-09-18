# Assignment: ASSIGNMENT 3
# Name: Rath, Shakti
# Date: 2022-09-18

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/shakr/OneDrive/Desktop/shakti-data/shakti/Rcode/dsc520")

## Load the `data/r4ds/heights.csv` to
acs_df <- read.csv("data/acs-14-1yr-s0201.csv")

## i. List the name of each field and what you believe the data type and 
##intent is of the data included in each field (Example: Id - Data Type: varchar (contains text and numbers) 
##Intent: unique identifier for each row)
str(acs_df)
## ii. Run the following functions and provide the results: str(); nrow(); ncol()
nrow(acs_df)
ncol(acs_df)

## iii. Create a Histogram of the HSDegree variable using the ggplot2 package.
## 1.Set a bin size for the Histogram that you think best visuals the 
##data (the bin size will determine how many bars display and how wide they are)
## 2.Include a Title and appropriate X/Y axis labels on your Histogram Plot.
ggplot(acs_df, aes(x = HSDegree)) + 
  geom_histogram(bins = 35) + 
  ggtitle("High School Degree") + 
  xlab("HSDegree(Percentages)") + 
  ylab("Number of Students(Counts)")

## iv. Answer the following questions based on the Histogram produced:
## 1.Based on what you see in this histogram, is the data distribution unimodal?
##[Answer]: No

## 2.Is it approximately symmetrical?
##[Answer]: No

## 3.Is it approximately bell-shaped?
##[Answer]: No

## 4.Is it approximately normal?
##[Answer]: No

## 5.If not normal, is the distribution skewed? If so, in which direction?
##[Answer]: It is Left Skewed distribution.

## 6.Include a normal curve to the Histogram that you plotted.
ggplot(acs_df, aes(x = HSDegree)) + 
  geom_histogram(aes(y = ..density..), colour="black", fill="white") + 
  ggtitle("High School Degree") + 
  xlab("HSDegree(Percentages)") + 
  ylab("Number of Students(Counts)") +
  stat_function(fun = dnorm, args = list(mean = mean(acs_df$HSDegree), sd = sd(acs_df$HSDegree)))

## 7.Explain whether a normal distribution can accurately be used as a model for this data
##[Answer]: Yes. A normal distribution can be accurately used. The normal distribution is a mount-shaped, unimodal and symmetric distribution where most measurements gather around the mean

## v. Create a Probability Plot of the HSDegree variable
ggplot(acs_df, aes(sample = HSDegree)) + stat_qq() + stat_qq_line()

## vi. Answer the following questions based on the Probability Plot:
## 1.Based on what you see in this probability plot, is the distribution approximately normal? 
##Explain how you know
##[Answer]: It is not normal distribution. The data provided in this datset is not forming a straight. 
## So, it is not a normal distribution

## 2. If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
##[Answer]: Yes it is Left Skewed


## vii. Now that you have looked at this data visually for normality, 
## you will now quantify normality with numbers using the stat.desc() function. 
## Include a screen capture of the results produced.
library(pastecs)
stat.desc(acs_df)

## viii. In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. 
## In addition, explain how a change in the sample size may change your explanation?
library(moments)
skewness(x = acs_df$HSDegree)
##[Answer]: skewness is negative, this indicates that the distribution is left-skewed. 
##This confirms what we saw in the histogram

kurtosis(acs_df$HSDegree)
##[Answer]: kurtosis is greater than 3, this indicates that the distribution has more values in the tails 
##compared to a normal distribution.
mdata<-mean(acs_df$HSDegree)
sdata<-sd(acs_df$HSDegree)
z_score<-(acs_df$HSDegree-mdata)/sdata
print(z_score)




