# plotcim.explore(): clustered image map of cor(each column of matX, each column of matY).
# INPUT   matX  n x k predictors;  matY  n x q outcomes with column names.
# OUTPUT  draws the map; no return value of interest.
plotcim.explore <- function(matX,matY) {
labelY <- colnames(matY)  
mat.sim <- matrix(NA,ncol=dim(matX)[2],nrow=length(labelY))
for (i in 1:dim(matX)[2]){
  for (j in 1:length(labelY)){
    mat.sim[j,i] <- cor(matX[,i],matY[,j])
  }}
cim(mat.sim,row.names = labelY,col.names = 1:dim(matX)[2])
}
