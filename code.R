library(readxl)      #for excel, csv sheets manipulation
library(sdcMicro)    #sdcMicro package with functions for the SDC process 
library(tidyverse)   #optional #for data cleaning

#Import data
setwd("C:/Users/LENOVO T46OS/Desktop/sdc-disability_education_assessment_microdata")
data <- read_excel("data.xlsx", sheet = "FINAL")

#UNICEF microdata
selectedKeyVars <- c('Are_you_Syrian', 'current_country', 
                     'country', 'Governorate',	'District',
                     'camp', 'age',	'relationship',	'Gender'
                     )

#Convert variables into factors
cols =  c('Are_you_Syrian', 'current_country', 
          'country', 'Governorate',	'District',
          'camp', 'age',	'relationship',	'Gender')
data[,cols] <- lapply(data[,cols], factor)

#Convert the sub file into dataframe
fileRes<-data[,selectedKeyVars]
fileRes <- as.data.frame(fileRes)
objSDC <- createSdcObj(dat = fileRes, 
                       keyVars = selectedKeyVars
                       )

#Generating an internal (extensive) report
print(objSDC, 'risk')
report(objSDC, filename = "index", internal = TRUE) 


