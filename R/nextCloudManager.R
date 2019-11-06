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
#' }
#' 
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#' 
nextCloudManager <-  R6Class("nextCloudManager",
  inherit = nextCloud4RLogger,
  private = list(
    url = NULL,
    user = NULL,
    pwd = NULL
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
     stop("Not yet implemented")
    }
  )
)
