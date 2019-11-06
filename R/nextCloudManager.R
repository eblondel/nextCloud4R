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
#' }
#' 
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#' 
nextCloudManager <-  R6Class("nextCloudManager",
  inherit = ocs4R::ocsManager,
  private = list(
    url = NULL,
    user = NULL,
    pwd = NULL,
    version = NULL,
    capabilities = NULL
  ),
  public = list(
    
    initialize = function(url, user, pwd, logger = NULL){
      super$initialize(url, user, pwd, logger)
    }
  )
)
