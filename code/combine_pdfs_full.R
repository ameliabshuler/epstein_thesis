library(tidyverse)

# =============================================================================
# Extraction Combination
# =============================================================================

##############
# random files
##############
bop <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_bop-video-footage-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_1 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-ca-florida-holdings-llc-publisher-palm-beach-post-v-aronberg-no-50-2019-ca-014681-xxxx-mb-1.csv", 
                    col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_2 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-17-v-indyke-no-119-cv-09610-sdny-2019-1.csv", 
                    col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_3 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-1000-v-indyke-no-119-cv-10577-sdny-2019-1.csv", 
                    col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_4 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-no-3-v-epstein-no-908-cv-80232-sd-fla-2008-1.csv", 
                    col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_5 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-no-4-v-epstein-no-908-cv-80380-sd-fla-2008-1.csv", 
                    col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_6 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-no-5-v-epstein-no-908-cv-80381-sd-fla-2008-1.csv", 
                    col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_7 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-no-6-v-epstein-no-908-cv-80994-sd-fla-2008-1.csv", 
                    col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_8 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-no-8-v-epstein-no-909-cv-80802-sd-fla-2009-1.csv", 
                    col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_9 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-no-101-v-epstein-no-909-cv-80591-sd-fla-2009-1.csv", 
                    col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_10 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-no-102-v-epstein-no-909-cv-80656-sd-fla-2009-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_11 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-no-103-v-epstein-no-910-cv-80309-sd-fla-2010-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_12 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-v-epstein-no-908-cv-80069-sd-fla-2008-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_13 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-v-epstein-no-908-cv-80119-sd-fla-2008-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_14 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-v-epstein-no-908-cv-80804-sd-fla-2008-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_15 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-v-epstein-no-909-v-80469-sd-fla-2009-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_16 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-v-indyke-no-119-cv-08673-sdny-2019-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_17 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-v-indyke-no-119-cv-11869-sdny-2019-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_18 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-v-indyke-no-120-cv-00484-sdny-2020-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_19 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-v-indyke-no-120-cv-02365-sdny-2020-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_20 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-doe-v-united-states-no-908-cv-80736-sd-fla-2008-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_21 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-epstein-v-no-sc15-2286-fla-sup-ct-2015-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_22 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-epstein-v-rothstein-no-50-2009-ca-040800-xxxx-mb-fla-15th-cir-ct-2009-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_23 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-government-united-states-virgin-islands-v-jpmorgan-chase-bank-na-no-122-cv-10904-sdny-2022-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_24 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-jane-doe-43-v-epstein-no-117-cv-00616-sdny-2017-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_25 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-matter-estate-jeffrey-e-epstein-deceased-no-st-21-rv-00005-vi-super-ct-2021-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_26 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-maxwell-v-estate-jeffrey-epstein-no-st-20-cv-155-vi-super-ct-2020-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_27 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-maxwell-v-united-states-no-24-1073-us-2025-petition-cert-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_28 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-operating-engineers-construction-industry-and-miscellaneous-pension-fund-v-dimon-no-123-cv-03903-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_29 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-re-grand-jury-05-02-wpb-07-103-wpb-no-925-mc-80920-sd-fla-2025-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_30 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-state-florida-v-epstein-no-50-2006-cf-009454-axxx-mb-fla-15th-cir-ct-2006-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_31 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-state-florida-v-epstein-no-50-2008-cf-009381-axxx-mb-fla-15th-cir-ct-2008-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_32 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-united-states-v-epstein-no-19-2221-2d-cir-2019-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_33 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-united-states-v-epstein-no-119-cr-00490-sdny-2019-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_34 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-united-states-v-maxwell-no-20-3061-2d-cir-2020-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_35 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-united-states-v-maxwell-no-21-0058-2d-cir-2021-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_36 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-united-states-v-maxwell-no-21-0770-2d-cir-2021-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_37 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-united-states-v-maxwell-no-22-1426-2d-cir-2022-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_38 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-united-states-v-maxwell-no-120-cr-00330-sdny-2020-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_39 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-united-states-v-maxwell-no-120-mj-00132-dnh-2020-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_40 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-united-states-v-noel-no-119-cr-00830-sdny-2019-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_41 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-v-epstein-909-cv-81092-sd-fla-2009-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_42 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-v-epstein-no-910-cv-80447-sd-fla-2010-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_43 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-v-epstein-no-910-cv-81111-sd-fla-2010-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_44 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-v-indyke-no-119-cv-10474-sdny-2019-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_45 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-v-indyke-no-119-cv-10475-sdny-2019-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_46 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-v-indyke-no-119-cv-10476-sdny-2019-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_47 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-v-indyke-no-119-cv-10479-sdny-2019-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_48 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-v-indyke-no-119-cv-10788-sdny-2019-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_49 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-v-maxwell-no-115-cv-07433-sdny-2015-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_50 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-v-maxwell-no-117-mc-00025-sdny-2016-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
court_51 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_court-records-v-nine-east-71st-street-no-119-cv-07625-sdny-2019-1.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
##############
# datasets
##############
dataset_1 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-1-files-1.csv", 
                      col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_2 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-2-files-1.csv", 
                      col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_3 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-3-files-1.csv", 
                      col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_4 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-4-files-1.csv", 
                      col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_5 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-5-files-1.csv", 
                      col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_6 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-6-files-1.csv", 
                      col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_7 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-7-files-1.csv", 
                      col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_8_1 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-8-files-1.csv", 
                      col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_8_2 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-8-files-2.csv", 
                        col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
##############
# dataset 9
##############
dataset_9_1 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-1.csv", 
                        col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_2 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-2.csv", 
                        col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_3 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-3.csv", 
                        col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_4 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-4.csv", 
                        col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_5 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-5.csv", 
                        col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_6 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-6.csv", 
                        col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_7 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-7.csv", 
                        col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_8 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-8.csv", 
                        col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_9 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-9.csv", 
                        col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_10 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-10.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_11 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-11.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_12 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-12.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_13 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-13.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_14 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-14.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_15 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-15.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_16 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-16.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_17 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-17.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_18 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-18.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_19 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-19.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_20 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-20.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_21 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-21.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_22 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-22.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_23 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-23.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_24 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-24.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_25 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-25.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_26 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-26.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_27 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-27.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_28 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-28.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_29 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-29.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_30 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-30.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_31 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-31.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_32 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-32.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_33 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-33.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_34 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-34.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_35 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-35.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_36 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-36.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_37 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-37.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_38 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-38.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_39 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-39.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_40 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-40.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_41 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-41.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_42 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-42.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_43 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-43.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_44 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-44.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_45 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-45.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_46 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-46.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_47 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-47.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_48 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-48.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_49 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-49.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_50 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-50.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_51 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-51.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_52 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-52.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_53 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-53.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_9_54 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-9-files-54.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))

##############
# dataset 10
##############
dataset_10_1 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-1.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_2 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-2.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_3 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-3.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_4 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-4.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_5 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-5.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_6 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-6.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_7 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-7.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_8 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-8.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_9 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-9.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_10 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-10.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_11 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-11.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_12 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-12.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_13 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-13.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_14 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-14.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_15 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-15.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_16 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-16.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_17 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-17.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_18 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-18.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_19 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-19.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_20 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-20.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_21 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-21.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_22 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-22.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_23 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-23.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_24 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-24.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_25 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-25.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_26 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-26.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_27 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-27.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_28 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-28.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_29 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-29.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_30 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-30.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_31 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-31.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_32 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-32.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_33 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-33.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_34 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-34.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_35 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-35.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_36 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-36.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_37 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-37.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_38 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-38.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_39 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-39.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_40 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-40.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_41 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-41.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_42 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-42.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_43 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-43.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_44 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-44.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_45 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-45.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_46 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-46.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_47 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-47.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_48 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-48.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_49 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-49.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_50 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-50.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_10_51 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-10-files-51.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
##############
# dataset 11
##############
dataset_11_1 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-1.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_2 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-2.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_3 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-3.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_4 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-4.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_5 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-5.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_6 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-6.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_7 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-7.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_8 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-8.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_9 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-9.csv", 
                         col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_10 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-10.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_11 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-11.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_12 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-12.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_13 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-13.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_14 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-14.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_15 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-15.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_16 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-16.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_17 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-17.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_18 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-18.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_19 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-19.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_20 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-20.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_21 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-21.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_22 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-22.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_23 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-23.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_24 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-24.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_25 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-25.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_26 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-26.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_27 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-27.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_28 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-28.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_29 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-29.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_30 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-30.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_31 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-31.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_32 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-32.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_33 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-33.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dataset_11_34 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-11-files-34.csv", 
                          col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))

##############
# rest of data
##############
dataset_12 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_data-set-12-files-1.csv", 
                  col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
first_phase_declassified_epstein_files <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_first-phase-declassified-epstein-files-1.csv", 
                   col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
foia_1 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_foia-customs-and-border-protection-cbp-1.csv", 
                   col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
foia_2 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_foia-federal-bureau-investigation-fbi-1.csv", 
                   col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
foia_3 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_foia-federal-bureau-prisons-bop-1.csv", 
                   col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
foia_4 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_foia-florida-1.csv", 
                   col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
foia_5 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_maxwell-proffer-1.csv", 
                   col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
foia_6 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_memoranda-and-correspondence-1.csv", 
                   col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))

##############
# Oversight Committee
##############
opt <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_20250822.opt.csv", 
                col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
dat <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_20250822.dat.csv", 
                col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
images_1 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_IMAGES001.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
images_2 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_IMAGES002.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
images_3 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_IMAGES003.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
images_4 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_IMAGES004.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
images_5 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_IMAGES005.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
images_6 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_IMAGES006.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
images_7 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_IMAGES007.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
images_8 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_IMAGES008.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
images_9 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_IMAGES009.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
images_10 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_IMAGES010.csv", 
                      col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
images_11 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_IMAGES011.csv", 
                      col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
images_12 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_IMAGES012.csv", 
                      col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
native_6 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_NATIVE006.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
native_8 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_NATIVE008.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
native_11 <- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_NATIVE011.csv", 
                      col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))
native_12<- read_csv("/Volumes/Thesis/Epstein_Files/output/extraction_NATIVE012.csv", 
                     col_types = list(file_name = col_character(), file_origin = col_character(), text = col_character()))


##############
# random files
##############
combined <- bop |>
  full_join(court_1, by = c("file_name", "file_origin", "text")) |>
  full_join(court_2, by = c("file_name", "file_origin", "text")) |>
  full_join(court_3, by = c("file_name", "file_origin", "text")) |>
  full_join(court_4, by = c("file_name", "file_origin", "text")) |>
  full_join(court_5, by = c("file_name", "file_origin", "text")) |>
  full_join(court_6, by = c("file_name", "file_origin", "text")) |>
  full_join(court_7, by = c("file_name", "file_origin", "text")) |>
  full_join(court_8, by = c("file_name", "file_origin", "text")) |>
  full_join(court_9, by = c("file_name", "file_origin", "text")) |>
  full_join(court_11, by = c("file_name", "file_origin", "text")) |>
  full_join(court_12, by = c("file_name", "file_origin", "text")) |>
  full_join(court_13, by = c("file_name", "file_origin", "text")) |>
  full_join(court_14, by = c("file_name", "file_origin", "text")) |>
  full_join(court_15, by = c("file_name", "file_origin", "text")) |>
  full_join(court_16, by = c("file_name", "file_origin", "text")) |>
  full_join(court_17, by = c("file_name", "file_origin", "text")) |>
  full_join(court_18, by = c("file_name", "file_origin", "text")) |>
  full_join(court_19, by = c("file_name", "file_origin", "text")) |>
  full_join(court_20, by = c("file_name", "file_origin", "text")) |>
  full_join(court_21, by = c("file_name", "file_origin", "text")) |>
  full_join(court_22, by = c("file_name", "file_origin", "text")) |>
  full_join(court_23, by = c("file_name", "file_origin", "text")) |>
  full_join(court_24, by = c("file_name", "file_origin", "text")) |>
  full_join(court_25, by = c("file_name", "file_origin", "text")) |>
  full_join(court_26, by = c("file_name", "file_origin", "text")) |>
  full_join(court_27, by = c("file_name", "file_origin", "text")) |>
  full_join(court_28, by = c("file_name", "file_origin", "text")) |>
  full_join(court_29, by = c("file_name", "file_origin", "text")) |>
  full_join(court_30, by = c("file_name", "file_origin", "text")) |>
  full_join(court_31, by = c("file_name", "file_origin", "text")) |>
  full_join(court_32, by = c("file_name", "file_origin", "text")) |>
  full_join(court_33, by = c("file_name", "file_origin", "text")) |>
  full_join(court_34, by = c("file_name", "file_origin", "text")) |>
  full_join(court_35, by = c("file_name", "file_origin", "text")) |>
  full_join(court_36, by = c("file_name", "file_origin", "text")) |>
  full_join(court_37, by = c("file_name", "file_origin", "text")) |>
  full_join(court_38, by = c("file_name", "file_origin", "text")) |>
  full_join(court_39, by = c("file_name", "file_origin", "text")) |>
  full_join(court_40, by = c("file_name", "file_origin", "text")) |>
  full_join(court_41, by = c("file_name", "file_origin", "text")) |>
  full_join(court_42, by = c("file_name", "file_origin", "text")) |>
  full_join(court_43, by = c("file_name", "file_origin", "text")) |>
  full_join(court_44, by = c("file_name", "file_origin", "text")) |>
  full_join(court_45, by = c("file_name", "file_origin", "text")) |>
  full_join(court_46, by = c("file_name", "file_origin", "text")) |>
  full_join(court_47, by = c("file_name", "file_origin", "text")) |>
  full_join(court_48, by = c("file_name", "file_origin", "text")) |>
  full_join(court_49, by = c("file_name", "file_origin", "text")) |>
  full_join(court_50, by = c("file_name", "file_origin", "text")) |>
  full_join(court_51, by = c("file_name", "file_origin", "text")) 

##############
# datasets 1- 8
##############
combined <- combined |>
  full_join(dataset_1, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_2, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_3, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_4, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_5, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_6, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_7, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_8_1, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_8_2, by = c("file_name", "file_origin", "text")) 

##############
# dataset 9
##############
dataset_9 <- dataset_9_1 |>
  full_join(dataset_9_2, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_3, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_4, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_5, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_6, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_7, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_8, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_9, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_10, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_11, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_12, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_13, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_14, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_15, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_16, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_17, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_18, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_19, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_20, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_21, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_22, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_23, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_24, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_25, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_26, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_27, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_28, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_29, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_30, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_31, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_32, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_33, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_34, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_35, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_36, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_37, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_38, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_39, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_40, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_41, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_42, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_43, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_44, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_45, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_46, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_47, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_48, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_49, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_50, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_51, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_52, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_53, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_9_54, by = c("file_name", "file_origin", "text")) 

combined <- combined |>
  full_join(dataset_9, by = c("file_name", "file_origin", "text"))

##############
# dataset 10
##############
dataset_10 <- dataset_10_1 |>
  full_join(dataset_10_2, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_3, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_4, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_5, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_6, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_7, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_8, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_9, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_10, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_11, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_12, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_13, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_14, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_15, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_16, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_17, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_18, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_19, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_20, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_21, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_22, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_23, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_24, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_25, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_26, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_27, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_28, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_29, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_30, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_31, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_32, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_33, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_34, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_35, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_36, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_37, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_38, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_39, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_40, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_41, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_42, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_43, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_44, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_45, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_46, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_47, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_48, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_49, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_50, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_10_51, by = c("file_name", "file_origin", "text"))

combined <- combined |>
  full_join(dataset_10, by = c("file_name", "file_origin", "text"))

##############
# dataset 11
##############
dataset_11 <- dataset_11_1 |>
  full_join(dataset_11_2, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_3, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_4, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_5, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_6, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_7, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_8, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_9, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_10, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_11, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_12, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_13, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_14, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_15, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_16, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_17, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_18, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_19, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_20, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_21, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_22, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_23, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_24, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_25, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_26, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_27, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_28, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_29, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_30, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_31, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_32, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_33, by = c("file_name", "file_origin", "text")) |>
  full_join(dataset_11_34, by = c("file_name", "file_origin", "text")) 

combined <- combined |>
  full_join(dataset_11, by = c("file_name", "file_origin", "text"))

##############
# rest of data
##############
combined <- combined |>
  full_join(dataset_12, by = c("file_name", "file_origin", "text")) |>
  full_join(first_phase_declassified_epstein_files, by = c("file_name", "file_origin", "text")) |>
  full_join(foia_1, by = c("file_name", "file_origin", "text")) |>
  full_join(foia_2, by = c("file_name", "file_origin", "text")) |>
  full_join(foia_3, by = c("file_name", "file_origin", "text")) |>
  full_join(foia_4, by = c("file_name", "file_origin", "text")) |>
  full_join(foia_5, by = c("file_name", "file_origin", "text")) |>
  full_join(foia_6, by = c("file_name", "file_origin", "text"))

##############
# Oversight Committee
##############
combined <- combined |>
  full_join(opt, by = c("file_name", "file_origin", "text")) |>
  full_join(dat, by = c("file_name", "file_origin", "text")) |>
  full_join(images_1, by = c("file_name", "file_origin", "text")) |>
  full_join(images_2, by = c("file_name", "file_origin", "text")) |>
  full_join(images_3, by = c("file_name", "file_origin", "text")) |>
  full_join(images_4, by = c("file_name", "file_origin", "text")) |>
  full_join(images_5, by = c("file_name", "file_origin", "text")) |>
  full_join(images_6, by = c("file_name", "file_origin", "text")) |>
  full_join(images_7, by = c("file_name", "file_origin", "text")) |>
  full_join(images_8, by = c("file_name", "file_origin", "text")) |>
  full_join(images_9, by = c("file_name", "file_origin", "text")) |>
  full_join(images_10, by = c("file_name", "file_origin", "text")) |>
  full_join(images_11, by = c("file_name", "file_origin", "text")) |>
  full_join(images_12, by = c("file_name", "file_origin", "text")) |>
  full_join(native_6, by = c("file_name", "file_origin", "text")) |>
  full_join(native_8, by = c("file_name", "file_origin", "text")) |>
  full_join(native_11, by = c("file_name", "file_origin", "text")) |>
  full_join(native_12, by = c("file_name", "file_origin", "text"))

##############
# check for corrupt
##############  
corrupt <- combined |>
  filter(file_type == "corrupt")

alt <- combined |>
  filter(grepl(".jpg|.png|.m4v|.MP4", file_name))

##############
# check for duplicates
##############
dup_rows <- combined |>
  group_by(file_name) |>
  filter(n() > 1) |>
  ungroup() |>
  arrange(file_name)

##############
# rename
##############
combined <- combined |>
  mutate(
    file_origin = str_replace(file_origin, "^(data-set-\\d+-files)-\\d+$", "\\1"),
    file_origin = if_else(
      str_detect(file_origin, "^data-set-"),
      file_origin,
      str_replace(file_origin, "-1$", "")
    )
  )
##############
# export
##############
write_csv(combined,
          file = file.path("/Volumes/Thesis/Epstein_Files/output/extraction_combined.csv"))