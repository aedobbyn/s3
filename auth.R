library(aws.s3)

locate_credentials(region = "us-west-1",
                   key = access_key_id,
                   secret = secret_access_key
)


signature_v4_auth(region = "us-west-1",
                  service = "s3",
                  verb = "GET"
)