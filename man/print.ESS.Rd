\name{print.ESS}
\alias{print.ESS}
\title{Provides a \code{print} method for class \code{ESS}}
\usage{
  \method{print}{ESS} (x, ...)
}
\arguments{
  \item{x}{an object of class \code{ESS}}

  \item{...}{not used currently}
}
\value{Called for its side effect: prints the data files, dimensions (\code{n}, \code{p}, \code{q}), algorithm settings (\code{Egam}, \code{Sgam}, \code{nsweep}, \code{burn.in}, \code{nb.chain}) and the input, output and parameter-file paths. The \code{ESS} object is not modified.}
\description{
  Print method for R2GUESS
}
\details{
  \code{print} method for \code{ESS} class, returns a
  description of the \code{x} object. 
}
\examples{
# load an ESS object
modelY_Hopx <- example.as.ESS.object()
print(modelY_Hopx)
}
\author{
Benoit Liquet, \email{b.liquet@uq.edu.au},\cr
Marc Chadeau-Hyam \email{m.chadeau@imperial.ac.uk},\cr
Leonardo Bottolo \email{lb664@cam.ac.uk},\cr
Gianluca Campanella \email{g.campanella11@imperial.ac.uk}
}

\seealso{
\code{\link{as.ESS.object}}
}
