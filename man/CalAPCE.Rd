% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/apce.R
\name{CalAPCE}
\alias{CalAPCE}
\title{Calculate APCE}
\usage{
CalAPCE(
  data,
  mcmc.re,
  subgroup,
  name.group = c("overall", "Sex0", "Sex1", "Sex1 White0", "Sex1 White1"),
  rho = 0,
  burnin = 0,
  out.length = 500,
  c0 = 0,
  c1 = 0,
  ZX = NULL,
  save.individual.optimal.decision = FALSE,
  parallel = FALSE,
  optimal.decision.only = FALSE,
  dmf = NULL,
  fair.dmf.only = FALSE
)
}
\arguments{
\item{data}{A \code{data.frame} or \code{matrix} of which columns consists of pre-treatment covariates, a binary treatment (Z), an ordinal decision (D), and an outcome variable (Y). The column names of the latter three should be specified as "Z", "D", and "Y" respectively.}

\item{mcmc.re}{A \code{mcmc} object generated by \code{AiEvalmcmc()} function.}

\item{subgroup}{A list of numeric vectors for the index of each of the five subgroups.}

\item{name.group}{A list of character vectors for the label of five subgroups.}

\item{rho}{A sensitivity parameter. The default is  \code{0} which implies the unconfoundedness assumption (Assumption 4).}

\item{burnin}{A proportion of burnin for the Markov chain. The default is \code{0}.}

\item{out.length}{An integer to specify the progress on the screen. Every \code{out.length}-th iteration is printed on the screen. The default is \code{500}.}

\item{c0}{The cost of an outcome. See Section 3.7 for more details. The default is \code{0}.}

\item{c1}{The cost of an unnecessarily harsh decision. See Section 3.7 for more details. The default is \code{0}.}

\item{ZX}{The data matrix for interaction terms. The default is the interaction between Z and all of the pre-treatment covariates (X).}

\item{save.individual.optimal.decision}{A logical argument specified to save individual optimal decision rules. The default is \code{FALSE}.}

\item{parallel}{A logical argument specifying whether parallel computing is conducted. Do not change this argument manually.}

\item{optimal.decision.only}{A logical argument specified to compute only the optimal decision rule. The default is \code{FALSE}.}

\item{dmf}{A numeric vector of binary DMF recommendations. If \code{null}, use judge's decisions (0 if the decision is 0 and 1 o.w; e.g., signature or cash bond).}

\item{fair.dmf.only}{A logical argument specified to compute only the fairness of given DMF recommendations. The default is \code{FALSE}. Not used in the analysis for the JRSSA paper.}
}
\value{
An object of class \code{list} with the following elements:
\item{P.D1.mcmc}{An array with dimension n.mcmc by 5 by (k+1) by (k+2) for quantity P(D(1)=d| R=r), dimension 1 is each posterior sample; dimension 2 is subgroup, dimension 3 is (k+1) values of D from 0 to k, dimension 4 is (k+2) values of R from 0 to k+1.}
\item{P.D0.mcmc}{An array with dimension n.mcmc by 5 by (k+1) by (k+2) for quantity P(D(0)=d| R=r).}
\item{APCE.mcmc}{An array with dimension n.mcmc by 5 by (k+1) by (k+2) for quantity P(D(1)=d| R=r)-P(D(0)=d| R=r).}
\item{P.R.mcmc}{An array with dimension n.mcmc by 5 by (k+2) for quantity P(R=r) for r from 0 to (k+1).}
\item{Optimal.Z.mcmc}{An array with dimension n.mcmc by 5 for the proportion of the cases where treatment (PSA provided) is optimal.}
\item{Optimal.D.mcmc}{An array with dimension n.mcmc by 5 by (k+1) for the proportion of optimal decision rule (average over observations). If \code{save.individual.optimal.decision = TRUE}, the dimension would be n by (k+1) (average over mcmc samples).}
\item{P.DMF.mcmc}{An array with dimension n.mcmc by 5 by (k+1) by (k+2) for the proportion of binary DMF recommendations. Not used in the analysis for the JRSSA paper.}
\item{Utility.g_d.mcmc}{Included if \code{save.individual.optimal.decision = TRUE}. An array with dimension n for the individual utility of judge's decisions.}
\item{Utility.g_dmf.mcmc}{Included if \code{save.individual.optimal.decision = TRUE}. An array with dimension n for the individual utility of DMF recommendation.}
\item{Utility.diff.control.mcmc}{Included if \code{save.individual.optimal.decision = TRUE}. An array with dimension n.mcmc for estimated difference in utility between judge's decisions and DMF recommendation among control group.}
\item{Utility.diff.treated.mcmc}{Included if \code{save.individual.optimal.decision = TRUE}. An array with dimension n.mcmc for estimated difference in utility between judge's decisions and DMF recommendation among treated group.}
}
\description{
Calculate average principal causal effects (APCE) with ordinal decision. See Section 3.4 for more details.
}
\examples{
data(synth)
sample_mcmc <- AiEvalmcmc(data = synth, n.mcmc = 2)
subgroup_synth <- list(
  1:nrow(synth), which(synth$Sex == 0), which(synth$Sex == 1),
  which(synth$Sex == 1 & synth$White == 0), which(synth$Sex == 1 & synth$White == 1)
)
sample_apce <- CalAPCE(data = synth, mcmc.re = sample_mcmc, subgroup = subgroup_synth)

}
\references{
Imai, K., Jiang, Z., Greiner, D.J., Halen, R., and Shin, S. (2023).
"Experimental evaluation of algorithm-assisted human decision-making:
application to pretrial public safety assessment."
Journal of the Royal Statistical Society: Series A.
<DOI:10.1093/jrsssa/qnad010>.
}
