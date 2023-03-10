% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_itt.R
\name{CalDIM}
\alias{CalDIM}
\title{Calculate diff-in-means estimates}
\usage{
CalDIM(data)
}
\arguments{
\item{data}{A \code{data.frame} of which columns includes a binary treatment (Z), an ordinal decision (D), and an outcome variable (Y).}
}
\value{
A \code{data.frame} of diff-in-means estimates effect for each value of D and Y.
}
\description{
Calculate average causal effect based on diff-in-means estimator.
}
\examples{
data(synth)
CalDIM(synth)

}
