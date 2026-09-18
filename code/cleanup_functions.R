# =============================================================================
# Email Header Identification Function
# =============================================================================
header_pattern <- function(e) {
  # From: is the reliable block-start signal
  from_positions <- str_locate_all(e, "From:|From")[[1]][, "start"]
  
  if (length(from_positions) <= 1) return(e)  # 0 or 1 From: -> nothing to split
  
  other_pattern <- "To:|Subject:|Date:|Sent:|Cc:|Importance:|Embedded:|Priority:|To|Subject|Date|Sent|Cc|Importance|Embedded|Priority"
  
  # for each From:, check ONLY the text right after it (local window)
  # -- this avoids the previous bug where nearby blocks got merged
  is_real_block_start <- sapply(from_positions, function(pos) {
    window_text <- str_sub(e, pos, pos + 400)
    length(str_extract_all(window_text, other_pattern)[[1]]) >= 2
  })
  
  split_points <- from_positions[is_real_block_start]
  split_points <- split_points[split_points > 1]  # skip block at start of string
  
  if (length(split_points) == 0) return(e)
  
  bounds <- c(1, split_points, nchar(e) + 1)
  pieces <- character(length(bounds) - 1)
  for (i in seq_len(length(bounds) - 1)) {
    pieces[i] <- str_sub(e, bounds[i], bounds[i + 1] - 1)
  }
  pieces
}
# =============================================================================
# On <date>, <person> wrote pattern Regex
# =============================================================================
quote_pattern <- regex(
  r"((?=On\s+[A-Z][a-z]{2,8}\s+\d{1,2},\s+\d{4},\s+at\s+\d{1,2}:\d{2}\s*[AP]M,.*?wrote:))",
  dotall = TRUE
)
# =============================================================================
# Extraction Functions
# =============================================================================

# =============================================================================
# Email Header Identification Function
# =============================================================================
header_pattern <- function(e) {
  # From: is the reliable block-start signal
  from_positions <- str_locate_all(e, "From:|From")[[1]][, "start"]
  
  if (length(from_positions) <= 1) return(e)  # 0 or 1 From: -> nothing to split
  
  other_pattern <- "To:|Subject:|Date:|Sent:|Cc:|Importance:|Embedded:|Priority:|To|Subject|Date|Sent|Cc|Importance|Embedded|Priority"
  
  # for each From:, check ONLY the text right after it (local window)
  # -- this avoids the previous bug where nearby blocks got merged
  is_real_block_start <- sapply(from_positions, function(pos) {
    window_text <- str_sub(e, pos, pos + 400)
    length(str_extract_all(window_text, other_pattern)[[1]]) >= 2
  })
  
  split_points <- from_positions[is_real_block_start]
  split_points <- split_points[split_points > 1]  # skip block at start of string
  
  if (length(split_points) == 0) return(e)
  
  bounds <- c(1, split_points, nchar(e) + 1)
  pieces <- character(length(bounds) - 1)
  for (i in seq_len(length(bounds) - 1)) {
    pieces[i] <- str_sub(e, bounds[i], bounds[i + 1] - 1)
  }
  pieces
}
# =============================================================================
# On <date>, <person> wrote pattern Regex
# =============================================================================
quote_pattern <- regex(
  r"((?=On\s+[A-Z][a-z]{2,8}\s+\d{1,2},\s+\d{4},\s+at\s+\d{1,2}:\d{2}\s*[AP]M,.*?wrote:))",
  dotall = TRUE
)
# =============================================================================
# Extraction Functions
# =============================================================================
header_keywords <- "To:|Subject:|Date:|Sent:|Cc:|Importance:|Embedded:|Priority:"

extract_field <- function(text, field_keyword) {
  fk <- paste0("(?:", field_keyword, ")")
  
  has_keyword <- str_detect(text, regex(paste0(fk, ".*?(?=", header_keywords, ")"), dotall = TRUE, ignore_case = TRUE))
  has_keyword <- replace_na(has_keyword, FALSE)
  
  with_keyword <- str_extract(text, regex(paste0("(?<=", fk, ").*?(?=", header_keywords, ")"), dotall = TRUE, ignore_case = TRUE))
  fallback     <- str_extract(text, regex(paste0("(?<=", fk, ").*?(?=\\n|$)"), dotall = TRUE, ignore_case = TRUE))
  
  ifelse(has_keyword, with_keyword, fallback)
}

remove_field <- function(text, field_keyword) {
  fk <- paste0("(?:", field_keyword, ")")
  
  has_keyword <- str_detect(text, regex(paste0(fk, ".*?(?=", header_keywords, ")"), dotall = TRUE, ignore_case = TRUE))
  has_keyword <- replace_na(has_keyword, FALSE)
  
  with_keyword <- str_remove(text, regex(paste0(fk, ".*?(?=", header_keywords, ")"), dotall = TRUE, ignore_case = TRUE))
  fallback     <- str_remove(text, regex(paste0(fk, ".*?(?=\\n|$)"), dotall = TRUE, ignore_case = TRUE))
  
  ifelse(has_keyword, with_keyword, fallback)
}