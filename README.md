This repository contains the files to download and analyze the Epstein files released through the Oversight Committee release (September 2025) and the Department of Justice (DOJ) release (January 2026).

# Pipeline
## Download Files
While the Oversight Files can be downloaded directly from Google Drive or Dropbox, the DOJ files need to be downloaded using a scraper. 04.16.R is written to automatically download files. change base_drive_path <- "[where you want the files downloaded]"

They will download into folders named for their extraction source and automatically cap at 10,000 files.

Estimated time to run: ~1-2 weeks continually

## Classification Tibble and Email Tibble

Classification.R will loop over all files and classify each one. Outputs will be saved as .csv files into a folder called "output". Make sure to define "base" as where your files currently live. "output" will be ignored and not indexed.

This code will make both the descriptive data table with file_name, file_origin, file_length, and file_type. Each folder will be processed as an individual .csv that needs to be combined using combine_pdfs.R

Finally, the email data table needs to be cleaned with the cleanup.R file to extract fields such as "to, from, subject, date" etc.

Estimated time to run: ~20 hours

## Extraction Tibble

Extraction.R is a simplified version of the code in classification.R that extracts the contents of all files using pdf_tools. It saves them into the same .csvs that needs to be combined using combine_pdfs_full.R

Estimated time to run: ~15 hours

Alternatively for higher quality extraction, extraction_tesseract.R can be run, however, with the tradeoff being time. To combine the .csv files either change line 45 in extraction_tesseract.R to extraction_ or change every line in combine_pdfs_full.R to extraction_tesseract_...

Estimated time to run: ~2-3 weeks

## Exploratory Data Analysis (EDA)

Initial EDA is conducted in the file labeled "EDA.R". This uses all three data tables: exploratory, email, and extraction

Estimated time to run: 1-2 hours

## Email Analysis

This is initial sentiment analysis conducted with PDFtools OCR extraction.

Estimated time to run: 3-4 hours

## Latent Dirichlet Allocation (LDA)

The LDA.R file is a Machine Learning model that creates 12 topics and compares them to the 12 DOJ Datasets. It works off of the extraction data table.

Estimated time to run: 5-6 hours

## Extraction Analysis

This is the same as the email_analysis.R file but on the extraction data table. 

Estimated time to run: 4-5 hours
