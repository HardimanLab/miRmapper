###############################################################################
#' getInteractions
#'
#' This generic is for use on the miRmapper class that returns the
#' 'interactions' slot of a miRmapper object.
#'
#' @include miRmapper.R
#'
#' @docType methods
#'
#' @rdname getInteractions-methods
#'
#' @param object a 'miRmapper' object
#'
#' @return a dataframe of miRNA to gene interactions
#'
#' @examples
#' getInteractions(Object)
#'
#' @export
#'
setGeneric(name="getInteractions",
           def=function(object)
           {
             standardGeneric("getInteractions")
           }
)

#' @rdname getInteractions-methods
#' @aliases getInteractions,miRmapper-method
#'
setMethod(f="getInteractions",
          signature="miRmapper",
          definition=function(object)
          {
            return(object@interactions)
          }
)
