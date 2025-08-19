library(googlesheets4)
library(googledrive)
library(tidyverse)
library(lubridate)
library(shinymanager)
library(keyring)

make_grade_choices <- function(vec) {
  vec <- as.character(vec)
  grade_vec <- setNames(vec, paste("Grade", vec))
  choices <- c("All" = "All", grade_vec)
  return(choices)
}

grade_choices <- make_grade_choices(grades_in_my_school)

options(gargle_oauth_cache = ".secrets")

googledrive::drive_auth(cache = ".secrets", email = your_email)
googlesheets4::gs4_auth(token = googledrive::drive_token())


dta_raw <- range_read(sheet_id, sheet = "Signed_In") %>% 
  janitor::clean_names()

timein_fx <- function(x){
  if (is.POSIXct(x)){
    x
  }
  else {
   na_if(x, "Never Signed In") 
  }
}

timeout_fx <- function(x){
  if (is.POSIXct(x)){
    x
  }
  else {
    na_if(x, "Never Signed Out") 
  }
}

dta <- dta_raw %>%
  filter(!is.na(grade)) %>% 
  separate(student_name, c("last", "first"), ",") %>% 
  mutate(student_name = paste0(first, " ", last)) %>% 
  select(student_name, everything()) %>% 
  mutate_at(vars(teacher_name, does_students_behavior_pose_a_safety_risk_to_them_or_others:did_the_student_reenter_the_classroom),
            ~na_if(., "")) %>% 
  mutate(teacher_name = replace_na(teacher_name, "missing")) %>%
  mutate(across(c(time_in, time_out), ~map(.x, as.character))) %>% 
  unnest(cols = c(time_in, time_out)) %>% 
  mutate(time_in = timein_fx(time_in)) %>% 
  mutate(time_out = timeout_fx(time_out)) %>% 
  unnest(cols = c(time_in, time_out)) %>% 
  mutate(time_lost = lubridate::int_length(lubridate::interval(time_in, time_out))/60,
         date = lubridate::as_date(time_in)) %>% 
  drop_na(grade)

# Student Name list for drop-down selectInput
student_name <- dta %>%
  arrange(last) %>% 
  select(student_name)

# min & max dates for dateRangeInput
min_date <- min(dta$date, na.rm = TRUE)
max_date <- max(dta$date, na.rm = TRUE)

# Data table for Data tab
completedata_table <- dta %>%
  select(-c(student_name, minutes_in_office)) %>%
  mutate(time_in = strftime(time_in, format = "%H:%M"),
         time_out = strftime(time_out, format = "%H:%M"),
         time_lost = round(time_lost, 0)) %>% 
  select(date, last, first, grade, teacher_name, time_in, time_out, time_lost, everything()) %>% 
  reactable(
    .,
    striped = TRUE,
    searchable = TRUE,
    width = 1200,
    selection = "multiple",
    borderless = TRUE,
    onClick = "select",
    theme = reactableTheme(
      rowSelectedStyle = list(backgroundColor = "#98f5ff", boxShadow = "inset 2px 0 0 0 #ffa62d")
    )
  )


