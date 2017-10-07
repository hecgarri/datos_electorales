rm(list = ls())

if (!require(maptools)) install.packages("maptools"); require(maptools)
if (!require(ggmap)) install.packages("ggmap"); require(ggmap)
if (!require(RColorBrewer)) install.packages("RcolorBrewer"); require(RColorBrewer)
if (!require(foreign)) install.packages("forecast"); require(forecast)


distritos_dat = read.dbf("/home/hector/GoogleDriveUBB/OLR Ñuble - Observatorio laboral de Ñuble/Bases de datos/Cartografia Digital CENSO/R08/Distritos_Censales.dbf")
distritos=readShapePoly("/home/hector/GoogleDriveUBB/OLR Ñuble - Observatorio laboral de Ñuble/Bases de datos/Cartografia Digital CENSO/R08/Manzana_Precensal.shp")

class(distritos)

str(distritos@data)

distritos = subset(distritos, COMUNA==8401)
plot(distritos)


colors <- brewer.pal(9, "BuGn")

mapImage <- get_map(location = c(lon = -72.1023351, lat = -36.60626179999999),
                    color = "color",
                    source = "google",
                    # maptype = "terrain",
                    zoom = 14)

area.points <- fortify(distritos)

ggmap(mapImage) +
  geom_polygon(aes(x = long,
                   y = lat,
                   group = id),
               data = area.points,
               color = colors[9],
               fill = colors[5],
               alpha = 0.5) +
  labs(x = "Longitude",
       y = "Latitude")