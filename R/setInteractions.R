###############################################################################
#' setInteractions
#'
#' This generic is for use on the miRmapper class, used to set the
#' 'interactions' slot of a 'miRmapper' object.
#'
#' @include miRmapper.R
#'
#' @docType methods
#'
#' @rdname setInteractions-methods
#'
#' @param object a 'miRmapper' object
#' @param interactions.list a 'list' object containing two columns with each row
#' representing a miRNA to gene interaction.
#'
#' @return None
#'
#' @examples
#' setInteractions(Object, interactions.list)
#'
#' @export
#'
setGeneric(name = "setInteractions",
           def = function(object, interactions.list)
           {
             standardGeneric("setInteractions")
           }
)

#' @rdname setInteractions-methods
#' @aliases setInteractions,miRmapper-method
#'
setMethod(f = "setInteractions",
          definition = function(object, interactions.list)
          {
           if(typeof(interactions.list)!='list'){
             stop("'interactions' argument is not of type 'list'")
           } else {
             object@interactions <- interactions.list
             return(object)
           }
          }
)
