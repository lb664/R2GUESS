\name{wrapper}
\alias{wrapper}
\title{Internal function used for the parallel computation on the permutation procedure for the calibration of the FDR threshold
regarding the significance of the MPPI}
\usage{
  wrapper(x, root.file.output, object, path.input,
    path.output, Y = Y,start.counter)
}
\arguments{
  \item{x}{index of the permutation (1 to \code{Npermut}).}
  \item{root.file.output}{file stem of the permuted run; the permutation number is appended.}
  \item{object}{the \code{ESS} object of the original run.}
  \item{path.input}{directory in which the permuted outcome file is written.}
  \item{path.output}{directory in which the results of the permuted run are saved.}
  \item{Y}{the original outcome matrix; its rows are permuted.}
  \item{start.counter}{number from which permutations are labelled.}
}
\value{A list with \code{MPI.perm}, the marginal posterior probability of inclusion of every predictor in the permuted run, and \code{JF.best}, the largest Jeffreys factor among its best models.}
\description{
  Internal function used for the parallel computation on
  the permutation procedure for the calibration of the FDR
  threshold regarding the significance of the MPPI
}
\keyword{internal}

