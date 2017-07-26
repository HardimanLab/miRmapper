###############################################################################
#' getAdjmat
#'
#' This generic is for use on the 'miRmapper' class that returns the
#' adjacency matrix generated from the interactions.
#'
#' @include miRmapper.R
#'
#' @docType methods
#'
#' @rdname getAdjmat-methods
#'
#' @param object a 'miRmapper' object
#'
#' @return Adjacency matrix of the interactions
#'
#' @examples
#' getAdjmat(Object)
#'
#' @export
#'
setGeneric(name="getAdjmat",
           def=function(object)
           {
             standardGeneric("getAdjmat")
           }
)

#' @rdname getAdjmat-methods
#' @aliases getAdjmat,miRmapper-method
#'
setMethod(f="getAdjmat",
          signature="miRmapper",
          definition=function(object)
          {
            if (dim(object@adjmat)[1] == TRUE) {
              stop("Please assign a set of interactions first using the 'setInteractions' method.")
            } else {
              return(object@adjmat)
            }
          }
)
