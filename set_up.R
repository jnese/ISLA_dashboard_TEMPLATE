########################################################################
# Run this script ONCE per machine (or when you need to reinitialize).
# It will:
#   Create a keyring secret to encrypt the shinymanager DB (if missing)
#   Create the shinymanager SQLite DB with starter users (if missing)
#   Run Google OAuth once and cache tokens in .secrets/
########################################################################


# Ensure the required packages below are installed first
library(googledrive)
library(googlesheets4)
library(shinymanager)
library(keyring)
library(here)
library(gargle)


# Get the token and store it in a cache folder embedded in your app directory
options(gargle_oauth_cache = ".secrets")
options(options(gargle_verbosity = "debug"))
googledrive::drive_auth() # Authenticate to produce the token in the cache folder
# Complete the browser login using the Google account that has access to the ISLA Sheets/Drive.
googlesheets4::gs4_auth(token = googledrive::drive_token())

# Verify that a .secrets/ directory now exists in your project (and that it’s in .gitignore).

## Create the {shinymanager} database

source(here::here("school_info.R"))

key_set_with_value("ISLA-key", password = paste0(db_passphrase))

shinymanager::create_db(
  credentials_data = credentials,
  sqlite_path = here::here("database.sqlite"), 
  passphrase = key_get("ISLA-key")
)

