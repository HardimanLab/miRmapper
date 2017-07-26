###############################################################################
#' getImpact
#'
#' This generic is for use on the miRmapper class to generate metrics that
#' measure the predicted impact each miRNA has on the differentially expression genes.
#'
#' @include miRmapper.R
#'
#' @docType methods
#'
#' @rdname getImpact-methods
#'
#' @param object a 'miRmapper' object
#'
#' @return a dataframe object of impact metrics for each miRNA
#'
#' @examples
#' getImpact(Object)
#'
#' @export
#'
setGeneric(name = "getImpact",
           def = function(object)
           {
             standardGeneric("getImpact")
           }
)

#' @rdname getImpact-methods
#' @aliases getImpact,miRmapper-method
#'
setMethod(f = "getImpact",
          signature = "miRmapper",
          definition = function(object)
          {
            adjmat <- getAdjmat(object)
            adjmat <- subset(adjmat, select = -sums)
            if(dim(object@DEgenes)[1] > 1) {
              genes <- object@DEgenes
              mirnas <- colnames(adjmat)
              sums <- c()
              percents <- c()
              percents2 <- c()
              for (i in 1:ncol(adjmat)) {
                sum <- sum(adjmat[, i])
                sums[i] <- sum
                percents[i] <- (sum/(nrow(adjmat)))*100
                percents2[i] <- (sum/(nrow(genes)))*100
              }

              effect.df <- data.frame('miRNA' = mirnas,
                                      'Predicted_Genes_Found' = sums,
                                      'Percentage_of_Targets' = percents,
                                      'Percentage_of_DE_Genes' = percents2)

            } else {

              paste("No DEgenes list is available. Only impact metrics for interactor genes will be computed.")
              mirnas <- colnames(adjmat)
              sums <- c()
              percents <- c()
              for (i in 1:length(mirnas)) {
                print(i)
                sum <- sum(adjmat[, i])
                sums[i] <- sum
                percents[i] <- (sum/(nrow(adjmat)))*100
                print(percents[i])
              }

              effect.df <- data.frame('miRNA' = mirnas,
                                      'Predicted_Genes_Found' = sums,
                                      'Percentage_of_Targets' = percents)

            }
            effect.df <- effect.df[order(-effect.df$Percentage_of_Targets), ]

            return(effect.df)
          }
)
