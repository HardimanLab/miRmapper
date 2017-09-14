setMethod('initialize', 'miRmapper',
          function(.Object, interactions, DEgenes)
          {
            # Remove 'NA' values
            # Doesn't seem to work with lists
            #interactions <- interactions[complete.cases(interactions), ]
            interactions = list(interactions[[1]][complete.cases(interactions)],
                interactions[[2]][complete.cases(interactions)])
            DEgenes <- DEgenes[!is.na(DEgenes)]
            DEgenes <- data.frame(DEgenes)
            .Object@interactions = interactions
            .Object@DEgenes = DEgenes
            .Object@adjmat = adjMat(.Object)
            return(.Object)
          }
)
