\name{plotcim}
\alias{plotcim}
\title{Clustered Image Maps (CIMs) (heat maps)}
\usage{
  plotcim(x, select.variable, labelX = NULL)
}
\arguments{
  \item{x}{an object of class \code{ESS}.}

  \item{select.variable}{name of the selected predictors.}

  \item{labelX}{names of the predictors used when running
  \code{\link{R2GUESS}}. This argument is optional if a \code{\link{MAP.file}} has been provided.}
}
\value{A list with \code{mat.sim}, the \code{q} x \code{k} matrix of correlations between each outcome (rows) and each selected predictor (columns); \code{labelY}, the outcome labels; and \code{labelX}, the selected predictors. A clustered image map of \code{mat.sim} is also drawn. If fewer than two predictors are selected a message is printed and \code{mat.sim} is \code{NULL}.}
\description{
  This function generates color-coded Clustered Image Maps
  (CIMs) representing the pairwise
  correlation between a subset of predictors and the outcomes.
}
\examples{
modelY_Hopx <- example.as.ESS.object()
MPPI.Hopx <-
plotMPPI(modelY_Hopx,threshold.model=20,threshold.variable=0.25,Figure=FALSE)
plotcim(modelY_Hopx,select.variable=MPPI.Hopx$var.TOP.MPI)
}
\author{
Benoit Liquet, \email{b.liquet@uq.edu.au},\cr
Marc Chadeau-Hyam \email{m.chadeau@imperial.ac.uk},\cr
Leonardo Bottolo \email{lb664@cam.ac.uk},\cr
Gianluca Campanella \email{g.campanella11@imperial.ac.uk}
}
