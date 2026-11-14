# get.g.sweep(): shrinkage-factor (g) values of the sweeps in which a given model was visited.
# INPUT   x      "ESS" object;  res  matrix returned by get.sweep.best.model()$result;
#         model  rank (column of res) of the model of interest.
# OUTPUT  object of class "g.prior": g.value (g at each visit, burn-in removed), predictors (names),
#         X (centred predictors of the model) and Y (centred outcomes); input of sample.beta().
get.g.sweep <- function(x,res,model){
  model <- as.character(model)
  path.output <- x$path.output
  file.in <- x$root.file.output
  nsweep <- x$nsweep
  g.history <- file.path(path.output, paste(file.in,"output_g_history.txt",sep="_"))
  SNPs <- unlist(strsplit(x$BestModels$modelName[as.numeric(model)]," "))
  g <- read.table(g.history,header=TRUE)
  ##remove the burn.in
  g <- g[-(1:x$burn.in),]
  indice <- which(res[,model]==TRUE)
  if(length(indice)==0) stop("the model has not been visited")
  g.value <- g[indice,2] 
  dataX <- read.table(file.path(x$path.input,x$dataX),skip=2)
  dataY <- read.table(file.path(x$path.input,x$dataY),skip=2)
  centerY <- scale(dataY,scale=FALSE)
  if(is.null(x$MAP.file)){
    X <- dataX[,as.numeric(SNPs)]
  }else{
    colnames(dataX) <- x$MAP.file$SNPName ###warning file could be an huge file !!!
    X <- dataX[,SNPs]
  }
  centerX <- scale(X,scale=FALSE)	
  res <- list(g.value=g.value,predictors=SNPs,X=centerX,Y=centerY)
  class(res) <- "g.prior"
  return(res)
}
