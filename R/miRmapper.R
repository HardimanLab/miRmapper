#' An S4 class to represent miRNA to gene interactions
#'
#' @include miRmapper.R
#'
#' @slot interactions a list of miRNA to gene interactions (2 columns)
#' @slot DEgenes a list of differentially expressed genes from a sequencing experiment
#' @slot adjmat a matrix object generated from the 'setAdjMat' method
#'
#' @name miRmapper-class
#' @rdname miRmapper-class
#' @export miRmapper

miRmapper <- setClass(

  Class = "miRmapper",

  representation = representation(
    interactions = "list",
    DEgenes = "list",
    adjmat = "matrix"
    ),

  prototype = list(
    interactions = list(),
    DEgenes = list(),
    adjmat = matrix()
    ),

  # Validate the input
  validity = function(object)
  {
    if (typeof(object@interactions) != "list"){
      return("No data.frame object containing miRNA-target interactions was provided.")
    } else {
      return(TRUE)
    }
  },

  package = "miRmapper"

)

miRmapper <- function(interactions = list(), DEgenes = list()) {
  new(Class = 'miRmapper', interactions, DEgenes)
}
