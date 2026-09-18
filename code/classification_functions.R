# =============================================================================
# Libraries
# =============================================================================
library(pdftools)
library(tesseract)
library(tibble)

# =============================================================================
# Functions
# =============================================================================
page_count <- function(l) {
  ext <- tools::file_ext(l)
  
  # try catch helps with errors for corrupt PDFs
  if (ext == "pdf") {
    tryCatch(
      pdf_info(l)$pages,
      error = function(e) NA_integer_
    )
  } else if (ext %in% c("jpeg", "jpg", "png", "tif")) {
    1
    } else {
    NA_character_
  }
}

identification <- function(f) {
  ext <- tools::file_ext(f)
  
  # video identification
  if (ext %in% c("mp4", "MP4", "m4v", "avi", "vob", "ts")) { 
    "video"
  } else if (ext %in% c("wav", "m4a")) { 
    "audio"
  }  else if (ext %in% c("xlsx", "csv", "xls")) { 
    "other"
  } else if (ext == ("pdf")) {
    # try catch helps with errors for corrupt PDFs
    text <- tryCatch(
      pdftools::pdf_text(f),
      error = function(e) NA_character_
    )
    # error handling
    if (all(is.na(text))) {
      "corrupt"
    # email identification
    } else if (any(
        grepl(".*From:.* | .*From.*", text, ignore.case = TRUE) & 
        grepl(".*Subject:.* | .*Subject.*", text, ignore.case = TRUE) &
        grepl(".*Date:.* | .*Sent:.* | .*To:.*", text, ignore.case = TRUE) &
        !grepl(".*Memorandum.*", text, ignore.case = TRUE) &
        !grepl(".*Program Statement.*", text, ignore.case = TRUE)
        )) {
      "email"
      # photo identification
      } else if (sum(nchar(text)) <= 32) {
      "photo" 
      } else {
        "other"
      }
    # other file type handling
    } else if (ext %in% c("jpeg", "jpg", "png", "tif")) {
        
        # try catch helps with errors for corrupt PDFs
        text <- tryCatch(
          tesseract::ocr(f),
          error = function(e) NA_character_
        )
        
        # error handling
        if (all(is.na(text))) {
          "corrupt"
        # email identification
        } else if (any(grepl(".*From:.* | .*From.*", text, ignore.case = TRUE) & 
                       grepl(".*Subject:.* | .*Subject.*", text, ignore.case = TRUE) &
                       grepl(".*Date:.* | .*Sent:.* | .*To:.*", text, ignore.case = TRUE) &
                       !grepl(".*Memorandum.*", text, ignore.case = TRUE) &
                       !grepl(".*Program Statement.*", text, ignore.case = TRUE))) {
          "email"
        # photo identification
        } else if (sum(nchar(text)) <= 32) {
          "photo" 
        } else { 
      "other"
      }
  } else {
    "other"
  }
}

extraction <- function(e) {
  ext <- tools::file_ext(e)

  # try catch helps with errors for corrupt PDFs
  if (ext == "pdf") {
    tryCatch(
      paste(pdftools::pdf_text(e), collapse = " "),
      error = function(e) NA_character_
    )
    
  } else if (ext %in% c("jpeg", "jpg", "png", "tif")) {
    tryCatch(
      paste(tesseract::ocr(e), collapse = " "),
      error = function(e) NA_character_
    )
    } else {
    NA_character_
  }
}

extraction_tesseract <- function(e) {
    tryCatch(
      paste(tesseract::ocr(e), collapse = " "),
      error = function(e) NA_character_
    )
}