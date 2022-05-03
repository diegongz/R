#Filtering a Data Frame
#In this script it's useful when yo want to filter information of a certain DF

#Call the data frame in which we are going to work
#'df' is the name of our data frame
# df give me montly info and i want only the info of one monh, for these I
# already apply floor_month to the months and create a mdate column

library(dplyr)

#I want a new data frame with the info only Jul-2020

jul_20<- filter(df, mdate=='2020-07-01')


#'Now i want to know which days in this month didn't recolected info
#' So i want to now all categories availoable in dates, this would tell me
#' if there's any missing day

table(jul_20$X) #These tell me all the posibles values taken in the column



