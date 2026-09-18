# =============================================================================
# Libraries
# =============================================================================
library(pdftools)
library(tibble)
library(tidyverse)

# =============================================================================
# Import Classification Functions
# =============================================================================
source("/Volumes/Thesis/code/classification_functions.R")

# =============================================================================
# Define variables
# =============================================================================

base <- list.files("/Volumes/Thesis/Oversight_Committee_Files", recursive = FALSE, full.names = TRUE)
output <- "/Volumes/Thesis/Epstein_Files/output"

# exclude output from base or will return an error
base <- base[!grepl("output", base)]

# =============================================================================
# Loop Over Files
# =============================================================================

for (folder in base) {
  
  files <- list.files(folder, full.names = TRUE, recursive = FALSE)
  
  message("Processing folder: ", basename(folder))
  
  file_extractions  <- mapply(extraction, files)
  
  
  # Create Email Tibble
  extraction_text <- tibble(
    file_name = basename(files),
    file_origin = basename(folder),
    text      = file_extractions
  )
  
  # export Email Tibble
  write_csv(extraction_text,
            file = file.path(output, paste0("extraction_", basename(folder), ".csv")))
  
  message("Export Complete!")
}
