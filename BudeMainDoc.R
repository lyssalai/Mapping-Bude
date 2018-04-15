library(tidyverse)
library(ggmap)
library(maps)

register_google(key = "AIzaSyDFMjfgtEEKepiYLNu5dDtV5B8n7YvDKuM")

#Watercolour Bude Map
watercolour <- get_map(location = "Bude", zoom = 15, maptype = "watercolor")
ggmap(watercolour)

#Roadmap of Bude
roads <- get_map(location = c(-4.543678, 50.82664), zoom = 14)
ggmap(roads)

#Beaches
names1 <- data.frame(location = c("The Beach at Bude", "Summerleaze Beach"),
                        values = c(10,10),
                        stringsAsFactors = FALSE)
locs1 <- geocode(names$location)
names1 <- cbind(names, locs1)
names1 <- names1[, colSums(is.na(df)) != nrow(df)]

ggmap(roads) +
  geom_point(data = names1,
             aes(x = lon, y = lat, size = values),
             color = "black",
             size = 3) +
  geom_text(data = names1,
            aes(x = lon, y = lat, label = location),
            color = "red",
            size = 3)

ggmap(watercolour) +
  geom_point(data = names1,
             aes(x = lon, y = lat, size = values),
             color = "black",
             size = 3) +
  geom_text(data = names1,
            aes(x = lon, y = lat, label = location),
            color = "red",
            size = 3)

#Bude North Cornwall Cricket Club to Kings Arms
from <- "Bude North Cornwall Cricket Club, Bude"
to <- "Crooklets Inn, Bude"

path <- route(start, end, structure = "route")
path_df <- na.omit(data.frame(path))

names2 <- data.frame(location2 = c("Bude North Cornwall Cricket Club", "Crooklets Inn"),
                     values = c(15, 15),
                     stringsAsFactors = FALSE)
locs2 <- geocode(names2$location2)
names2 <- cbind(names2, locs2)

ggmap(roads) +
  geom_path(data = path_df,
            aes(x = lon, y = lat),
            color = "blue",
            size = 1,
            lineend = "round") +
  geom_point(data = names2,
             aes(x = lon, y = lat, size = values),
             color = "black",
             size = 1) +
  geom_text(data = names2,
            aes(x = lon, y = lat, label = location2),
            color = "red",
            size = 2)



