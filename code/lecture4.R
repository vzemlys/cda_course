## R packages

library(lubridate)
library(tidyverse)

## Modifying strings

###Split

dt <- read.csv("data/time_series_19-covid-Confirmed.csv") 

nm <- colnames(dt)[5:31]

strsplit(nm, "/")

##1. Remove X
##2. Split the string by dot
##3. Add the 20 to the beginning of the third element for all the original elements
##4. Combine the strings to one string
##5. Have the vector which has a 20 in front of the year

dt <- read.csv("data/time_series_19-covid-Confirmed.csv") 

nm <- colnames(dt)[5:31]
nm1 <- gsub("X", "", nm)
nm2 <- strsplit(nm1, ".", fixed = TRUE)

nm3 <- nm2

for (i in 1:length(nm3)) {
    nm3[[i]][3] <- paste0("20", nm3[[i]][3]) 
}

nm4 <- nm3

for (i in 1:length(nm3)) {
    nm4[[i]] <- paste(nm4[[i]], collapse = ".") 
}

nm5 <- rep("", length(nm4))

for (i in 1:length(nm5)) {
    nm5[i] <- nm4[[i]]
}


sapply(strsplit(gsub("X", "" ,colnames(dt)[5:31]), ".", fixed = TRUE), function(x)
       paste(c(x[1:2],paste0("20",x[3])), collapse = "."))

##Use the pipes
library(dplyr)
colnames(dt)[5:31] %>% gsub("X", "", .) %>% strsplit(".", fixed = TRUE) %>% sapply(function(x) paste(c(x[1:2],paste0("20",x[3])), collapse = "."))


##Convert to the date 
library(lubridate)
s1 <- unlist(dt[1,5:31])
tm <- mdy(nm5)

plot(tm, s1, type = "l", xlab = "Date", ylab = "Number of cases", main = "Covid-19 in Anhui, China")

##Change the x axis date labels
Sys.getlocale()
Sys.setlocale(locale="lt_LT")

plot(tm, s1, type = "l", xlab = "Date", ylab = "Number of cases", main = "Covid-19 in Anhui, China")

##Calculate the growths

growth <- function(x) diff(x)/x[-length(x)]

g1 <- (s1[2:length(s1)]-s1[1:(length(s1)-1)])/s1[1:(length(s1)-1)]

g1 <- growth(s1)

##Add more lines to the graph

s2 <- unlist(dt[2,5:31])

lines(tm, s2, col = 2)
