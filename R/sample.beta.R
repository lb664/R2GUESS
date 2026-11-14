# sample.beta(): draw from the posterior of the regression coefficients of one model.
# INPUT   x            "ESS" object;  res.g  output of get.g.sweep();
#         Nmonte.sigma draws of the error (co)variance per visit; Nmonte  draws of beta per variance draw.
# OUTPUT  list(res.beta = matrix of draws (rows) with q coefficients per predictor (columns,
#         predictor-major), predictors = predictor names). q > 1: inverse-Wishart/matrix-normal
#         posterior; q == 1: inverse-gamma/normal with a vague prior.
sample.beta <- function(x,res.g,Nmonte.sigma=1,Nmonte=1){
if(x$q>1){  
Namefeatures <- file.path(x$path.output, paste(x$root.file.output,"features.txt",sep="_"))
features <- read.table(file=Namefeatures,header=TRUE)
rownames(features) <- features[,1]
s <- (features["med_RMSE","value"])**2
a.sigma <- features["delta","value"]

matXtX.inv <- solve(t(as.matrix(res.g$X))%*%as.matrix(res.g$X))
d <- a.sigma + x$n  
res.beta <- NULL
for(i in res.g$g.value) {
  H <- (i/(1+i))* matXtX.inv
  m <- H%*%(t(as.matrix(res.g$X)))%*%as.matrix(res.g$Y)
  Q <- s*diag(x$q)+t(as.matrix(res.g$Y))%*%as.matrix(res.g$Y)-t(m)%*%solve(H)%*%m
  for(j in 1:Nmonte.sigma){
  Sigma <- riwish(d, Q)
  SIGMA.vec <- kronecker(H,Sigma)
  simu.beta <- rmvnorm(Nmonte,sigma=SIGMA.vec)
  res.beta <- rbind(res.beta,simu.beta+matrix(as.vector(t(m)),ncol=dim(simu.beta)[2],nrow=Nmonte,byrow=TRUE))
  }
  } 
result <- list(res.beta =res.beta,predictors=res.g$predictors)}else{
  Namefeatures <- file.path(x$path.output, paste(x$root.file.output,"features.txt",sep="_"))
  features <- read.table(file=Namefeatures,header=TRUE)
  rownames(features) <- features[,1]
#  a.sigma <- features["a.sigma","value"]
#  b.sigma <- features["b.sigma","value"]
   a.sigma <- 10^{-10}
   b.sigma <- 10^{-3}  
  matXtX.inv <- solve(t(as.matrix(res.g$X))%*%as.matrix(res.g$X))
  astar <- a.sigma + (x$n)/2
  res.beta <- NULL
  for(i in res.g$g.value) {
    Sigma.star <- (i/(1+i))* matXtX.inv
    m <- Sigma.star%*%(t(as.matrix(res.g$X)))%*%matrix(res.g$Y,ncol=1)
    Q <- t(as.matrix(res.g$Y))%*%as.matrix(res.g$Y)-t(as.matrix(res.g$Y))%*%(as.matrix(res.g$X))%*%m
    bstar <- b.sigma+0.5*Q
    for(j in 1:Nmonte.sigma){
      Sigma.2 <- rinvgamma(1,shape=astar,scale=bstar)
      simu.beta <- rmvnorm(Nmonte,sigma=Sigma.2*Sigma.star)
      res.beta <- rbind(res.beta,simu.beta+matrix(m,ncol=dim(simu.beta)[2],nrow=Nmonte,byrow=TRUE))
    }
  } 
  result <- list(res.beta =res.beta,predictors=res.g$predictors)}  
  
}





   

  
  
