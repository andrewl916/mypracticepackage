#' Linear model fit function
#'
#' This function fits linear models, and can be used to perform linear
#'   regression.
#'
#' @param formula a formula class object, similar to \code{lm()}.
#' @param data input data frame.
#' @keywords inference prediction
#'
#' @return Table with rows for each coefficient (including the intercept) and
#'   columns for the Estimate, Std. Error, t value, and Pr(>|t|).
#'
#' @examples
#' formula <- mpg ~ hp + wt
#' data <- mtcars
#' my_lm(formula, data)
#'
#' @export

my_lm <- function(formula, data){
  # extract model matrix x
  x <- model.matrix(formula, data)
  # extract model frame y
  y <- model.response(model.frame(formula, data))

  # calculate the coefficient
  beta <- (solve(t(x) %*% x)) %*% t(x) %*% y
  # calculate the degrees of freedom
  df <- nrow(x) - (length(attr(terms(formula), "term.labels")) + 1)
  # calculate the reference
  var <- sum((y - x %*% beta)^2 / df)
  # calculate the standard error
  se <- sqrt(diag(var * solve(t(x) %*% x)))

  # calculate the test statistic
  t_obs <- beta / se
  # calculate the p-value
  p_value <- pt(abs(t_obs), df, lower.tail = FALSE) * 2

  # creates a table that displays summary statistics
  summary_table <- data.frame(beta,
                              se,
                              t_obs,
                              p_value)

  # assign column names
  names(summary_table)[1:4] <- c("Estimate",
                                 "Std. Error",
                                 "t value",
                                 "Pr(>|t|)")
  return(summary_table)
}
