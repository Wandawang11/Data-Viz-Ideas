### Creating a spinning globe using Mapmate package
### Following Matthew Leonawicz's annual temperature example

# Wanda Wang
# Jan 3rd

# Install Package
# library(devtools)
# devtools::install_github("leonawicz/mapmate")

# Set-up
library(mapmate)
library(dplyr)
library(RColorBrewer)


data(annualtemps)
pal <- rev(brewer.pal(11, "RdYlBu"))

# create frameID as index for Year
temps <- mutate(annualtemps, frameID = Year - min(Year) + 1)
# subset to the first year of temp
frame1 <- filter(temps, frameID == 1)
id <- "frameID"

# create the flat map
save_map(frame1, z.name = "z", id = id, ortho = FALSE, 
         col = pal, type = "maptiles", 
         save.plot = FALSE, return.plot = TRUE)

# create the 3D map
save_map(frame1, z.name = "z", id = id, 
         col = pal, type = "maptiles",
         save.plot = FALSE, return.plot = TRUE)

