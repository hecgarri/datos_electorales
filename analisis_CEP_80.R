library(foreign)
file = "~/GoogleDrivePersonal/Política/Datos/datos_electorales/Encuesta CEP 80 Jul-Ago 2017 v1.sav"
cep = read.spss(file)

labels = attr(cep, "variable.labels")

directorio = cbind(variables = names(cep),
                   description = labels)

rownames(directorio) = NULL

cep = data.frame(cep)
