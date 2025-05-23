% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_itt.R
\name{PlotDIMoutcomes}
\alias{PlotDIMoutcomes}
\title{Plot diff-in-means estimates}
\usage{
PlotDIMoutcomes(
  res.fta,
  res.nca,
  res.nvca,
  label.position = c("top", "top", "top"),
  top.margin = 0.01,
  bottom.margin = 0.01,
  y.max = 0.2,
  label.size = 7,
  name.group = c("Overall", "Female", "Male", "Non-white\\nMale", "White\\nMale")
)
}
\arguments{
\item{res.fta}{A \code{data.frame} generated with \code{CalDIMsubgroup} with Y = FTA.}

\item{res.nca}{A \code{data.frame} generated with \code{CalDIMsubgroup} with Y = NCA.}

\item{res.nvca}{A \code{data.frame} generated with \code{CalDIMsubgroup} with Y = NVCA.}

\item{label.position}{The position of labels.}

\item{top.margin}{Top margin of labels.}

\item{bottom.margin}{Bottom margin of labels.}

\item{y.max}{Maximum value of y-axis.}

\item{label.size}{Size of label.}

\item{name.group}{A character vector including the labels of five subgroups.}
}
\value{
A ggplot.
}
\description{
See Figure 2 for example.
}
\examples{
data(synth)
subgroup_synth <- list(
  1:nrow(synth), which(synth$Sex == 0), which(synth$Sex == 1),
  which(synth$Sex == 1 & synth$White == 0), which(synth$Sex == 1 & synth$White == 1)
)
synth_fta <- synth_nca <- synth_nvca <- synth
set.seed(123)
synth_fta$Y <- sample(0:1, 1000, replace = TRUE)
synth_nca$Y <- sample(0:1, 1000, replace = TRUE)
synth_nvca$Y <- sample(0:1, 1000, replace = TRUE)
res_fta <- CalDIMsubgroup(synth_fta, subgroup = subgroup_synth)
res_nca <- CalDIMsubgroup(synth_nca, subgroup = subgroup_synth)
res_nvca <- CalDIMsubgroup(synth_nvca, subgroup = subgroup_synth)
PlotDIMoutcomes(res_fta, res_nca, res_nvca)

}
