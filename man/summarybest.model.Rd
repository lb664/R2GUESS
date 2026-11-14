\name{summarybest.model}
\alias{summarybest.model}
\title{Internal function used for the summary.ESS function.}
\usage{
  summarybest.model(x, N = NULL)
}
\arguments{
  \item{x}{an object of class \code{ESS}.}
  \item{N}{number of best models to report; by default all \code{x$top} models.}
}
\value{A list with \code{result}, a data frame with one row per model and columns \code{Rank}, \code{nVisits}, \code{FirstVisit}, \code{nEvalBefore1st}, \code{ModeSize} (number of predictors), \code{logCondPost}, \code{postProb} (posterior probability), \code{jeffrey} (Jeffreys factor) and \code{modelName} (space-separated predictor names), and \code{N}, the number of models shown.}
\description{
  Internal function used for the summary.ESS function.
}
\keyword{internal}

