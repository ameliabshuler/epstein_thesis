library(RSelenium)
library(netstat)
library(rvest)
library(httr)
library(rstudioapi)

# ============================================================================
# STEP 1: set destination to external harddrive
# ============================================================================

if (Sys.info()["sysname"] == "Darwin") {
  base_drive_path <- "/Volumes/Thesis/Epstein_Files"
} else {
  base_drive_path <- "D:/Epstein_Files"
}

# ============================================================================
# STEP 2: save drivers
# ============================================================================

rs_driver <- rsDriver(browser = "firefox", port = free_port(), verbose = FALSE, 
                      check = FALSE, phantomver = NULL, chromever = NULL)
remDr <- rs_driver$client

tryCatch({
  base_url <- "https://www.justice.gov/epstein/doj-disclosures"
  remDr$navigate(base_url)
})
# ============================================================================
# STEP 3: Human needs to hit "I am not a robot" button
# ============================================================================

showDialog(
  title   = "Action Required",
  message = "Answer the question 'Are you 18 years of age or older?' in the browser window, then click OK here to continue."
)

# ============================================================================
# STEP 4: Handle cookies
# ============================================================================

# save the cookies
my_cookies <- remDr$getAllCookies()

# format the cookies for httr
final_cookies <- setNames(sapply(my_cookies, `[[`, "value"), sapply(my_cookies, `[[`, "name"))

# ----------------------------------------------------------------------------
# Cookie refresh helper: re-runs the age-verify flow in the live Selenium
# session and returns a fresh httr-formatted cookie vector. The age-verify
# cookie appears to expire somewhere in the 6-10hr range on long overnight
# runs, which silently produced /age-verify HTML saved as .pdf files.
# ----------------------------------------------------------------------------

refresh_session_cookies <- function(remDr, verify_url = "https://www.justice.gov/age-verify") {
  message("  [SESSION] Refreshing cookies via age-verify flow...")
  
  remDr$navigate(verify_url)
  Sys.sleep(2)
  
  # If age-verify presents a confirmation button/form, click through it.
  # Update this selector if the actual page markup differs.
  tryCatch({
    confirm_btn <- remDr$findElement(using = "css selector", "button[type='submit']")
    confirm_btn$clickElement()
    Sys.sleep(2)
  }, error = function(e) {
    message("  [SESSION] No confirm button found — page may auto-pass or selector needs updating")
  })
  
  refreshed_cookies <- remDr$getAllCookies()
  
  if (is.null(refreshed_cookies) || length(refreshed_cookies) == 0) {
    message("  [SESSION] Cookie refresh FAILED — no cookies returned, keeping old cookies")
    return(NULL)
  }
  
  new_final_cookies <- setNames(
    sapply(refreshed_cookies, `[[`, "value"),
    sapply(refreshed_cookies, `[[`, "name")
  )
  
  message("  [SESSION] Refreshed ", length(new_final_cookies), " cookies")
  new_final_cookies
}

# Detects whether a just-downloaded file is actually the age-verify
# interstitial page rather than the real file.
is_age_verify_response <- function(path) {
  con <- file(path, "rb")
  raw_bytes <- readBin(con, "raw", n = 500)
  close(con)
  
  body_start <- tryCatch(
    rawToChar(raw_bytes[raw_bytes != 00], multiple = FALSE),
    error = function(e) ""
  )
  
  # useBytes avoids locale/encoding warnings when body_start comes from
  # binary (non-text) file content, e.g. mp4/wav downloads
  grepl("age-verify", body_start, fixed = TRUE, useBytes = TRUE)
}

# ----------------------------------------------------------------------------
# Cross-device-safe move: tempfile() writes to the local disk, but
# dest_file lives on an external volume (different device), so
# file.rename() fails with "Cross-device link" and silently leaves the
# downloaded file stranded in the temp folder. file.copy() + file.remove()
# performs an actual byte copy instead of a filesystem-level move, so it
# works across devices.
# ----------------------------------------------------------------------------

safe_move <- function(src, dst) {
  ok <- file.copy(src, dst, overwrite = TRUE)
  if (ok) {
    file.remove(src)
  } else {
    warning("  [MOVE FAILED] Could not copy ", src, " to ", dst)
  }
  ok
}

# ----------------------------------------------------------------------------
# NEW: instead of matching a fixed whitelist of file extensions, decide
# whether a link is "a download" by asking the server what it actually is.
#
# Step A (cheap, no network calls): throw out anything that obviously
# isn't a candidate at all — JS triggers, in-page anchors, mailto/tel
# links, and links that just point back into the site's own page/
# pagination structure (these show up in the raw href list too, e.g.
# "?page=2" or another /epstein/doj-disclosures/... listing page).
#
# Step B (one HEAD request per surviving candidate): a real file download
# will report a Content-Type that is NOT text/html (application/pdf,
# image/*, video/*, application/vnd.openxmlformats-...,
# application/octet-stream, etc.), and often a Content-Disposition:
# attachment header. A link that actually routes to a rendered page will
# come back as text/html. HEAD fetches only the headers, not the body, so
# this is fast and never triggers/executes anything client-side (no JS is
# ever run — we're just inspecting an <a href> and its server response).
# ----------------------------------------------------------------------------

is_navigational_link <- function(href, base_url) {
  grepl("^javascript:", href, ignore.case = TRUE) ||
    grepl("^#", href) ||
    grepl("^(mailto|tel):", href, ignore.case = TRUE) ||
    grepl("\\?page=", href, ignore.case = TRUE) ||
    grepl("/epstein/doj-disclosures/?($|\\?|#)", href, ignore.case = TRUE) ||
    identical(href, base_url)
}

is_downloadable_link <- function(full_url, cookies, ua) {
  resp <- tryCatch(
    HEAD(full_url, config = set_cookies(.cookies = unlist(cookies)), user_agent(ua)),
    error = function(e) NULL
  )
  
  if (is.null(resp)) return(FALSE)
  
  ctype <- headers(resp)[["content-type"]]
  cdisp <- headers(resp)[["content-disposition"]]
  
  # No Content-Type at all is unusual for a real file server response —
  # treat as "not a download" rather than guessing.
  if (is.null(ctype)) return(FALSE)
  
  # An explicit attachment disposition is the clearest signal of a file.
  if (!is.null(cdisp) && grepl("attachment", cdisp, ignore.case = TRUE)) return(TRUE)
  
  # Otherwise, anything that isn't an HTML/plain page counts as a file.
  !grepl("^text/html", ctype, ignore.case = TRUE) &&
    !grepl("^text/plain", ctype, ignore.case = TRUE)
}

# ============================================================================
# STEP 5: Extract subpages
# ============================================================================

page_source <- remDr$getPageSource()[[1]]
all_hrefs <- html_attr(html_nodes(read_html(page_source), "a"), "href")
subpage_paths <- unique(all_hrefs[grepl("/epstein/doj-disclosures/", all_hrefs)])
subpage_urls <- ifelse(grepl("^http", subpage_paths), subpage_paths, paste0("https://www.justice.gov", subpage_paths))
subpage_urls <- subpage_urls[subpage_urls != base_url]

user_agent_string <- "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:124.0)"

# ============================================================================
# STEP 6: Create the download loop
# ============================================================================
for (sub_url in subpage_urls[1:length(subpage_urls)]) { 
  folder_base <- basename(sub_url)
  
  # --- FOLDER BUILDER ---
  
  subfolder_index <- 1L
  repeat {
    # make each subfolder as data-set-9-files-1
    candidate <- file.path(base_drive_path, paste0(folder_base, "-", subfolder_index))
    # if it exists and has 10,0000 files, make a new one
    if (!dir.exists(candidate) || length(list.files(candidate)) < 10000) break
    subfolder_index <- subfolder_index + 1L
  }
  current_dest_path <- candidate
  # if the folder doesn't exist, make it
  if (!dir.exists(current_dest_path)) dir.create(current_dest_path, recursive = TRUE)
  
  message("\n--- Entering Subpage: ", folder_base, " ---")
  message("  Saving to: ", current_dest_path)
  
  # --- DOWNLOAD FILES ---
  
  # this part is helpful if you don't run it in one sitting to be able to pick back
  # up from wherever you left off
  if (sub_url == subpage_urls[1]) { # change 1 to whatever to pick up halfway through
    start_url <- paste0(sub_url, "?page=0") # page_count minus 1
    page_count <- 1
  } else {
    start_url <- sub_url
    page_count <- 1
  }
  
  remDr$navigate(start_url)
  has_next_page <- TRUE
  
  # indicates where we are so you can see progress
  while (has_next_page) {
    message("  Processing Page ", page_count, "...")
    Sys.sleep(4) # Allow table to fully load/refresh
    
    # Extract all links from current page view
    sub_source <- remDr$getPageSource()[[1]]
    sub_page_html <- read_html(sub_source)
    all_sub_hrefs <- html_attr(html_nodes(sub_page_html, "a"), "href")
    all_sub_hrefs <- all_sub_hrefs[!is.na(all_sub_hrefs)]
    
    # Step A: drop obvious non-file links (JS, anchors, mailto/tel, and
    # links back into the site's own page/pagination structure)
    candidate_links <- all_sub_hrefs[!vapply(
      all_sub_hrefs, is_navigational_link, logical(1), base_url = sub_url
    )]
    candidate_links <- unique(candidate_links)
    
    # Step B: for each survivor, HEAD it and keep only true downloads
    pdf_links <- character(0)
    for (link in candidate_links) {
      full_check_url <- ifelse(grepl("^http", link), link, paste0("https://www.justice.gov", link))
      if (is_downloadable_link(full_check_url, final_cookies, user_agent_string)) {
        pdf_links <- c(pdf_links, link)
      }
    }
    
    # Download files found on THIS page (any file type, not just a fixed list)
    if(length(pdf_links) > 0) {
      for (pdf_url in pdf_links) {
        full_pdf_url <- ifelse(grepl("^http", pdf_url), pdf_url, paste0("https://www.justice.gov", pdf_url))
        file_name <- basename(full_pdf_url)
        
        # if the file exists already, skip its download
        already_exists <- any(sapply(seq_len(subfolder_index), function(i) {
          file.exists(file.path(base_drive_path, paste0(folder_base, "-", i), file_name))
        }))
        
        # if it doesn't exist, download it. but first check if subfolder is full   
        if (!already_exists) {
          # Roll over to a new subfolder if current one is full
          if (length(list.files(current_dest_path)) >= 10000) {
            subfolder_index <- subfolder_index + 1L
            current_dest_path <- file.path(base_drive_path, paste0(folder_base, "-", subfolder_index))
            dir.create(current_dest_path, recursive = TRUE)
            message("  [SUBFOLDER] Rolling over to: ", current_dest_path)
          }
          # print what is being saved   
          dest_file <- file.path(current_dest_path, file_name)
          tmp_path <- tempfile(fileext = tools::file_ext(file_name))
          message("    [SAVING] ", file_name)
          
          try({
            GET(full_pdf_url, config = set_cookies(.cookies = unlist(final_cookies)),
                user_agent(user_agent_string),
                write_disk(tmp_path, overwrite = TRUE))
            
            if (is_age_verify_response(tmp_path)) {
              message("    [AGE-VERIFY] Hit on: ", file_name, " — refreshing session and retrying")
              refreshed <- refresh_session_cookies(remDr)
              if (!is.null(refreshed)) {
                final_cookies <- refreshed
              }
              
              GET(full_pdf_url, config = set_cookies(.cookies = unlist(final_cookies)),
                  user_agent(user_agent_string),
                  write_disk(tmp_path, overwrite = TRUE))
              
              if (is_age_verify_response(tmp_path)) {
                message("    [AGE-VERIFY] Still failing after refresh — skipping: ", file_name)
                file.remove(tmp_path)
              } else {
                safe_move(tmp_path, dest_file)
              }
            } else {
              safe_move(tmp_path, dest_file)
            }
            
            Sys.sleep(1) # Polite pause
          })
        }
      }
    }
    
    # when last file is reached, check to see if page has "next" button
    next_button <- tryCatch({
      remDr$findElement(using = "xpath", "//span[contains(text(), 'Next')]/parent::a")
    }, error = function(e) {
      tryCatch({
        remDr$findElement(using = "xpath", "//a[@aria-label='Next page']")
      }, error = function(e) NULL)
    })
    # if there is a next button, click it and go to next page 
    if (!is.null(next_button)) {
      remDr$executeScript("arguments[0].scrollIntoView(true);", list(next_button))
      Sys.sleep(1)
      message("  [PAGINATION] Clicking 'Next' to move to Page ", page_count + 1)
      next_button$clickElement()
      page_count <- page_count + 1
      Sys.sleep(4) # Mandatory sleep for AJAX table refresh
    } else {
      # if there is no next button, print message and proceed to next suburl
      message("  [PAGINATION] Final page reached for this section.")
      has_next_page <- FALSE
    }
  }
}