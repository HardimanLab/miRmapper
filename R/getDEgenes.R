###############################################################################
#' getDEgenes
#'
#' This generic is for use on the miRmapper class that returns the 'DEgenes'
#' slot of the 'miRmapper' object.
#'
#' @include miRmapper.R
#'
#' @docType methods
#'
#' @rdname getDEgenes-methods
#'
#' @param object a 'miRmapper' object
#'
#' @return a list of differentiall expressed genes
#'
#' @examples
#' getDEgenes(Object)
#'
#' @export
#'
setGeneric(name="getDEgenes",
           def=function(object)
           {
             standardGeneric("getDEgenes")
           }
)

#' @rdname getDEgenes-methods
#' @aliases getDEgenes,miRmapper-method
#'
setMethod(f="getDEgenes",
          signature="miRmapper",
          definition=function(object)
          {
            if (dim(object@DEgenes)[1] > 1) {
              return(object@DEgenes)
            } else {
              stop("No list of DE genes given. Set the list with 'setDEgenes' method")
            }
          }
)
