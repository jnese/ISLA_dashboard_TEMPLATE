# ISLA Dashboard

## Shiny App Setup Guide

This guide walks a new user from cloning the repo to a working local run of the ISLA Shiny app.


### (1) Clone the repository

- Clone the ISLA_dashboard_TEMPLATE repo

### (2) Run the `set_up.R` file

We use Google OAuth setup `{googledrive}` and `{googlesheets4}` to cache OAuth tokens in a local folder named *.secrets*. 
The flow is: First, do an interactive login once to obtain/refresh tokens. Thereafter, re-use cached tokens silently.

-	You will need to allow remote server authentication. 
-	Once you successfully execute the `set_up.R` file, you will not need to execute this script again.

### (3) Edit the `school_info.R` file 

You will need to edit this file in **six** (6) places. 
Once you edit these, you will not need to edit again unless you want to make changes to those items.

1. Enter your Google email address that will have access to the Google ISLA Tracking Sheets & Google Drive
2. Enter your school name 
3. Enter the school year
4. Enter your ISLA Google Sheet ID
    + To find your Google Sheet ID:
        - Open your ISLA Google Sheet
        - Look at the URL in your browser
        - Copy the long string of letters/numbers between /d/ and /edit
          - Example: https[]()://docs.google.com/spreadsheets/d/**this-is-the-sheet-ID**/edit
5. Enter the grade levels in your school
6. Enter the users and passwords for those who will access your ISLA Tracking Sheet
   Note that you can always edit to add/remove users as needed.

### (4) Run the `app.R` file

Make sure the code, app, and password manager are working correctly.

### (5) Deploy your ISLA Shiny App

You will need to deploy your ISLA Shiny app on the Web.

One good, and potentially free, option that we recommend is https://www.shinyapps.io/. 

**Notes**

The app uses `{shinymanager}` to protect access via a login screen and keyring to secure the database passphrase locally. 
Use `shinymanager::read_db()` / `shinymanager::update_db()` to add/remove users or reset passwords without rebuilding from scratch.

We do recommend you **NOT** host your school's ISLA dashboard repo publicly


