########################################################################
# Before you run this script THE FIRST TIME
# You will need to edit in four places. 
#  Once you edit these, you will not need to edit again.
#   1. Enter your Google email address that will have access to the Google ISLA Tracking Sheets & Google Drive
#   2. Enter your school name 
#   3. Enter the school year
#   4. Enter your ISLA Google Sheet ID
#   5. Enter the grade levels in your school
#   6. Enter the users and passwords for those who will access your ISLA Tracking Sheet
#      Note that you can always edit to add/remove users as needed.
########################################################################

## EDIT 1 of 6 ----
# Enter your Google email address that will have access to the Google ISLA Tracking Sheets & Google Drive
#   Replace the text below with your Google email address that will have access to the Google ISLA Tracking Sheets & Google Drive
your_email <- "enter_your_email@here"

## EDIT 2 of 6 ----
# Enter your school
#   Replace the text below with your school name. 
your_school_name <- "enter_your_school_name"

## EDIT 3 of 6 ----
# Enter the school year
#   Replace the text below with the current school year.
current_school_year <- "25-26"


## EDIT 4 of 6 ---
# Enter your ISLA Google Sheet ID
#    To find your Google Sheet ID:
#       1. Open your ISLA Google Sheet
#       2. Look at the URL in your browser
#       3. Copy the long string of letters/numbers between /d/ and /edit
#            Example: https://docs.google.com/spreadsheets/d/<this-is-the-sheet-ID/edit
#       4. Paste this ID below, in quotes, where it reads "your-sheet-id-here"
####

sheet_id <- "your-sheet-id-here"

## EDIT 5 of 6 ---
# Enter the grade levels in your school
#    These should match exactly those that are represented in your ISLA Tracking Sheet, in the "Students" sheet, column D
#    The grades below are for a middle school that serves grades 6, 7, 8. Edit those as needed.

grades_in_my_school <- c(6, 7, 8)


## EDIT 6 of 6 ---
# Enter the users and passwords for those who will access your ISLA Tracking Sheet
#    1. Change the "user" as you like; add/remove as many "users" as you like. Below there are two "users": c("user1", "user2") 
#    2. Change the "passwords" as you like. There should be as many passwords as "user"s. 
#       For example, "user1" will have the first password in the list "password-for-user1", and "user2" will have the second "password-for-user2", and so on.
#       Note that you can always edit to add/remove users as needed.

credentials <- data.frame(
  user = c("user1", "user2"), # Change "users" as you like; add/remove as many "users" as you like. Here there are two "user"
  password = c("password-for-user1", "password-for-user2"), # Change the "passwords" as you like. There should be as many passwords as "user". For example, "user1" will have the first password in the list, "user2" will have the second, and so on.
  stringsAsFactors = FALSE
)

