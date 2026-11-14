\name{R2GUESS.perm}
\alias{R2GUESS.perm}
\title{Internal function used for the parallel computation on the permutation procedure for the calibration of the FDR threshold
regarding the significance of the MPPI. This function run GUESS on permutation sample.}
\usage{
  R2GUESS.perm(dataY, dataX, path.inputx, path.inputy,
    path.output, path.par, path.init = NULL, file.par,
    file.init = NULL, file.log = NULL, nsweep,
    burn.in = 1000, Egam = 2, Sgam = 2, root.file.output,
    time = TRUE, top = 100, history = TRUE, label.X = NULL,
    label.Y = NULL, nb.chain, conf = 0, cuda = TRUE,
    MAP.file = NULL, p, q, n,time.limit=NULL,seed=NULL)
}
\arguments{
  \item{dataY}{name of the (permuted) outcome file, located in \code{path.inputy}.}
  \item{dataX}{name of the predictor file, located in \code{path.inputx}.}
  \item{path.inputx, path.inputy}{directories of the predictor and outcome files.}
  \item{path.output, path.par, path.init, file.par, file.init, file.log, nsweep, burn.in, Egam, Sgam, root.file.output, time, top, history, label.X, label.Y, nb.chain, cuda, MAP.file, time.limit, seed}{as in \code{\link{R2GUESS}}.}
  \item{conf}{number of confounders (0).}
  \item{p, q, n}{number of predictors, outcomes and observations, supplied by the caller.}
}
\value{An object of class \code{ESS} for the permuted run (see \code{\link{as.ESS.object}}); the result files are written to \code{path.output}.}
\description{
  Internal function used for the parallel computation on
  the permutation procedure for the calibration of the FDR
  threshold regarding the significance of the MPPI. This
  function run GUESS on permutation sample.
}
\keyword{internal}

