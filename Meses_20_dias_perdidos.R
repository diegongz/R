library(lubridate,dplyr)

#I WANT TO MAKE LOOPS WITH NAMES INSIDE THE LOOP
 n<- c(1:12)
 meses<-month.abb[n] #convert the number of the month to it's abbrevation i.e 01->Jan
 
#' I want a vector with the month_20 so i want to use meses, and paste in every entry '_20'
 
 meses_20<-c()
 
#' Usage of the function paste
#' meses_20 would be a vector of the form 'month_20'
 for (i in 1:12) {
   meses_20[i]<- paste(meses[i],20,sep='_') 
 } 
 
#'Let's make a vector with the posibles mdates of 2020 from df
 
mdates<-table(df$mdate) #here mdates it's just a table, i can't work that much..
mdates<- as.data.frame(mdates) #Here I convert it to data frame, now i can work.
mdates$Var1<-as.character(mdates$Var1) #Convert to character the column i want


dates_20<-c()
for (i in 1:12) {
  dates_20[i]<- mdates$Var1[i+8]
}
 
#' Now i want to make their every month data frame from df, using the filtering
#' function. Use the 'Filtering_DataFrame' script for these part

#'I want to use the names from 'meses_20' to create new datas frames with names
#' meses_20[i] so first i need to create the empty data frames with the 
#' function sapply

#' sapply creates for every meses_20[i] a new empry data frame to work with
#' Its a LIST OF DATAFRAMES... THEN YOU NEED TO MAKE THEM INDIVUDUAL
lst <- sapply(meses_20, function(x) x=data.frame() )
str(lst)
 
 for (i in 1:12) {
   lst[[i]]<- filter(df, mdate==dates_20[i])
 }
#' Now we have created a list of data frames, now let´s extract the info i want
#' for every data frame in the list

for (i in 1:12) {
  print(paste('Mes:',i))
  print(paste('El mes tuvo:',days_in_month(as.Date(lst[[i]]$X[i], "%d/%m/%y")) ,'días'))
  print(table(lst[[i]]$X))
}

print('Información Septiembre 2021')
print(paste('El mes tuvo:',days_in_month(as.Date('01/09/21', "%d/%m/%y")) ,'días'))
print(table(sep_21$X))