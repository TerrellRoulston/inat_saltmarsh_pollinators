# Downloading Research Grade iNaturalists occurrences of 11 NS Salt Marsh species
# Author: Terrell Roulston
# 2025-03-13

# Top ---------------------------------------------------------------------
library(tidyverse)
library(rgbif)

# GBIF user info
user='REDACTED'
pwd='REDACTED'
email='REDACTED'

### Taxon Keys
# Sporobolus michauxianus = 9592414
# Sporobolus alterniflorus = 9394776
# Sporobolus pumilus = 9478836 
# Juncus gerradii = 6413621
# Juncus balticus = 2702048
# Distichlis spicata = 2704509
# Carex paleacea = 2727181 
# Carex hormathodes = 2729422
# Festuca rubra = 2704922
# Plantago maritima = 3189755
# Salicornia maritima = 5383953
# Triglochin maritima = 2865368
# Suaeda maritima = 3083541
# Atriplex glabriuscula = 3083660
# Atriplex patula = 3083728
# Iva frutescens = 5402625

# Sporobolus michauxianus = 9592414 ---------------------------------------
taxonKey <- 9592414
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

# Download data
# Use 'pred()' if there is a single argument, or 'pred_in()' if there are multiple
down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_spo_mic <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/spo_mic")

# Sporobolus alterniflorus = 9394776 --------------------------------------
taxonKey <- 9394776
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_spo_alt <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/spo_alt")


# Sporobolus pumilus = 9478836 --------------------------------------------
taxonKey <- 9478836
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_spo_pum <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/spo_pul")


# Juncus gerradii = 6413621 -----------------------------------------------
taxonKey <- 6413621
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_jun_ger <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/jun_ger")


# Juncus balticus = 2702048 -----------------------------------------------
taxonKey <- 2702048
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_jun_ger <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/jun_bal")

# Distichlis spicata = 2704509 --------------------------------------------
taxonKey <- 2704509
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_dis_spi <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/dis_spi")


# Carex paleacea = 2727181 ------------------------------------------------
taxonKey <- 2727181
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_car_pal <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/car_pal")


# Carex hormathodes = 2729422 ---------------------------------------------
taxonKey <- 2729422
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_car_pal <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/car_hor")


# Festuca rubra = 2704922 -------------------------------------------------
taxonKey <- 2704922
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_fus_rub <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/fes_rub")


# Agrostis stolonifera = 2706435 ------------------------------------------
taxonKey <- 2706435
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_fus_rub <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/agr_sto")


# Plantago maritima = 3189755 ---------------------------------------------
taxonKey <- 3189755
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_pla_mar <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/pla_mar")


# Salicornia maritima = 5383953 -------------------------------------------
taxonKey <- 5383953
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_sal_mar <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/sal_mar")


# Triglochin maritima = 2865368 -------------------------------------------
taxonKey <- 2865368
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_tri_mar <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/tri_mar")


# Suaeda maritima = 3083541 -----------------------------------------------
taxonKey <- 3083541
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_sau_mar <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/sau_mar")

# Atriplex glabriuscula = 3083660 -----------------------------------------
taxonKey <- 3083660
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_atr_gla <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/atr_gla")

# Atriplex patula = 3083728 -----------------------------------------------
taxonKey <- 3083728
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_atr_pat <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/atr_pat")

# Iva frutescens = 5402625 ------------------------------------------------
taxonKey <- 5402625
basisOfRecord <- c('HUMAN_OBSERVATION') # Human Observation for iNaturalist ONLY 
hasCoordinates <- TRUE # limit to records with coordinates

down_code = occ_download(
  pred("taxonKey", taxonKey),
  pred("basisOfRecord", basisOfRecord),
  pred("hasCoordinate", hasCoordinates),
  #pred_in("countryCode", years),
  format = "SIMPLE_CSV",
  user=user, pwd=pwd, email=email)


occ_download_wait(down_code)
download_iva_fru <- occ_download_get(down_code[1], overwrite = TRUE, path = "./occ_data/iva_fru")