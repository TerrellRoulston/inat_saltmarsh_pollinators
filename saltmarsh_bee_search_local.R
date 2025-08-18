# Download Bee, Syphid and Beetle 
library(tidyverse)
library(terra)
library(rgbif)
library(readr)

# Load Ecological Land Classification Data from NS Dept. Ag 2015 Survey
# https://nsgi.novascotia.ca/gdd/
ns_eco <- vect("C:/Users/terre/Documents/bees_saltmarsh_iNAT/FOR_ELC_2015_SHP_UT83/FOR_ELC_2015")

# Filter only salt marshes
ns_marsh <- subset(ns_eco, ns_eco$ELEMENT == 'Salt Marshes')
# Project to WGS84
ns_marsh <- project(ns_marsh, "EPSG:4326")
# Looks good
plot(ns_marsh)

# GBIF
# GBIF user info
user='terrell_roulston'
pwd='Malus123!'
email='terrellroulston@gmail.com'

# Only select for inaturalsit observations
# iNaturalist Research-grade Observations dataset key
inat_key <- "50c9509d-22c7-4a22-a47d-8c48425ef4a7"

# Apidae
# Start by getting the backbone for each taxon
apidae_key <- name_backbone(name = "Apidae")$usageKey

# Prepare Download
gbif_api <- occ_download(
    pred("datasetKey", inat_key),
    pred("taxonKey", apidae_key),
    pred("country", "CA"),
    pred("stateProvince", "Nova Scotia"),
    pred("hasCoordinate", TRUE),
  format = "SIMPLE_CSV",
  user = user, pwd = pwd, email = email
)

occ_download_wait(gbif_api)
download_api <- occ_download_get(gbif_api[1], overwrite = TRUE, path = "./occ_data/apidae")

# Read csvs into R
df_apidae <- occ_download_import(download_api)

#apidae_csv <- read_tsv("C:/Users/terre/Documents/R/inat_saltmarsh_pollinators/occ_data/apidae/0018928-250811113504898/0018928-250811113504898.csv")

vect_apidae <- vect(df_apidae, geom=c('decimalLongitude', 'decimalLatitude'), crs =  "EPSG:4326")
buffer_apidae <- buffer(vect_apidae, width = 300)

# Intersect marsh extext with GBIF records
vect_apidae_marsh <- terra::intersect(vect_apidae, ns_marsh) # Raw coordinates
buffer_apidae_marsh <- terra::intersect(buffer_apidae, ns_marsh) # with 300m buffer to acount for inaccuracy

# 61 records, non on grasses all on showy flowers or at ground level perhaps nesting.
df_apidae_marsh <- terra::as.data.frame(vect_apidae_marsh)
