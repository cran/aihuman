## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.height = 6, fig.width = 9,
  message = FALSE
)
options(rmarkdown.html_vignette.check_title = FALSE)

## ----setup--------------------------------------------------------------------
library(aihuman)
library(tidyr)
library(dplyr)
library(ggplot2)
## set default ggplot theme
theme_set(theme_bw(base_size = 15) + theme(plot.title = element_text(hjust = 0.5)))

## ----data_main----------------------------------------------------------------
# randomized PSA provision (0: none, 1: provided)
Z <- aihuman::NCAdata$Z
# judge's release decision (0: signature, 1: cash)
D <- if_else(aihuman::NCAdata$D == 0, 0, 1)
# dichotomized pretrial public safety assessment scores (0: signature, 1: cash)
A <- aihuman::PSAdata$DMF
# new criminal activity (0: no, 1: yes)
Y <- aihuman::NCAdata$Y

## ----data_subgroup------------------------------------------------------------
# race
race_vec <- aihuman::NCAdata |> 
  mutate(race = if_else(White == 1, "White", "Non-white")) |>
  pull(race)
# gender
gender_vec <- aihuman::NCAdata |> 
  mutate(gender = if_else(Sex == 1, "Male", "Female")) |>
  pull(gender)

## ----cov----------------------------------------------------------------------
cov_mat <- aihuman::NCAdata |> 
  select(-c(Y, D, Z)) |> 
  bind_cols(FTAScore = aihuman::PSAdata$FTAScore, 
            NCAScore = aihuman::PSAdata$NCAScore, 
            NVCAFlag = aihuman::PSAdata$NVCAFlag) |>
  as.matrix()
colnames(cov_mat)

## ----nuisance, eval = FALSE---------------------------------------------------
# nuis_func <- compute_nuisance_functions(Y = Y, D = D, Z = Z, V = cov_mat, shrinkage = 0.01, n.trees = 1000)

## ----nuisance_ai, eval = FALSE------------------------------------------------
# nuis_func_ai <- compute_nuisance_functions_ai(Y = Y, D = D, Z = Z, A = A, V = cov_mat, shrinkage = 0.01, n.trees = 1000)

## ----table_human--------------------------------------------------------------
counts <- table(D[Z == 0], A[Z == 0])
proportions <- prop.table(counts) * 100  
combined_table_human <- matrix(sprintf("%.1f%% (%d)", proportions, counts),
                         nrow = nrow(counts), ncol = ncol(counts))
colnames(combined_table_human) <- c("Signature", "Cash")
rownames(combined_table_human) <- c("Signature", "Cash")
knitr::kable(combined_table_human, caption = "Table 1 (Human v. PSA)")

## ----table_human_ai-----------------------------------------------------------
counts <- table(D[Z == 1], A[Z == 1])
proportions <- prop.table(counts) * 100  
combined_table_human_ai <- matrix(sprintf("%.1f%% (%d)", proportions, counts),
                         nrow = nrow(counts), ncol = ncol(counts))
colnames(combined_table_human_ai) <- c("Signature", "Cash")
rownames(combined_table_human_ai) <- c("Signature", "Cash")
knitr::kable(combined_table_human_ai, caption = "Table 1 (Human+PSA v. PSA)")

## ----agreement----------------------------------------------------------------
table_agreement(
  Y = Y,
  D = D,
  Z = Z,
  A = A,
  subgroup1 = race_vec,
  subgroup2 = gender_vec,
  label.subgroup1 = "Race",
  label.subgroup2 = "Gender"
) |>
  mutate_at(vars(agree_diff, agree_diff_se, ci_ub, ci_lb), ~round(., 3)) |>
  knitr::kable(caption = "Agreement of Human and PSA Decision Makers")
plot_agreement(
  Y = Y,
  D = D,
  Z = Z,
  A = A,
  subgroup1 = race_vec,
  subgroup2 = gender_vec,
  label.subgroup1 = "Race",
  label.subgroup2 = "Gender",
  x.order = c("Overall", "Non-white", "White", "Female", "Male"),
  p.title = "Agreement between Human Decisions and PSA Recommendations", p.lb = -0.25, p.ub = 0.25
)

## ----diff_human---------------------------------------------------------------
# AIPW estimator
compute_stats_aipw(
  Y = Y,
  D = D,
  Z = Z,
  nuis_funcs = nuis_func, 
  true.pscore = rep(0.5, length(D)),
  X = NULL,
  l01 = 1
)
# Difference-in-means (Neyman) estimator
compute_stats(
  Y = Y,
  D = D,
  Z = Z,
  X = NULL,
  l01 = 1
)

## ----diff_human_vis-----------------------------------------------------------
plot_diff_human_aipw(
  Y = Y,
  D = D,
  Z = Z,
  nuis_funcs = nuis_func, 
  l01 = 1,
  true.pscore = rep(0.5, length(D)),
  subgroup1 = race_vec,
  subgroup2 = gender_vec,
  label.subgroup1 = "Race",
  label.subgroup2 = "Gender",
  x.order = c("Overall", "Non-white", "White", "Female", "Male"),
  p.title = NULL, p.lb = -0.3, p.ub = 0.3
)

## ----diff_human_vis_override1, warning=FALSE----------------------------------
plot_diff_subgroup(
  Y = Y,
  D = D,
  Z = Z,
  A = A,
  a = 1,
  l01 = 1,
  nuis_funcs = nuis_func,
  true.pscore = rep(0.5, length(D)),
  subgroup1 = race_vec,
  subgroup2 = gender_vec,
  label.subgroup1 = "Race",
  label.subgroup2 = "Gender",
  x.order = c("Overall", "Non-white", "White", "Female", "Male"),
  p.title = NULL, p.lb = -0.5, p.ub = 0.5,
  label = "TNP - FNP",
  metrics = c("True Negative Proportion (TNP)", "False Negative Proportion (FNP)", "TNP - FNP")
)

## ----diff_human_vis_override0, warning=FALSE----------------------------------
plot_diff_subgroup(
  Y = Y,
  D = D,
  Z = Z,
  A = A,
  a = 0,
  l01 = 1,
  nuis_funcs = nuis_func,
  true.pscore = rep(0.5, length(D)),
  subgroup1 = race_vec,
  subgroup2 = gender_vec,
  label.subgroup1 = "Race",
  label.subgroup2 = "Gender",
  x.order = c("Overall", "Non-white", "White", "Female", "Male"),
  p.title = NULL, p.lb = -0.5, p.ub = 0.5,
  label = "TPP - FPP",
  metrics = c("True Positive Proportion (TPP)", "False Positive Proportion (FPP)", "TPP - FPP")
)

## ----diff_ai------------------------------------------------------------------
# AIPW estimator
compute_bounds_aipw(
  Y = Y,
  D = D,
  Z = Z,
  A = A,
  nuis_funcs = nuis_func, 
  nuis_funcs_ai = nuis_func_ai,
  true.pscore = rep(0.5, length(D)),
  X = NULL,
  l01 = 1
)

## ----diff_ai_vis--------------------------------------------------------------
# AI versus Human
plot_diff_ai_aipw(
  Y = Y,
  D = D,
  Z = Z,
  A = A,
  z_compare = 0,
  nuis_funcs = nuis_func, 
  nuis_funcs_ai = nuis_func_ai,
  l01 = 1,
  true.pscore = rep(0.5, length(D)),
  subgroup1 = race_vec,
  subgroup2 = gender_vec,
  label.subgroup1 = "Race",
  label.subgroup2 = "Gender",
  x.order = c("Overall", "Non-white", "White", "Female", "Male"),
  p.title = NULL, p.lb = -0.3, p.ub = 0.3
)

# AI versus Human+AI
plot_diff_ai_aipw(
  Y = Y,
  D = D,
  Z = Z,
  A = A,
  z_compare = 1,
  nuis_funcs = nuis_func, 
  nuis_funcs_ai = nuis_func_ai,
  l01 = 1,
  true.pscore = rep(0.5, length(D)),
  subgroup1 = race_vec,
  subgroup2 = gender_vec,
  label.subgroup1 = "Race",
  label.subgroup2 = "Gender",
  x.order = c("Overall", "Non-white", "White", "Female", "Male"),
  p.title = NULL, p.lb = -0.3, p.ub = 0.3
)

## ----diff_llama---------------------------------------------------------------
# Llama3 versus Human
plot_diff_ai_aipw(
  Y = Y,
  D = D,
  Z = Z,
  A = A_llama,
  z_compare = 0,
  nuis_funcs = nuis_func, 
  nuis_funcs_ai = nuis_func_ai,
  l01 = 1,
  true.pscore = rep(0.5, length(D)),
  subgroup1 = race_vec,
  subgroup2 = gender_vec,
  label.subgroup1 = "Race",
  label.subgroup2 = "Gender",
  x.order = c("Overall", "Non-white", "White", "Female", "Male"),
  y.lab = "Llama3 versus Human", p.label = c("Llama3 worse", "Llama3 better"),
  p.title = NULL, p.lb = -0.5, p.ub = 0.5
)

## ----preference---------------------------------------------------------------
# When to prefer human decision maker over AI recommendation
plot_preference(
  Y = Y,
  D = D,
  Z = Z,
  A = A,
  z_compare = 0,
  nuis_funcs = nuis_func, 
  nuis_funcs_ai = nuis_func_ai,
  l01_seq = 10^seq(-2, 2, length.out = 200), 
  alpha = 0.05,
  true.pscore = rep(0.5, length(D)),
  subgroup1 = race_vec,
  subgroup2 = gender_vec,
  label.subgroup1 = "Race",
  label.subgroup2 = "Gender",
  x.order = c("Overall", "Non-white", "White", "Female", "Male"),
  p.title = NULL, 
  legend.position = "bottom",
  p.label = c("AI-alone preferred", "Human-alone preferred", "Ambiguous")
) +
  scale_color_manual("",
                     values = c("", "#4d9221", "grey30"),
                     labels = c("", "Human-alone preferred", "Ambiguous"), drop = FALSE
  ) +
  scale_linetype_manual("", values = c(1, 1, 3), labels = c("", "Human-alone preferred", "Ambiguous"), drop = FALSE)
# When to prefer human+AI decision maker over AI recommendation
plot_preference(
  Y = Y,
  D = D,
  Z = Z,
  A = A,
  z_compare = 1,
  nuis_funcs = nuis_func, 
  nuis_funcs_ai = nuis_func_ai,
  l01_seq = 10^seq(-2, 2, length.out = 200), 
  alpha = 0.05,
  true.pscore = rep(0.5, length(D)),
  subgroup1 = race_vec,
  subgroup2 = gender_vec,
  label.subgroup1 = "Race",
  label.subgroup2 = "Gender",
  x.order = c("Overall", "Non-white", "White", "Female", "Male"),
  p.title = NULL, 
  legend.position = "bottom",
  p.label = c("AI-alone preferred", "Human-alone preferred", "Ambiguous")
) +
  scale_color_manual("",
              values = c("", "#4d9221", "grey30"),
              labels = c("", "Human-with-algorithm preferred", "Ambiguous"), drop = FALSE
          ) +
  scale_linetype_manual("", values = c(1, 1, 3), labels = c("", "Human-with-algorithm preferred", "Ambiguous"), drop = FALSE)

## ----policy_helper, eval = FALSE----------------------------------------------
# library(gurobi)
# ## Optimization functions
# make_edge_mat <- function(X) {
#   n <- nrow(X)
#   lapply(1:n,
#          function(i) {
#            vapply(1:n,
#                   function(j) {
#                     if(all(X[i,] <= X[j,]) & i != j) {
#                       e <- numeric(2 * n)
#                       e[j] <- 1
#                       e[n + i] <- -1
#                     } else {
#                       e <- numeric(2 * n)
#                     }
#                     return(e)
#                   },
#                   numeric(2 * n)) %>% t()
#          }) %>% do.call(rbind, .) %>% unique() %>% Matrix::Matrix()
# }
# 
# make_action_mat <- function(n, k) {
#   do.call(cbind, lapply(1:k, function(a) a * Matrix::Diagonal(n)))
# }
# 
# create_monotone_constraints <- function(X, rev = FALSE) {
#   n <- nrow(X)
#   d <- ncol(X)
# 
#   # policy vector is (pi(1,.),...,pi(A,.))
#   # sum to one constraints
#   pi_sum_to_one <- do.call(cbind, lapply(1:2, function(x) Matrix::Diagonal(n)))
#   rhs_sum_to_one <- rep(1, n)
#   sense_sum_to_one <- rep("=", n)
# 
#   # monotonicy constraints
#   edge_mat <- make_edge_mat(X)
#   action_mat <- make_action_mat(n, 2)
#   # the following codes insure that (1) edge_mat: select pairs that monotonicity should hold in a correct order (i.e. if X[i,]<X[j,] then assign 1 to j and -1 to i) (2) rbind(action_mat, action_mat): if multiplied by a vector of binary actions (length = 2*n since there exist two actions), it selects the action that has been chosen (e.g. if action 1 = 0 and action 2 = 1 for a given observation, it gives the value of 2)
#   monotone_mat <- edge_mat %*% rbind(action_mat, action_mat)
#   rhs_monotone <- rep(0, nrow(monotone_mat))
#   if(isTRUE(rev)) {
#     sense_monotone <- rep("<=", nrow(monotone_mat))
#   } else {
#     sense_monotone <- rep(">=", nrow(monotone_mat))
#   }
#   A <- rbind(pi_sum_to_one, monotone_mat)
#   rhs <- c(rhs_sum_to_one, rhs_monotone)
#   sense <- c(sense_sum_to_one, sense_monotone)
# 
#   # restrict variables
#   vtype <- rep("B", n * 2) # binary policy decisions
# 
#   return(list(A = A, rhs = rhs, sense = sense, vtype = vtype))
# }
# 
# get_monotone_policy <- function(X, wts, rev = FALSE) {
#   n <- nrow(X)
#   # get the constraints
#   model <- create_monotone_constraints(as.matrix(X), rev = rev)
#   # solve
#   model$obj <- c(numeric(n), wts)
#   model$modelsense <- "min"
#   sol <- gurobi(model)
# 
#   # extract values
#   policy <- apply(matrix(sol$x, ncol = 2), 1, which.max) - 1
# 
#   return(policy)
# }
# 
# get_monotone_policy_ai <- function(X, wts, rev = FALSE) {
#   X_df <- data.frame(X)
#   wts_df <- data.frame(wts)
#   colnames(wts_df) <- "wts"
#   comb_df <- bind_cols(X_df, wts_df)
# 
#   # get distinct X values and the sum of the weights on them
#   grouped_df <- comb_df %>%
#     group_by(across(-wts)) %>%
#     summarise(across(everything(), sum),
#               n = n(),
#               .groups = "drop"
#     )
# 
#   X_distinct <- grouped_df %>%
#     select(-wts, -n) %>%
#     as.matrix()
#   wts_distinct <- grouped_df %>% pull(wts)
# 
#   policy <- get_monotone_policy(X_distinct, wts_distinct, rev = rev)
# 
#   grouped_df <- grouped_df %>%
#     mutate(policy = policy)
# 
#   return(grouped_df)
# }
# 
# ## Weights functions
# compute_wts_dr <- function(Y, D, Z, nuis_funcs, pscore = NULL, l01 = 1) {
#   ## update the propensity score if provided
#   if (!is.null(pscore)) {
#     nuis_funcs$pscore <- pscore
#   }
# 
#   ## check whether Z is 0/1 binary variable
#   if (any(sort(unique(Z)) != c(0, 1))) {
#     stop("Z must be a binary variable")
#   }
#   dat <- data.frame(Y = Y, D = D, Z = Z, pscore = nuis_funcs$pscore)
# 
#   preds <- nuis_funcs$z_models |>
#     pivot_wider(names_from = c(Z), values_from = c(-Z, -idx), names_sep = "") |>
#     select(-idx)
# 
#   dat <- dat %>%
#     bind_cols(preds)
# 
#   wts <- dat %>%
#     mutate(
#       p.1i = (1 - d_pred1) * ((1 + l01) * y_pred1 - l01) + (1 + l01) * Z * (1 - D) * (Y - y_pred1) / pscore - ((1 + l01) * y_pred1 - l01) * Z * (D - d_pred1) / pscore,
#       p.0i = (1 - d_pred0) * ((1 + l01) * y_pred0 - l01) + (1 + l01) * (1 - Z) * (1 - D) * (Y - y_pred0) / (1 - pscore) - ((1 + l01) * y_pred0 - l01) * (1 - Z) * (D - d_pred0) / (1 - pscore),
#       p.i = p.1i - p.0i
#     ) %>%
#     pull(p.i)
# 
#   return(wts)
# }
# 
# compute_bound_wts_dr <- function(Y, A, D, Z, nuis_funcs1, nuis_funcs2, pscore = NULL, l01 = 1) {
#   ## update the propensity score if provided
#   if (!is.null(pscore)) {
#     nuis_funcs1$pscore <- pscore
#     nuis_funcs2$pscore <- pscore
#   }
# 
#   ## check whether Z is 0/1 binary variable
#   if (any(sort(unique(Z)) != c(0, 1))) {
#     stop("Z must be a binary variable")
#   }
#   data <- data.frame(Y = Y, D = D, Z = Z, A = A, pscore = nuis_funcs1$pscore)
# 
#   preds1 <- nuis_funcs1$z_models |>
#     pivot_wider(names_from = c(Z), values_from = c(-Z, -idx), names_sep = "") |>
#     select(-idx)
# 
#   preds2 <- nuis_funcs2$z_models |>
#     pivot_wider(names_from = c(Z, A), values_from = c(-Z, -A, -idx), names_sep = "") |>
#     select(-idx)
# 
#   data <- data %>%
#     bind_cols(preds1, preds2)
# 
#   wts <- data %>%
#     mutate(
#       # gU0.i = 1 if z'=1 i.e. Pr(Y=0,D=0|A=0,Z=1,X=x) > Pr(Y=0,D=0|A=0,Z=0,X=x)
#       gU0.i = 1 * ((1 - d_pred10) * (1 - y_pred10) >= (1 - d_pred00) * (1 - y_pred00)),
#       # phi_z0(x): Pr(Y=0,D=0,A=0|Z=z,X=x)
#       p10.i = (1 - A) * (1 - d_pred10) * (1 - y_pred10) - Z * (1 - A) * (1 - D) * (Y - y_pred10) / pscore - (1 - y_pred10) * Z * (1 - A) * (D - d_pred10) / pscore,
#       p00.i = (1 - A) * (1 - d_pred00) * (1 - y_pred00) - (1 - Z) * (1 - A) * (1 - D) * (Y - y_pred00) / (1 - pscore) - (1 - y_pred00) * (1 - Z) * (1 - A) * (D - d_pred00) / (1 - pscore)
#     ) %>%
#     mutate(
#       p10_gU0.i = p10.i * gU0.i,
#       p00_gU0.i = p00.i * gU0.i
#     ) %>%
#     mutate(
#       fn_diff_ub.0i = p01.i - p0.i + p00.D.i - p10_gU0.i + p00_gU0.i,
#       fp_diff_ub.0i = p01.i - p0.i + p01.D.i - p10_gU0.i + p00_gU0.i,
#       loss_diff_ub.0i = fn_diff_ub.0i + l01 * fp_diff_ub.0i
#     ) %>%
#     pull(loss_diff_ub.0i)
# 
#   return(wts)
# }

## ----policy_helper_value------------------------------------------------------
get_policy_value <- function(policy, n_obs = 1891) {
    v <- policy |>
        mutate(wts_policy = wts * policy) |>
        pull(wts_policy) |>
        sum()
    return(v/n_obs)
}

## ----policy_inc_provide, eval = FALSE-----------------------------------------
# psaX <- cov_mat[,c("FTAScore", "NCAScore", "NVCAFlag")]
# nca_wts <- compute_wts_dr(Y = Y, D = D, Z = Z, nuis_funcs = nuis_func, pscore = 0.5, l01 = 1)
# nca_provide_policy <- get_monotone_policy_ai(X = psaX, wts = nca_wts)

## ----policy_inc_provide_report------------------------------------------------
## The estimated values of the empirical risk minimization problem
get_policy_value(nca_provide_policy, n_obs = length(Y))

## Visualization
nca_provide_policy |>
    filter(NVCAFlag == 1) |>
    mutate(
            policy = factor(policy, levels = c(0, 1)),
            NVCAFlag = paste0("NVCA Flag: ", NVCAFlag)
        ) |>
        ggplot(aes(x = NCAScore, y = FTAScore, fill = policy)) +
        geom_tile(color = "grey50") +
        geom_segment(aes(x = 2.5, xend = 4.5, y = 4.5, yend = 4.5), lty = 3) +
        geom_segment(aes(x = 4.5, xend = 4.5, y = 4.5, yend = 1.5), lty = 3) +
        facet_grid(. ~ NVCAFlag) +
        scale_fill_brewer("PSA Recommendation Provision",
            type = "seq", palette = "Blues",
            direction = 1
        ) +
        scale_y_reverse(breaks = 1:6) +
        scale_x_continuous(breaks = 1:6) +
        expand_limits(x = 0.5:6, y =0.5:6) +
        labs(x = "NCA Score", 
             y = "FTA Score",
             title = "Whether to provide PSA recommendations") +
        coord_fixed(expand = F) +
        theme_classic(base_size = 15) +
        scale_fill_brewer("", breaks = 0:1, labels = c("Not Provide", "Provide")) +
        theme(legend.position = "bottom", plot.title = element_text(hjust = 0.5)) +
        geom_text(aes(label = n), color = "grey10")

## ----policy_dec_provide, eval = FALSE-----------------------------------------
# nca_provide_policy_dec <- get_monotone_policy_ai(X = psaX, wts = nca_wts, rev = TRUE)

## ----policy_dec_provide_report------------------------------------------------
get_policy_value(nca_provide_policy_dec, n_obs = length(Y))

## ----policy_inc_follow, eval = FALSE------------------------------------------
# nca_wts <- compute_bound_wts_dr(Y = Y, A = A, D = D, Z = Z, nuis_funcs1 = nuis_func, nuis_funcs2 = nuis_func_ai, pscore = 0.5, l01 = 1)
# nca_follow_policy <- get_monotone_policy_ai(X = psaX, wts = nca_wts)

## ----policy_inc_follow_report-------------------------------------------------
## The estimated values of the empirical risk minimization problem
get_policy_value(nca_follow_policy, n_obs = length(Y))

## Visualization
nca_follow_policy |>
    filter(NVCAFlag == 1) |>
    mutate(
            policy = factor(policy, levels = c(0, 1)),
            NVCAFlag = paste0("NVCA Flag: ", NVCAFlag)
        ) |>
        ggplot(aes(x = NCAScore, y = FTAScore, fill = policy)) +
        geom_tile(color = "grey50") +
        geom_segment(aes(x = 2.5, xend = 4.5, y = 4.5, yend = 4.5), lty = 3) +
        geom_segment(aes(x = 4.5, xend = 4.5, y = 4.5, yend = 1.5), lty = 3) +
        facet_grid(. ~ NVCAFlag) +
        scale_fill_brewer("PSA Recommendation Provision",
            type = "seq", palette = "Blues",
            direction = 1
        ) +
        scale_y_reverse(breaks = 1:6) +
        scale_x_continuous(breaks = 1:6) +
        expand_limits(x = 0.5:6, y =0.5:6) +
        labs(x = "NCA Score", 
             y = "FTA Score",
             title = "Whether to follow PSA recommendations") +
        coord_fixed(expand = F) +
        theme_classic(base_size = 15) +
        scale_fill_brewer("", type = "seq", palette = "Reds", direction = 1,
                          breaks = 0:1, label = c("Do not follow", "Follow")) +
        theme(legend.position = "bottom", plot.title = element_text(hjust = 0.5)) +
        geom_text(aes(label = n), color = "grey10")

## ----policy_dec_follow, eval = FALSE------------------------------------------
# nca_follow_policy_dec <- get_monotone_policy_ai(X = psaX, wts = nca_wts, rev = TRUE)

## ----policy_dec_follow_report-------------------------------------------------
get_policy_value(nca_follow_policy_dec, n_obs = length(Y))

