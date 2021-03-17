#' t Test function
#'
#' This function performs one and two sample t-tests on vectors of data.
#'
#' @param x a numeric vector of data.
#' @param alternative a character string specifying the alternative hypothesis
#'   ("two.sided", "less", or "greater").
#' @param mu a number indicating the null hypothesis value of the mean.
#' @keywords inference
#' @return List with elements: test_stat, the numeric test statistic; df, the
#'   degrees of freedom; alternative, the value of the parameter "alternative;"
#'   and p_val, the numeric p-value.
#'
#' @importFrom randomForest randomForest
#' @importFrom stats model.frame model.matrix model.response na.omit predict pt sd terms
#' @importFrom dplyr filter pull
#' @importFrom class knn
#' @importFrom tibble tibble
#' @import ggplot2
#' @import magrittr
#'
#' @examples
#' set.seed(214)
#' p <- 0.4
#' coin_flips <- rbinom(200, size = 1, prob = p)
#' my_t.test(as.numeric(coin_flips), alternative = "greater", mu = p)
#'
#' @export

my_t.test <- function(x, alternative = "two.sided", mu) {
  if(class(x) != "numeric") {
    stop("x must be numeric")
  }
  # calculate the estimated mean
  est <- mean(x)
  # calculate the degrees of freedom
  df <- length(x) - 1
  # calculate the standard error
  se <- sd(x) / sqrt(length(x))
  # calculate the test statistic
  t_obs <-  (est - mu) / se

  # calculate the area under the curve
  if (alternative == "less") {
    p_value <- pt(t_obs, df, lower.tail = TRUE)
  } else if (alternative == "greater") {
    p_value <- pt(t_obs, df, lower.tail = FALSE)
  } else if (alternative == "two.sided") {
    # for a two sided calculation, lower.tail will depend on the sign of t_obs
    if (t_obs < 0) {
      p_value <- pt(t_obs, df, lower.tail = TRUE) * 2
    }
    else{
      p_value <- pt(t_obs, df, lower.tail = FALSE) * 2
    }
  } else {
    stop("Plese input 'greater', 'less', or 'two.sided'")
  }

  # returns summary statistics
  result <- list("test_stat" = t_obs,
                 "df" = df,
                 "alternative" = alternative,
                 "p_val" = p_value)
  return(result)
}
