###############################################################################
#' identityPlot
#'
#' This generic is for use on the miRmapper class, used to generate a
#' heatmap representing an identity plot that represents the similarity
#' between miRNAS. A darker colors indicate a cluster where interactions are
#' shared.
#'
#' @include miRmapper.R
#'
#' @docType methods
#'
#' @rdname identityPlot-methods
#'
#' @param object a 'miRmapper' object
#'
#' @return plot a heatmap of the miRNAs
#'
#' @examples
#' identityPlot(Object)
#'
#' @export
#'
setGeneric(name = "identityPlot",
           def = function(object)
           {
             standardGeneric("identityPlot")
           }
)

#' @rdname identityPlot-methods
#' @aliases identityPlot,miRmapper-method
#'
setMethod(f = 'identityPlot',
          signature = 'miRmapper',
          definition = function(object)
          {
            adjmat <- object@adjmat
            mat <- subset(adjmat, select = -sums)
            distances <- dist( t(mat), method = 'binary')

            return(gplots::heatmap.2(1-data.matrix(distances),
                                      dendrogram = "none",
                                      trace = 'none',
                                      key = T,
                                      margins = c(7,7),
                                      cexRow = 0.7,
                                      cexCol = 0.7,
                                      symkey = F,
                                      symm = T,
                                      revC = T,
                                      density.info = 'none',
                                      key.title = NA,
                                      key.xlab = "Similarity",
                                      col = blues9))
          }
)
