###############################################################################
#' setDEgenes
#'
#' This generic is for use on the miRmapper class, used to set the 'DEgenes'
#' slot of a 'miRmapper' object.
#'
#' @include miRmapper.R
#'
#' @docType methods
#'
#' @rdname setDEgenes-methods
#'
#' @param object a 'miRmapper' object
#' @param genes a 'list' object containing one column of gene symbols
#'
#' @return None
#'
#' @examples
#' setDEgenes(Object, genes)
#'
#' @export
#'
setGeneric(name = "setDEgenes",
           def = function(object, genes)
           {
             standardGeneric("setDEgenes")
           }
)

#' @rdname setDEgenes-methods
#' @aliases setDEgenes,miRmapper-method
#'
setMethod(f = "setDEgenes",
          definition = function(object, genes)
          {
            if(typeof(genes)!='list'){
              stop("'DEgenes' argument is not of type 'list'")
            } else {
              object@DEgenes <- genes
              #initialize(object, interactions = object@interactions, DEgenes = genes)
            }
            return(object)
          }
)
