library(here)
library(tidyverse)
library(glue)
library(aws.s3)
library(aws.signature)

# write_csv(iris, here("data", "raw", "iris.csv"))

# Read in keys
source("key.R")

# Set env variables
Sys.setenv(
"AWS_ACCESS_KEY_ID" = access_key_id,
"AWS_SECRET_ACCESS_KEY" = secret_access_key,
"AWS_DEFAULT_REGION" = "us-west-1")

# Test auth
get_bucket(
  bucket = 'givenly-test'
)



# Create a folder and add a file to it
make_folder_add_file <- function(bucket_name = "givenly-test",
                                 folder_name,
                                 file_path,
                                 file_name) {
  put_folder(bucket = bucket_name,
             folder = folder_name)
  
  put_object(file = file_path,
             bucket = bucket_name,
             glue("/{folder_name}/{file_name}"))
}

# Add iris
make_folder_add_file(folder_name = "foo_folder",
                     file_path = here("data", "raw", "iris.csv"),
                     file_name = "iris_foo.csv")

  

