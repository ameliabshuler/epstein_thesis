# =============================================================================
# Libraries
# =============================================================================
library(tidyverse)

# =============================================================================
# Point to Files
# =============================================================================
emails <- read_csv("/Volumes/Thesis/Epstein_Files/output/email_text_combined.csv",
                   col_types = list(file_name = col_character(), file_origin = col_character(), body = col_character()))

# =============================================================================
# Import Cleanup Functions
# =============================================================================
source("/Volumes/Thesis/code/cleanup_functions.R")

# =============================================================================
# Split and Cleanup
# =============================================================================
split <- emails |>
  # splits multiple emails in one file into separate files
  # Email Header pattern
  mutate(body = map(body, header_pattern)) |>
  unnest(body) |>
  # On <date>, <person> wrote pattern
  mutate(body = str_split(body, quote_pattern)) |>
  unnest(body) |>
  filter(body != "") |>
  # simplifying spacing
  mutate(
    body = str_replace_all(body, "\r\n?", "\n")) |>
  # FOR HEADER PATTERN
  mutate(
    from = extract_field(body, "From:"),
    body = remove_field(body, "From:"),
    to = extract_field(body, "To:"),
    body = remove_field(body, "To:"),
    subject = extract_field(body, "Subject:"),
    body = remove_field(body, "Subject:"),
    date = extract_field(body, "Date:"),
    body = remove_field(body, "Date:"),
    sent = extract_field(body, "Sent:"),
    body = remove_field(body, "Sent:"),
    cc = extract_field(body, "Cc:"),
    body = remove_field(body, "Cc:"),
    attachments = extract_field(body, "Attachments:"),
    body = remove_field(body, "Attachments:"),
    inline_images = extract_field(body, "Inline-Images:"),
    body = remove_field(body, "Inline-Images:"),
    importance = extract_field(body, "Importance:"),
    body = remove_field(body, "Importance:"),
    embedded = extract_field(body, "Embedded:"),
    body = remove_field(body, "Embedded:"),
    priority = extract_field(body, "Priority:"),
    body = remove_field(body, "Priority:")) |>
  # FOR ON <DATE>, <PERSON> WROTE PATTERN
  mutate(
    # splits out date field
    date_2 = str_extract(body, r"([A-Z][a-z]{2,8}\s+\d{1,2},\s+\d{4},\s+at\s+\d{1,2}:\d{2}\s*[AP]M)"),
    # splits out from field
    from_2 = str_extract(body, r"((?<=[AP]M,\s).*?(?=\s+wrote:))"),
    # removes from body
    body = str_remove(body, r"(On\s+[A-Z][a-z]{2,8}\s+\d{1,2},\s+\d{4},\s+at\s+\d{1,2}:\d{2}\s*[AP]M,.*?\s+wrote:)")
  ) |>
  # gets rid of rows such as EXHIBIT N EFTA00039802
  filter(
    !(str_length(body) <= 50 & str_detect(body, r"(EFTA\d{8})"))) |>
  # filters out EFTA00039802 in emails
  mutate(
    body = str_remove(body, fixed(file_name)),
    body = str_remove_all(body, "EFTA\\d{8}"),
    body = str_trim(body)
  ) |>
  # unite the three date columns
  unite("date", date, sent, date_2, sep = " ", remove = TRUE) |>
  mutate(date = str_remove_all(date, "NA "),
         date = str_remove_all(date, " NA"),
         date = str_remove_all(date, r"(EFTA\d{8})"),
         date = str_replace(date, "NA", NA_character_)) |>
  # unite the two from columns
  unite("from", from, from_2, sep = " ", remove = TRUE) |>
  mutate(from = str_remove_all(from, "NA "),
         from = str_remove_all(from, " NA"),
         from = str_replace(from, "NA", NA_character_)) |>
  mutate(body = str_replace_all(body, r"(\ {8,})", " [REDACTED] "),
         from = str_replace_all(from, r"(\ {8,})", " [REDACTED] "),
         to = str_replace_all(to, r"(\ {8,})", " [REDACTED] "),
         subject = str_replace_all(subject, r"(\ {8,})", " [REDACTED] "),
         cc = str_replace_all(cc, r"(\ {8,})", " [REDACTED] "),
         attachments = str_replace_all(attachments, r"(\ {8,})", " [REDACTED] "),
         inline_images = str_replace_all(inline_images, r"(\ {8,})", " [REDACTED] "),
         importance = str_replace_all(importance, r"(\ {8,})", " [REDACTED] "),
         embedded = str_replace_all(embedded, r"(\ {8,})", " [REDACTED] "),
         priority = str_replace_all(priority, r"(\ {8,})", " [REDACTED] "))

write_csv(split, "/Volumes/Thesis/Epstein_Files/output/email_text_clean.csv")