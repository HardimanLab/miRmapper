###############################################################################
#' barPlot
#'
#' This generic is for use on the 'miRmapper' class, used to generate a
#' bar plot that depicts the impact of each miRNA of the set of gene targets.
#'
#' @include miRmapper.R
#'
#' @docType methods
#'
#' @rdname barPlot-methods
#'
#' @param object a 'miRmapper' object
#'
#' @return plot bar graph of the impact percentages for the miRNAs
#'
#' @examples
#' barPlot(Object)
#'
#' @export
#'
setGeneric(name = "barPlot",
           def = function(object)
           {
             standardGeneric("barPlot")
           }
)

#' @rdname barPlot-methods
#' @aliases barPlot,miRmapper-method
#'
setMethod(f = "barPlot",
          signature = 'miRmapper',
          definition = function(object) {

            impacts <- getImpact(object)

            if (dim(object@DEgenes)[1] > 1) {

              dfm <- reshape2::melt(impacts[,c('miRNA', 'Percentage_of_Targets','Percentage_of_DE_Genes')], id.vars = 'miRNA' )
              plot <- ggplot2::ggplot(dfm , ggplot2::aes(x = reorder(miRNA, value), y = value, fill = variable)) +
                ggplot2::geom_bar(stat = "identity", position="identity") +
                ggplot2::ggtitle("Predicted miRNA Impact on Genes") +
                ggplot2::xlab("miRNA") +
                ggplot2::ylab("Percent") +
                ggplot2::coord_flip()

            } else {
              dfm <- reshape2::melt(impacts[, c('miRNA', 'Percentage_of_Targets')], id.vars = 'miRNA' )
              plot <- ggplot2::ggplot(dfm , ggplot2::aes(x = reorder(miRNA, value), y = value, fill = variable)) +
                ggplot2::geom_bar(stat = "identity", position="identity") +
                ggplot2::ggtitle("Predicted miRNA Impact on Genes") +
                ggplot2::xlab("miRNA") +
                ggplot2::ylab("Percent") +
                ggplot2::coord_flip()
              }
            return(plot)
            }
)
