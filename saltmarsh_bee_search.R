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
user='REDACTED'
pwd='REDACTED'
email='REDACTED'

# Only select for inaturalsit observations
# iNaturalist Research-grade Observations dataset key
inat_key <- "50c9509d-22c7-4a22-a47d-8c48425ef4a7"


# Apidae ------------------------------------------------------------------
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


# Halictidae --------------------------------------------------------------
halictidae_key <- name_backbone(name = "Halictidae")$usageKey

gbif_hal <- occ_download(
  pred("datasetKey", inat_key),
  pred("taxonKey", halictidae_key),
  pred("country", "CA"),
  pred("stateProvince", "Nova Scotia"),
  pred("hasCoordinate", TRUE),
  format = "SIMPLE_CSV",
  user = user, pwd = pwd, email = email
)

occ_download_wait(gbif_hal)
download_hal <- occ_download_get(gbif_hal[1], overwrite = TRUE, path = "./occ_data/halictidae")

df_halictidae <- occ_download_import(download_hal)

vect_halictidae <- vect(df_halictidae, geom=c('decimalLongitude', 'decimalLatitude'), crs =  "EPSG:4326")
buffer_halictidae <- buffer(vect_halictidae, width = 300)

vect_halictidae_marsh <- terra::intersect(vect_halictidae, ns_marsh)

df_halictidae_marsh <- terra::as.data.frame(vect_halictidae_marsh)
# 6 photos and not one on a salt marsh grass

# Andrenidae --------------------------------------------------------------
andrenidae_key <- name_backbone(name = "Andrenidae")$usageKey

gbif_and <- occ_download(
  pred("datasetKey", inat_key),
  pred("taxonKey", andrenidae_key),
  pred("country", "CA"),
  pred("stateProvince", "Nova Scotia"),
  pred("hasCoordinate", TRUE),
  format = "SIMPLE_CSV",
  user = user, pwd = pwd, email = email
)

occ_download_wait(gbif_and)
download_and <- occ_download_get(gbif_and[1], overwrite = TRUE, path = "./occ_data/andrenidae")

df_andrenidae <- occ_download_import(download_and)

vect_andrenidae <- vect(df_andrenidae, geom=c('decimalLongitude', 'decimalLatitude'), crs =  "EPSG:4326")
buffer_andrenidae <- buffer(vect_andrenidae, width = 300)

vect_andrenidae_marsh <- terra::intersect(vect_andrenidae, ns_marsh)

df_andrenidae_marsh <- terra::as.data.frame(vect_andrenidae_marsh)
# one bee not on grass

# Colletidae --------------------------------------------------------------

colletidae_key <- name_backbone(name = "Colletidae")$usageKey

gbif_col <- occ_download(
  pred("datasetKey", inat_key),
  pred("taxonKey", colletidae_key),
  pred("country", "CA"),
  pred("stateProvince", "Nova Scotia"),
  pred("hasCoordinate", TRUE),
  format = "SIMPLE_CSV",
  user = user, pwd = pwd, email = email
)

occ_download_wait(gbif_col)
download_col <- occ_download_get(gbif_col[1], overwrite = TRUE, path = "./occ_data/colletidae")

df_colletidae <- occ_download_import(download_col)

vect_colletidae <- vect(df_colletidae, geom=c('decimalLongitude', 'decimalLatitude'), crs =  "EPSG:4326")
buffer_colletidae <- buffer(vect_colletidae, width = 300)

vect_colletidae_marsh <- terra::intersect(vect_colletidae, ns_marsh)

df_colletidae_marsh <- terra::as.data.frame(vect_colletidae_marsh)
# not colleditdae in marsh

# Megachilidae ------------------------------------------------------------
megachilidae_key <- name_backbone(name = "Megachilidae")$usageKey

gbif_meg <- occ_download(
  pred("datasetKey", inat_key),
  pred("taxonKey", megachilidae_key),
  pred("country", "CA"),
  pred("stateProvince", "Nova Scotia"),
  pred("hasCoordinate", TRUE),
  format = "SIMPLE_CSV",
  user = user, pwd = pwd, email = email
)

occ_download_wait(gbif_meg)
download_meg <- occ_download_get(gbif_meg[1], overwrite = TRUE, path = "./occ_data/megachilidae")

df_megachilidae <- occ_download_import(download_meg)

vect_megachilidae <- vect(df_megachilidae, geom=c('decimalLongitude', 'decimalLatitude'), crs =  "EPSG:4326")
buffer_megachilidae <- buffer(vect_megachilidae, width = 300)

vect_megachilidae_marsh <- terra::intersect(vect_megachilidae, ns_marsh)

df_megachilidae_marsh <- terra::as.data.frame(vect_megachilidae_marsh)
# no megachiladae in marsh


# Syrphidae ---------------------------------------------------------------
syrphidae_key <- name_backbone(name = "Syrphidae")$usageKey

gbif_syr <- occ_download(
  pred("datasetKey", inat_key),
  pred("taxonKey", syrphidae_key),
  pred("country", "CA"),
  pred("stateProvince", "Nova Scotia"),
  pred("hasCoordinate", TRUE),
  format = "SIMPLE_CSV",
  user = user, pwd = pwd, email = email
)

occ_download_wait(gbif_syr)
download_syr <- occ_download_get(gbif_syr[1], overwrite = TRUE, path = "./occ_data/syrphidae")

df_syrphidae <- occ_download_import(download_syr)

vect_syrphidae <- vect(df_syrphidae, geom=c('decimalLongitude', 'decimalLatitude'), crs =  "EPSG:4326")
buffer_syrphidae <- buffer(vect_syrphidae, width = 300)

vect_syrphidae_marsh <- terra::intersect(vect_syrphidae, ns_marsh)

df_syrphidae_marsh <- terra::as.data.frame(vect_syrphidae_marsh)

# 15 total observations
# mostly on flowers, a few on leaves and one on mud flat
# none on wind pollinated plant
