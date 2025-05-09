% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_decision.R
\name{PlotStackedBar}
\alias{PlotStackedBar}
\title{Stacked barplot for the distribution of the decision given psa}
\usage{
PlotStackedBar(
  data,
  fta.label = "FTAScore",
  nca.label = "NCAScore",
  nvca.label = "NVCAFlag",
  d.colors = c("grey60", "grey30", "grey10"),
  d.labels = c("signature bond", "small cash bond", "large cash bond"),
  legend.position = "none"
)
}
\arguments{
\item{data}{A \code{data.frame} of which columns includes an ordinal decision (D), and psa variables (fta, nca, and nvca).}

\item{fta.label}{Column name of fta score in the data. The default is \code{"FTAScore"}.}

\item{nca.label}{Column name of nca score in the data. The default is \code{"NCAScore"}.}

\item{nvca.label}{Column name of nvca score in the data. The default is \code{"NVCAFlag"}.}

\item{d.colors}{The color of each decision.}

\item{d.labels}{The label of each decision.}

\item{legend.position}{The position of legend. The default is \code{"none"}.}
}
\value{
A list of three ggplots.
}
\description{
See Figure 1 for example.
}
\examples{
data(psa_synth)
# Control group (PSA not provided)
PlotStackedBar(psa_synth[psa_synth$Z == 0, ], d.colors = c(
  "grey80", "grey60",
  "grey30", "grey10"
), d.labels = c(
  "signature", "small",
  "middle", "large"
))
# Treated group (PSA provided)
PlotStackedBar(psa_synth[psa_synth$Z == 0, ], d.colors = c(
  "grey80", "grey60",
  "grey30", "grey10"
), d.labels = c(
  "signature", "small",
  "middle", "large"
))

}
