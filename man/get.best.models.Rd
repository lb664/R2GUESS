\name{get.best.models}
\alias{get.best.models}
\title{Internal function used to read in R the result of the best model}
\usage{
  get.best.models(path.out, path.in = NULL, file.in, label.X = NULL, p, MAP.file = NULL)
}
\arguments{
  \item{path.out}{directory containing the output of the run.}
  \item{path.in}{directory containing \code{MAP.file} when it is a file name.}
  \item{file.in}{root name of the run (\code{root.file.output}).}
  \item{label.X}{predictor names; by default the positions \code{1:p}.}
  \item{p}{number of predictors.}
  \item{MAP.file}{optional annotation (data frame or file name) with columns \code{SNPName}, \code{Chr}, \code{Posn}.}
}
\value{A list with one element per field and one entry per visited best model, ordered by posterior probability: \code{Rank}, \code{nVisits}, \code{FirstVisit}, \code{nEvalBefore1st}, \code{ModeSize}, \code{logCondPost}, \code{postProb}, \code{jeffries} and \code{modelName} (space-separated predictor names, \code{NA} for the empty model); with \code{MAP.file} also \code{modelPosInX}, \code{modelCHR} and \code{modelPosn}. The list is also saved as \code{<file.in>_output_best_visited_models.RData} in \code{path.out}.}
\description{
  Internal function used to read in R the result of the
  best model
}
\keyword{internal}

