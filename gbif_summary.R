library(tidyverse)
library(vroom)

folder_path <- "C:/Users/terre/Documents/bees_saltmarsh_iNAT/bee_inat_down"
csv_files <- list.files(path = folder_path, pattern = "\\.csv$", full.names = TRUE)

inat_combined <- vroom(csv_files,
                       delim = "\t",
                       col_types = cols(.default = "c"),
                       locale = locale(encoding = "UTF-8"),
                       altrep = FALSE)

inat_filtered <- inat_combined %>%
  filter(institutionCode == "iNaturalist") %>%
  mutate(month = as.integer(month))

flowering_lookup <- tribble(
  ~species,                 ~flower_start, ~flower_end,
  "Sporobolus michauxianus", 6, 8,
  "Sporobolus alterniflorus",7, 9,
  "Sporobolus pumilus",      7, 8,
  "Juncus gerardi",         7, 8,
  "Juncus balticus",         6, 8,
  "Distichlis spicata",      6, 9,
  "Carex paleacea",          5, 7,
  "Carex hormathodes",       6, 8,
  "Festuca rubra",           5, 8,
  "Agrostis stolonifera",    5, 8,
  "Plantago maritima",       6, 9,
  "Salicornia maritima",     7, 10,
  "Triglochin maritima",     6, 8,
  "Suaeda maritima",         8, 10,
  "Atriplex glabriuscula",   8, 9,
  "Atriplex patula",         8, 9, 
)

obs_summary <- inat_filtered %>%
  filter(species %in% flowering_lookup$species) %>%
  left_join(flowering_lookup, by = "species") %>%
  mutate(in_flowering = month >= flower_start & month <= flower_end) %>%
  group_by(species) %>%
  summarise(
    total_obs = n(),
    flowering_obs = sum(in_flowering, na.rm = TRUE),
    .groups = "drop"
  )

print(obs_summary)
