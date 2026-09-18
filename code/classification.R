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

base <- list.files("/Volumes/Thesis/Epstein_Files", recursive = FALSE, full.names = TRUE)
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
  file_lengths <- mapply(page_count, files)
  file_types  <- mapply(identification, files)
  
  # Create Descriptive Tibble
  doc_type <- tibble(
    file_name   = basename(files),
    file_origin = basename(folder),
    file_length = file_lengths,
    file_type   = file_types
  )
  
  # Create Email Tibble
  is_email <- file_types == "email"
  email_text <- tibble(
    file_name = basename(files)[is_email],
    file_origin = basename(folder),
    text      = file_extractions[is_email]
  )
  
  # export Descriptive Tibble
  write_csv(doc_type,
            file = file.path(output, paste0("doc_type_", basename(folder), ".csv")))
  # export Email Tibble
  write_csv(email_text,
            file = file.path(output, paste0("email_text_", basename(folder), ".csv")))
  
  message("Export Complete!")
}

