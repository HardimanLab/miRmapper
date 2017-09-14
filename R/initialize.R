setMethod('initialize', 'miRmapper',
          function(.Object, interactions, DEgenes)
          {
            # Remove 'NA' values
            # Doesn't seem to work with lists
            interactions <- interactions[complete.cases(interactions), ]
            #logicalMatrix = !sapply(Int, is.na)
            #logicalVector = as.logical(logicalMatrix[,1] * logicalMatrix[,2])
            #interactions = data.frame(interactions[1][logicalVector], 
            #    interactions[2][logicalVector])
            DEgenes <- DEgenes[!is.na(DEgenes)]
            DEgenes <- data.frame(DEgenes)
            .Object@interactions = interactions
            .Object@DEgenes = DEgenes
            .Object@adjmat = adjMat(.Object)
            return(.Object)
          }
)
