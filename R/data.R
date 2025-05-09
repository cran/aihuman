#' Synthetic data
#'
#' A synthetic dataset containing pre-treatment covariates, a binary treatment (Z), an ordinal decision (D),
#' and an outcome variable (Y).
#'
#' @format A data frame with 1000 rows and 11 variables:
#' \describe{
#'   \item{Z}{binary treatment}
#'   \item{D}{ordinal decision}
#'   \item{Y}{outcome}
#'   \item{Sex}{male or female}
#'   \item{White}{white or non-white}
#'   \item{Age}{age}
#'   \item{CurrentViolentOffense}{binary variable for current violent offense}
#'   \item{PendingChargeAtTimeOfOffense}{binary variable for pending charge (felony, misdemeanor, or both) at the time of offense}
#'   \item{PriorMisdemeanorConviction}{binary variable for prior conviction of misdemeanor}
#'   \item{PriorFelonyConviction}{binary variable for prior conviction of felony}
#'   \item{PriorViolentConviction}{four-level ordinal variable for prior violent conviction}
#' }
"synth"

#' Synthetic PSA data
#'
#' A synthetic dataset containing a binary treatment (Z), ordinal decision (D), three PSA variables (FTAScore, NCAScore, and NVCAFlag), and DMF recommendation.
#'
#' @format A data frame with 1000 rows and 4 variables:
#' \describe{
#'   \item{Z}{binary treatment}
#'   \item{D}{ordinal decision}
#'   \item{FTAScore}{FTA score}
#'   \item{NCAScore}{NCA score}
#'   \item{NVCAFlag}{NVCA flag}
#'   \item{DMF}{DMF recommendation}
#' }
"psa_synth"

#' Synthetic court event hearing date
#'
#' A synthetic court event hearing date
#'
#' @format A date variable.
"hearingdate_synth"

#' Interim Dane data with failure to appear (FTA) as an outcome
#'
#' An interim dataset containing pre-treatment covariates, a binary treatment (Z), an ordinal decision (D),
#' and an outcome variable (Y). The data used for the paper, and made available here, are interim, based on
#' only half of the observations in the study and (for those observations) only half of the study follow-up period.
#' We use them only to illustrate methods, not to draw substantive conclusions.
#'
#' @format A data frame with 1891 rows and 19 variables:
#' \describe{
#'   \item{Z}{binary treatment}
#'   \item{D}{ordinal decision}
#'   \item{Y}{outcome}
#'   \item{Sex}{male or female}
#'   \item{White}{white or non-white}
#'   \item{SexWhite}{the interaction between gender and race}
#'   \item{Age}{age}
#'   \item{PendingChargeAtTimeOfOffense}{binary variable for pending charge (felony, misdemeanor, or both) at the time of offense}
#'   \item{NCorNonViolentMisdemeanorCharge}{binary variable for current non-violent felony charge}
#'   \item{ViolentMisdemeanorCharge}{binary variable for current violent misdemeanor charge}
#'   \item{ViolentFelonyCharge}{binary variable for current violent felony charge}
#'   \item{NonViolentFelonyCharge}{binary variable for current non-violent felony charge}
#'   \item{PriorMisdemeanorConviction}{binary variable for prior conviction of misdemeanor}
#'   \item{PriorFelonyConviction}{binary variable for prior conviction of felony}
#'   \item{PriorViolentConviction}{four-level ordinal variable for prior violent conviction}
#'   \item{PriorSentenceToIncarceration}{binary variable for prior sentence to incarceration}
#'   \item{PriorFTAInPast2Years}{three-level ordinal variable for FTAs from past two years}
#'   \item{PriorFTAOlderThan2Years}{binary variable for FTAs from over two years ago}
#'   \item{Staff_ReleaseRecommendation}{four-level ordinal variable for the DMF recommendation}
#' }
"FTAdata"

#' Interim Dane data with new criminal activity (NCA) as an outcome
#'
#' An interim dataset containing pre-treatment covariates, a binary treatment (Z), an ordinal decision (D),
#' and an outcome variable (Y). The data used for the paper, and made available here, are interim, based on
#' only half of the observations in the study and (for those observations) only half of the study follow-up period.
#' We use them only to illustrate methods, not to draw substantive conclusions.
#'
#' @format A data frame with 1891 rows and 19 variables:
#' \describe{
#'   \item{Z}{binary treatment}
#'   \item{D}{ordinal decision}
#'   \item{Y}{outcome}
#'   \item{Sex}{male or female}
#'   \item{White}{white or non-white}
#'   \item{SexWhite}{the interaction between gender and race}
#'   \item{Age}{age}
#'   \item{PendingChargeAtTimeOfOffense}{binary variable for pending charge (felony, misdemeanor, or both) at the time of offense}
#'   \item{NCorNonViolentMisdemeanorCharge}{binary variable for current non-violent felony charge}
#'   \item{ViolentMisdemeanorCharge}{binary variable for current violent misdemeanor charge}
#'   \item{ViolentFelonyCharge}{binary variable for current violent felony charge}
#'   \item{NonViolentFelonyCharge}{binary variable for current non-violent felony charge}
#'   \item{PriorMisdemeanorConviction}{binary variable for prior conviction of misdemeanor}
#'   \item{PriorFelonyConviction}{binary variable for prior conviction of felony}
#'   \item{PriorViolentConviction}{four-level ordinal variable for prior violent conviction}
#'   \item{PriorSentenceToIncarceration}{binary variable for prior sentence to incarceration}
#'   \item{PriorFTAInPast2Years}{three-level ordinal variable for FTAs from past two years}
#'   \item{PriorFTAOlderThan2Years}{binary variable for FTAs from over two years ago}
#'   \item{Staff_ReleaseRecommendation}{four-level ordinal variable for the DMF recommendation}
#' }
"NCAdata"

#' Interim Dane data with new violent criminal activity (NVCA) as an outcome
#'
#' An interim dataset containing pre-treatment covariates, a binary treatment (Z), an ordinal decision (D),
#' and an outcome variable (Y). The data used for the paper, and made available here, are interim, based on
#' only half of the observations in the study and (for those observations) only half of the study follow-up period.
#' We use them only to illustrate methods, not to draw substantive conclusions.
#'
#' @format A data frame with 1891 rows and 19 variables:
#' \describe{
#'   \item{Z}{binary treatment}
#'   \item{D}{ordinal decision}
#'   \item{Y}{outcome}
#'   \item{Sex}{male or female}
#'   \item{White}{white or non-white}
#'   \item{SexWhite}{the interaction between gender and race}
#'   \item{Age}{age}
#'   \item{PendingChargeAtTimeOfOffense}{binary variable for pending charge (felony, misdemeanor, or both) at the time of offense}
#'   \item{NCorNonViolentMisdemeanorCharge}{binary variable for current non-violent felony charge}
#'   \item{ViolentMisdemeanorCharge}{binary variable for current violent misdemeanor charge}
#'   \item{ViolentFelonyCharge}{binary variable for current violent felony charge}
#'   \item{NonViolentFelonyCharge}{binary variable for current non-violent felony charge}
#'   \item{PriorMisdemeanorConviction}{binary variable for prior conviction of misdemeanor}
#'   \item{PriorFelonyConviction}{binary variable for prior conviction of felony}
#'   \item{PriorViolentConviction}{four-level ordinal variable for prior violent conviction}
#'   \item{PriorSentenceToIncarceration}{binary variable for prior sentence to incarceration}
#'   \item{PriorFTAInPast2Years}{three-level ordinal variable for FTAs from past two years}
#'   \item{PriorFTAOlderThan2Years}{binary variable for FTAs from over two years ago}
#'   \item{Staff_ReleaseRecommendation}{four-level ordinal variable for the DMF recommendation}
#' }
"NVCAdata"

#' Interim Dane PSA data
#'
#' An interim dataset containing a binary treatment (Z), ordinal decision (D), three PSA variables
#' (FTAScore, NCAScore, and NVCAFlag), DMF recommendation, and two pre-treatment covariates (binary
#' indicator for gender; binary indicator for race). The data used for the paper, and made available here, are interim, based on
#' only half of the observations in the study and (for those observations) only half of the study follow-up period.
#' We use them only to illustrate methods, not to draw substantive conclusions.
#'
#' @format A data frame with 1891 rows and 7 variables:
#' \describe{
#'   \item{Z}{binary treatment}
#'   \item{D}{ordinal decision}
#'   \item{FTAScore}{FTA score}
#'   \item{NCAScore}{NCA score}
#'   \item{NVCAFlag}{NVCA flag}
#'   \item{DMF}{DMF recommendation}
#'   \item{Sex}{male or female}
#'   \item{White}{white or non-white}
#' }
"PSAdata"

#' Interim court event hearing date
#'
#' An Interim Dane court event hearing date of Dane data in factor format. The data used for the paper, and made available here, are interim, based on
#' only half of the observations in the study and (for those observations) only half of the study follow-up period.
#' We use them only to illustrate methods, not to draw substantive conclusions.
#'
#' @format A date variable in factor format.
"HearingDate"

#' Nuisance functions (internal)
#' 
#' Nuisance functions generated with `compute_nuisance_functions` for the illustration purpose.
#' 
#' @keywords internal
#' @return A list with the following components:
#' \describe{
#'   \item{\code{z_models}}{A \code{data.frame} with the following columns:
#'     \describe{
#'       \item{\code{idx}}{Index of observation.}
#'       \item{\code{d_pred}}{Predicted probability of decision.}
#'       \item{\code{y_pred}}{Predicted probability of outcome.}
#'       \item{\code{Z}}{Treatment group.}
#'     }
#'   }
#'   \item{\code{pscore}}{A vector of predicted propensity scores.}
#' }
"nuis_func"

#' Nuisance functions conditioning on AI (internal)
#' 
#' Nuisance functions generated with `compute_nuisance_functions_ai` for the illustration purpose.
#' 
#' @keywords internal
#' @return A list with the following components:
#' \describe{
#'   \item{\code{z_models}}{A \code{data.frame} with the following columns:
#'     \describe{
#'       \item{\code{idx}}{Index of observation.}
#'       \item{\code{d_pred}}{Predicted probability of decision.}
#'       \item{\code{y_pred}}{Predicted probability of outcome.}
#'       \item{\code{Z}}{Treatment group.}
#'       \item{\code{A}}{AI recommendation.}
#'     }
#'   }
#'   \item{\code{pscore}}{A vector of predicted propensity scores.}
#' }
"nuis_func_ai"

#' Llama3 Recommendations (internal)
#' 
#' Llama3 recommendations example for the illustration purpose.
#' 
#' @keywords internal
#' @return A numeric vector of 0 or 1.
"A_llama"

#' NCA provide policy (internal; increasing monotonicity)
#' 
#' Optimal policy whether to provide PSA recommendation for NCA as an outcome 
#' and policy class with an increasing monotonicity constraint.
#' Used for the replication in the vignette.
#' 
#' @keywords internal
#' @format A data frame with 41 rows and 6 variables:
#' \describe{
#'   \item{FTAScore}{FTA score}
#'   \item{NCAScore}{NCA score}
#'   \item{NVCAFlag}{NVCA flag}
#'   \item{wts}{Weight for each observation}
#'   \item{n}{Number of such cases}
#'   \item{policy}{Optimal policy}
#' }
"nca_provide_policy"

#' NCA follow policy (internal; increasing monotonicity)
#' 
#' Optimal policy whether to follow PSA recommendation for NCA as an outcome
#' and policy class with an increasing monotonicity constraint.
#' Used for the replication in the vignette.
#' 
#' @keywords internal
#' @format A data frame with 41 rows and 6 variables:
#' \describe{
#'   \item{FTAScore}{FTA score}
#'   \item{NCAScore}{NCA score}
#'   \item{NVCAFlag}{NVCA flag}
#'   \item{wts}{Weight for each observation}
#'   \item{n}{Number of such cases}
#'   \item{policy}{Optimal policy}
#' }
"nca_follow_policy"

#' NCA provide policy (internal; decreasing monotonicity)
#' 
#' Optimal policy whether to provide PSA recommendation for NCA as an outcome 
#' and policy class with an decreasing monotonicity constraint.
#' Used for the replication in the vignette.
#' 
#' @keywords internal
#' @format A data frame with 41 rows and 6 variables:
#' \describe{
#'   \item{FTAScore}{FTA score}
#'   \item{NCAScore}{NCA score}
#'   \item{NVCAFlag}{NVCA flag}
#'   \item{wts}{Weight for each observation}
#'   \item{n}{Number of such cases}
#'   \item{policy}{Optimal policy}
#' }
"nca_provide_policy_dec"

#' NCA follow policy (internal; decreasing monotonicity)
#' 
#' Optimal policy whether to follow PSA recommendation for NCA as an outcome 
#' and policy class with an decreasing monotonicity constraint.
#' Used for the replication in the vignette.
#' 
#' @keywords internal
#' @format A data frame with 41 rows and 6 variables:
#' \describe{
#'   \item{FTAScore}{FTA score}
#'   \item{NCAScore}{NCA score}
#'   \item{NVCAFlag}{NVCA flag}
#'   \item{wts}{Weight for each observation}
#'   \item{n}{Number of such cases}
#'   \item{policy}{Optimal policy}
#' }
"nca_follow_policy_dec"