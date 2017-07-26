###############################################################################
#' runAnalysis
#'
#' This generic is for use on the miRmapper class to perform the the entire
#' miRmapper analysis and export all outputs into a directory named
#' 'miRmapper-Output' that is placed in the user's working directory.
#'
#' @include miRmapper.R
#'
#' @docType methods
#'
#' @rdname runAnalysis-methods
#'
#' @param object a 'miRmapper' object
#'
#' @return 5 output files into a directory named "miRmapper-Output". The files
#' consist of a table indicating the total predicted gene targets for each miRNA
#' and its percentage of impact, a table of the adjacency matrix that details
#' the miRNA-target network, a bar plot of the the miRNA impact percentages, a
#' dedrogram depicting miRNA clusters, and an identity heatmap depicting miRNA
#' clustering.
#'
#' @examples
#' runAnalysis(Object)
#'
#' @export
#'
setGeneric(name = "runAnalysis",
           def = function(object)
           {
             standardGeneric("runAnalysis")
           }
)

#' @rdname runAnalysis-methods
#' @aliases runAnalysis,miRmapper-method
#'
setMethod(f="runAnalysis",
          signature="miRmapper",
          definition=function(object)
          {
            impacts <- getImpact(object)
            mat <- getAdjmat(object)
            barplot <- barPlot(object)
            dend <- dendrogram(object)

            if (!file.exists('miRMapper-Output')){
              dir.create(file.path(getwd(), 'miRmapper-Output'))
            }

            write.csv(mat, file = "miRmapper-Output/AdjacencyMatrix.csv")
            write.csv(impacts,
                      file = "miRmapper-Output/MicroRNAimpact.csv",
                      row.names = FALSE)
            ggplot2::ggsave("miRmapper-Output/BarPlot.pdf", plot = barplot, width = 10, height = 10)
            ggplot2::ggsave("miRmapper-Output/Dendrogram.pdf", plot = dend, width = 10, height = 10)
            pdf('miRmapper-Output/IdentityHeatmap.pdf', height = 10, width = 10)
            identityPlot(object)
            invisible(dev.off())
          }
)
