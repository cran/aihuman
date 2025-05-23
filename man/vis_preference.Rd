% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ability_preference.R
\name{vis_preference}
\alias{vis_preference}
\title{Visualize Preference (internal)}
\usage{
vis_preference(
  df,
  p.title = NULL,
  legend.position = "none",
  p.label = c("AI-alone preferred", "Human-alone preferred", "Ambiguous")
)
}
\arguments{
\item{df}{Data frame with columns `X`, `l01`, and `pref`.}

\item{p.title}{Plot title (character).}

\item{legend.position}{Position of the legend (character).}

\item{p.label}{Labels for the lines (character).}
}
\value{
A ggplot object.
}
\description{
Internal function to visualize preference for Human over AI decision makers.
}
\keyword{internal}
