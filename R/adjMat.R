###############################################################################
#' adjMat
#'
#' This generic is for use on the miRmapper class to generate an
#' adjacency matrix of the interaction network. The matrix has a column
#' for each miRNA and a row for each gene. 0 indicates no interaction,
#' while a 1 indicates an interaction.
#'
#' @include miRmapper.R
#'
#' @docType methods
#'
#' @rdname adjMat-methods
#'
#' @param object a 'miRmapper' object
#'
#' @return a matrix object of the interaction network
#'
#' @examples
#' adjMat(Object)
#'
#' @export
#'
setGeneric(name = "adjMat",
           def = function(object)
           {
             standardGeneric("adjMat")
           }
)

#' @rdname adjMat-methods
#' @aliases adjMat,miRmapper-method
#'
setMethod(f="adjMat",
          signature="miRmapper",
          definition=function(object)
          {
            if(length(object@interactions)<2) {
              stop("Please set the 'interactions' slot with the 'setInteractions' method.")
            } else {

              mat <- matrix(0, length(unique(object@interactions$V2)), length(unique(object@interactions$V1)))
              row.names(mat) <- unique(object@interactions$V2)
              colnames(mat) <- unique(object@interactions$V1)
              for (i in 1:length(object@interactions$V1)) {

                mat[as.character(object@interactions$V2[i]), as.character(object@interactions$V1[i])] <- 1  # Set to 1 if there is an interaction.

              }

              sums <- c()
              for (i in 1:nrow(mat)) {

                sums[i] <- sum(mat[i,])

              }

              mat <- cbind(mat, sums)
              return(data.matrix(mat))
            }
          }
)
