# ISLA Dashboard

Before establishing your ISLA dashboard, you will first need to create your own copy of the ISLA Tracking Sheet and linked Sign-in/Out Form. 

You can find those instructions in the [ISLA_Tracking-Sheet_Set-Up_Instructions](./ISLA_Tracking-Sheet_Set-Up_Instructions.pdf) document here.

*Note.* You will need data entries in your ISLA Tracking sheet before your ISLA dashboard can be launched.

## Shiny App Setup Guide

This guide walks a new user from cloning the repo to a working local run of the ISLA Shiny app.


### (1) Clone the repository

- Clone the ISLA_dashboard_TEMPLATE repo
- When you save a copy, rename the repo, replacing "TEMPLATE" with the school name and year (e.g., "Central_2025-26")

### (2) Edit the `school_info.R` file 

You will need to edit this file in **six** (6) places **and** then save the file. 
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
7. Enter a password to protect the credentials entered in step (6)

Remember to save the `school_info.R` file 

### (3) Run the `set_up.R` file

We use Google OAuth setup `{googledrive}` and `{googlesheets4}` to cache OAuth tokens in a local folder named *.secrets*. 
The flow is: First, do an interactive login once to obtain/refresh tokens. Thereafter, re-use cached tokens silently.

-	You will need to allow remote server authentication. 
-	Once you successfully execute the `set_up.R` file, you will not need to execute this script again.

### (4) Run the `app.R` file

Make sure the code, app, and password manager are working correctly.

### (5) Deploy your ISLA Shiny App

You will need to deploy your ISLA Shiny app on the Web.

One good, and potentially free, option that we recommend is https://www.shinyapps.io/. 

Here are the deployment steps[^1]:

1. Open and run `app.R` to confirm it deploys locally 
2. Click on the publish icon dropdown to the right of the "**Run App**" icon in `R` within the `app.R` script
3. Click on manage accounts
4. On the Publishing tab, click on the "**Connect**" button and select "**ShinyApps.io**"
5. Go to your ShinyApps.io account
6. In the ShinyApps.io dashboard
    a. click on "**Account**" on the lefthand side of the window and then click on "**Tokens**"
    b. click the "**show**" button to view the token
    c. click on the "**copy**" button to copy the token and secret
7. Return to `R`, paste the token and secret into `R` in the manage accounts box
8. Click "**connect**", "**apply**", and "**ok**"
9. Go back to the publish icon and click "**publish**" (within the `app.R` script)
10. Include all `R` scripts and related files (including the `.secrets` file) when publishing
11. If publication is successful, you will be prompted to log in
12. Once published, go to the application on ShinyApps.io, open it, click on users, and set the application to "**Private**"


**Notes**

The app uses `{shinymanager}` to protect access via a login screen and keyring to secure the database passphrase locally. 
Use `shinymanager::read_db()` / `shinymanager::update_db()` to add/remove users or reset passwords without rebuilding from scratch.

We do recommend you **NOT** host your school's ISLA dashboard repo publicly

[^1]: Credit [Dr. Jason Small](https://www.ori.org/project/small-jason/)
