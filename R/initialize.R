setMethod('initialize', 'miRmapper',
          function(.Object, interactions, DEgenes)
          {
            # Remove 'NA' values
            interactions <- interactions[complete.cases(interactions), ]
            DEgenes <- DEgenes[!is.na(DEgenes)]
            DEgenes <- data.frame(DEgenes)
            .Object@interactions = interactions
            .Object@DEgenes = DEgenes
            .Object@adjmat = adjMat(.Object)
            return(.Object)
          }
)
