# boxplotbeta(): boxplot of the posterior draws of one predictor's coefficients (one box per outcome).
# INPUT   x "ESS" object; beta  output of sample.beta(); variable  predictor name (a member of beta$predictors).
# OUTPUT  draws the plot; returns list(beta = matrix of draws, columns = outcomes).
boxplotbeta <- function(x,beta,variable) {
	variable <- as.character(variable)
  indice <- match(variable,beta$predictors)
  indix1 <- (x$q)*(indice-1)+1
  #indix <- seq(indice,dim(beta$res.beta)[2],length(beta$predictors))
  matbeta <- as.matrix(beta$res.beta[,indix1:(indix1+x$q-1)])
  colnames(matbeta) <- x$label.Y 
  boxplot(matbeta,main=paste("Posterior distribution of the regression coefficient:\n",variable),ylab=expression(beta))
  abline(h=0,col="red")
  res <- list(beta=matbeta)
}


