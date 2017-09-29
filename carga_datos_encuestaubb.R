rm(list=ls())
if (!require(tidyverse)) installed.packages("tidyverse"); require(tidyverse)
if (!require(survey)) installed.packages("survey"); require(survey)
if (!require(readxl)) installed.packages("readxl"); require(readxl)

encuesta_ubb <- read_excel("~/GoogleDrivePersonal/Política/Datos/datos_electorales/Encuesta UBB/Base Completa.xlsx")
table(encuesta_ubb$Sector)

source('análisis_encuesta_ubb.R')
source('cuadro_1.R')