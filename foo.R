library(here)
library(tidyverse)
library(glue)
library(aws.s3)
library(aws.signature)

source("key.R")

# write_csv(iris, here("data", "raw", "iris.csv"))


Sys.setenv(
"AWS_ACCESS_KEY_ID" = access_key_id,
"AWS_SECRET_ACCESS_KEY" = secret_access_key,
"AWS_DEFAULT_REGION" = "us-west-1")

locate_credentials(region = "us-west-1",
                  key = access_key_id,
                  secret = secret_access_key
                  )


signature_v4_auth(region = "us-west-1",
                  service = "s3",
                  verb = "GET"
                  )



get_bucket(
  bucket = 'givenly-test'
)


make_folder_add_file <- function(folder_name,
                                 file_path,
                                 file_name) {
  put_folder(bucket = "givenly-test",
             folder = folder_name)
  
  put_object(file = here("data", "raw", "iris.csv"),
             bucket = "givenly-test",
             glue("/{folder_name}/{file_name}"))
}

make_folder_add_file(folder_name = "bing_folder",
                     file_path = here("data", "raw", "iris.csv"),
                     file_name = "iris_foo.csv")

  
put_object(file = here("data", "raw", "iris.csv"),
           obect = glue("/foo_folder/blah.csv"),
           bucket = "givenly-test",
           folder = "foo_folder"
)
  




put_folder(bucket = "givenly-test",
           folder = "newfolder",
           key = access_key_id,
           secret = secret_access_key)


put_object(file = here("data", "raw", "iris.csv"),
           bucket = "givenly-test",
           glue("/newfolder/{sample(10, 1)}_iris.csv"),
           # folder = "/newfolder",
           key = access_key_id,
           secret = secret_access_key)



