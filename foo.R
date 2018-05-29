library(fs)
library(here)
library(tidyverse)
source("key.R")
library(aws.s3)
library(glue)

write_csv(iris, here("data", "raw", "iris.csv"))

library(aws.signature)

locate_credentials(region = "us-west-1",
                  key = access_key_id,
                  secret = secret_access_key
                  )


signature_v4_auth(region = "us-west-1",
                  service = "s3",
                  verb = "GET"
                  )



get_bucket(
  bucket = 'givenly-test',
  key = access_key_id,
  secret = secret_access_key
)


make_folder <- function(name) {
  
}


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



