// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <RcppEigen.h>
#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// AiEvalProbitOrdinal
NumericMatrix AiEvalProbitOrdinal(NumericVector Z, NumericVector D, NumericVector Y, NumericMatrix X, NumericMatrix D_factor, NumericMatrix ZX, double rho, Nullable<NumericMatrix> RSigma0_beta_inv, Nullable<NumericMatrix> RSigma0_alpha_inv, Nullable<double> Rsigma0, Nullable<NumericVector> Rbeta, Nullable<NumericVector> Ralpha, Nullable<NumericVector> Rtheta, Nullable<NumericVector> Rdelta, int n_mcmc, bool verbose, int out_length, bool Zbeta_off, bool theta01_off, int lZX, arma::mat C);
RcppExport SEXP _aihuman_AiEvalProbitOrdinal(SEXP ZSEXP, SEXP DSEXP, SEXP YSEXP, SEXP XSEXP, SEXP D_factorSEXP, SEXP ZXSEXP, SEXP rhoSEXP, SEXP RSigma0_beta_invSEXP, SEXP RSigma0_alpha_invSEXP, SEXP Rsigma0SEXP, SEXP RbetaSEXP, SEXP RalphaSEXP, SEXP RthetaSEXP, SEXP RdeltaSEXP, SEXP n_mcmcSEXP, SEXP verboseSEXP, SEXP out_lengthSEXP, SEXP Zbeta_offSEXP, SEXP theta01_offSEXP, SEXP lZXSEXP, SEXP CSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type Z(ZSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type D(DSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type Y(YSEXP);
    Rcpp::traits::input_parameter< NumericMatrix >::type X(XSEXP);
    Rcpp::traits::input_parameter< NumericMatrix >::type D_factor(D_factorSEXP);
    Rcpp::traits::input_parameter< NumericMatrix >::type ZX(ZXSEXP);
    Rcpp::traits::input_parameter< double >::type rho(rhoSEXP);
    Rcpp::traits::input_parameter< Nullable<NumericMatrix> >::type RSigma0_beta_inv(RSigma0_beta_invSEXP);
    Rcpp::traits::input_parameter< Nullable<NumericMatrix> >::type RSigma0_alpha_inv(RSigma0_alpha_invSEXP);
    Rcpp::traits::input_parameter< Nullable<double> >::type Rsigma0(Rsigma0SEXP);
    Rcpp::traits::input_parameter< Nullable<NumericVector> >::type Rbeta(RbetaSEXP);
    Rcpp::traits::input_parameter< Nullable<NumericVector> >::type Ralpha(RalphaSEXP);
    Rcpp::traits::input_parameter< Nullable<NumericVector> >::type Rtheta(RthetaSEXP);
    Rcpp::traits::input_parameter< Nullable<NumericVector> >::type Rdelta(RdeltaSEXP);
    Rcpp::traits::input_parameter< int >::type n_mcmc(n_mcmcSEXP);
    Rcpp::traits::input_parameter< bool >::type verbose(verboseSEXP);
    Rcpp::traits::input_parameter< int >::type out_length(out_lengthSEXP);
    Rcpp::traits::input_parameter< bool >::type Zbeta_off(Zbeta_offSEXP);
    Rcpp::traits::input_parameter< bool >::type theta01_off(theta01_offSEXP);
    Rcpp::traits::input_parameter< int >::type lZX(lZXSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type C(CSEXP);
    rcpp_result_gen = Rcpp::wrap(AiEvalProbitOrdinal(Z, D, Y, X, D_factor, ZX, rho, RSigma0_beta_inv, RSigma0_alpha_inv, Rsigma0, Rbeta, Ralpha, Rtheta, Rdelta, n_mcmc, verbose, out_length, Zbeta_off, theta01_off, lZX, C));
    return rcpp_result_gen;
END_RCPP
}
// CalAPCEj_ordinal_rcpp
List CalAPCEj_ordinal_rcpp(const arma::mat& X, const arma::mat& ZX, double rho, const arma::vec& beta, const arma::vec& alpha, NumericVector theta, NumericVector delta, int p, int k, int n, NumericVector s1, NumericVector s2, NumericVector s3, NumericVector s4, NumericVector s5, int lZX, const arma::mat& C, const arma::mat& C_binary, int only_optimal_decision, const arma::urowvec& D, const arma::urowvec& D_binary, arma::urowvec& dmf, int dmf_null, int only_dmf_fair);
RcppExport SEXP _aihuman_CalAPCEj_ordinal_rcpp(SEXP XSEXP, SEXP ZXSEXP, SEXP rhoSEXP, SEXP betaSEXP, SEXP alphaSEXP, SEXP thetaSEXP, SEXP deltaSEXP, SEXP pSEXP, SEXP kSEXP, SEXP nSEXP, SEXP s1SEXP, SEXP s2SEXP, SEXP s3SEXP, SEXP s4SEXP, SEXP s5SEXP, SEXP lZXSEXP, SEXP CSEXP, SEXP C_binarySEXP, SEXP only_optimal_decisionSEXP, SEXP DSEXP, SEXP D_binarySEXP, SEXP dmfSEXP, SEXP dmf_nullSEXP, SEXP only_dmf_fairSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const arma::mat& >::type X(XSEXP);
    Rcpp::traits::input_parameter< const arma::mat& >::type ZX(ZXSEXP);
    Rcpp::traits::input_parameter< double >::type rho(rhoSEXP);
    Rcpp::traits::input_parameter< const arma::vec& >::type beta(betaSEXP);
    Rcpp::traits::input_parameter< const arma::vec& >::type alpha(alphaSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type theta(thetaSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type delta(deltaSEXP);
    Rcpp::traits::input_parameter< int >::type p(pSEXP);
    Rcpp::traits::input_parameter< int >::type k(kSEXP);
    Rcpp::traits::input_parameter< int >::type n(nSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type s1(s1SEXP);
    Rcpp::traits::input_parameter< NumericVector >::type s2(s2SEXP);
    Rcpp::traits::input_parameter< NumericVector >::type s3(s3SEXP);
    Rcpp::traits::input_parameter< NumericVector >::type s4(s4SEXP);
    Rcpp::traits::input_parameter< NumericVector >::type s5(s5SEXP);
    Rcpp::traits::input_parameter< int >::type lZX(lZXSEXP);
    Rcpp::traits::input_parameter< const arma::mat& >::type C(CSEXP);
    Rcpp::traits::input_parameter< const arma::mat& >::type C_binary(C_binarySEXP);
    Rcpp::traits::input_parameter< int >::type only_optimal_decision(only_optimal_decisionSEXP);
    Rcpp::traits::input_parameter< const arma::urowvec& >::type D(DSEXP);
    Rcpp::traits::input_parameter< const arma::urowvec& >::type D_binary(D_binarySEXP);
    Rcpp::traits::input_parameter< arma::urowvec& >::type dmf(dmfSEXP);
    Rcpp::traits::input_parameter< int >::type dmf_null(dmf_nullSEXP);
    Rcpp::traits::input_parameter< int >::type only_dmf_fair(only_dmf_fairSEXP);
    rcpp_result_gen = Rcpp::wrap(CalAPCEj_ordinal_rcpp(X, ZX, rho, beta, alpha, theta, delta, p, k, n, s1, s2, s3, s4, s5, lZX, C, C_binary, only_optimal_decision, D, D_binary, dmf, dmf_null, only_dmf_fair));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_aihuman_AiEvalProbitOrdinal", (DL_FUNC) &_aihuman_AiEvalProbitOrdinal, 21},
    {"_aihuman_CalAPCEj_ordinal_rcpp", (DL_FUNC) &_aihuman_CalAPCEj_ordinal_rcpp, 24},
    {NULL, NULL, 0}
};

RcppExport void R_init_aihuman(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}