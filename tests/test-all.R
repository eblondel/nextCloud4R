library(testthat)
library(nextCloud4R)

#test environment
nextcloud_url <- "http://localhost:8080"
nextcloud_user <- "admin"
nextcloud_pwd <- "admin"

nextcloud <- nextCloudManager$new(
  url = nextcloud_url, 
  user = nextcloud_user, 
  pwd = nextcloud_pwd, 
  logger = "DEBUG"
)

if(is(nextcloud, "nextCloudManager")){
  cat(sprintf("nextCloud '%s' configured with token. Running integration tests...\n", nextcloud_url))
  test_check("nextCloud4R")
}else{
  cat("nextCloud '%s' not configured. Skipping integration tests...\n")
}