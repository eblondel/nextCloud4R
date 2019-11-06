#' nextCloudManager
#' @docType class
#' @export
#' @keywords nextCloud manager
#' @return Object of \code{\link{R6Class}} for modelling an nextCloudManager
#' @format \code{\link{R6Class}} object.
#' @section General Methods:
#' \describe{
#'  \item{\code{new(url, user, pwd, logger)}}{
#'    This method is used to instantiate an nextCloudManager. The user/pwd are
#'    mandatory in order to connect to 'nextCloud'. The logger can be either
#'    NULL, "INFO" (with minimum logs), or "DEBUG" (for complete curl 
#'    http calls logs)
#'  }
#'  \item{\code{connect()}}{
#'    A method to connect to 'Nextcloud' 
#'  }
#'  \item{\code{getVersion()}}{
#'    Get the 'ownCloud' server version
#'  }
#'  \item{\code{getCapabilities()}}{
#'    Get the 'ownCloud' server capabilities
#'  }
#'  \item{\code{getWebdavRoot()}}{
#'    Get the 'ownCloud' WebDAV root URL
#'  }
#' }
#' 
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#' 
nextCloudManager <-  R6Class("nextCloudManager",
  inherit = nextCloud4RLogger,
  private = list(
    url = NULL,
    user = NULL,
    pwd = NULL,
    version = NULL,
    capabilities = NULL
  ),
  public = list(
    
    initialize = function(url, user, pwd, logger = NULL){
      super$initialize(logger = logger)
      private$url = url
      private$user <- user
      private$pwd <- pwd
      self$connect()
    },
    
    #connect
    connect = function(){
      caps_req <- nextcloudRequest$new(
        type = "HTTP_GET", private$url, "ocs/v1.php/cloud/capabilities",
        private$user, private$pwd, logger = self$loggerType
      )
      caps_req$execute()
      caps_resp <- caps_req$getResponse()
      if(caps_resp$ocs$meta$status == "failure"){
        errMsg <- sprintf("Could not connect to Nextcloud '%s': %s", private$url, caps_resp$ocs$meta$message)
        self$ERROR(errMsg)
        stop(errMsg)
      }
      if(caps_resp$ocs$meta$status == "ok"){
        self$INFO(sprintf("Successful connection to Nextcloud '%s'!", private$url))
        private$version = caps_resp$ocs$data$version
        private$capabilities = caps_resp$ocs$data$capabilities
      }
    },
    
    #getVersion
    getVersion = function(){
      return(private$version)
    },
    
    #getCapabilities
    getCapabilities = function(){
      return(private$capabilities)
    },
    
    #getWebdavRoot
    getWebdavRoot = function(){
      return(private$capabilities$core[["webdav-root"]])
    }
  )
)
