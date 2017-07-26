###############################################################################
#' dendrogram
#'
#' This generic is for use on the miRmapper class, used to generate a
#' dendrogram for miRNA clustering based on shared targets
#'
#' @include miRmapper.R
#'
#' @docType methods
#'
#' @rdname dendrogram-methods
#'
#' @param object a 'miRmapper' object
#'
#' @return plot dendrogram figure of miRNAs
#'
#' @examples
#' dendrogram(Object)
#'
#' @export
#'
setGeneric(name = "dendrogram",
           def = function(object)
           {
             standardGeneric("dendrogram")
           }
)

#' @rdname dendrogram-methods
#' @aliases dendrogram,miRmapper-method
#'
setMethod(f = "dendrogram",
          signature = "miRmapper",
          definition = function(object)
          {
            adjmat <- object@adjmat
            mat <- subset(adjmat, select = -sums)
            distances <- dist( t(mat), method = 'binary')

            hc <- hclust(distances, method = 'single') # , main = "miRNA Clustering"
            plot <- ggdendro::ggdendrogram(hc, rotate = T, labels = T, leaf_labels = T)

            return(plot)
          }
)
