#' Random forest cross-validation function.
#'
#' This function predicts \code{body_mass_g} using covariates \code{bill_length_mm}, \code{bill_depth_mm}, and \code{flipper_length_mm}.
#'
#' @param k number of folds
#'
#' @return Numeric indicating average MSE across all k folds
#'
#' @examples
#' my_rf_cv(5)
#'
#' @export
my_rf_cv <- function(k){
  penguins <- mypracticepackage::my_penguins
  # randomly assigns observations to folds
  folds <- sample(rep(1:k, length = nrow(penguins)))

  # initialize an empty list to store MSEs
  mse_lst <- rep()

  for (i in (1:k)){
    # define training data and test data
    train <- penguins[folds != i, ]
    test <- penguins[folds == i, ]

    # train a random forest model to predict 100 trees
    model <- randomForest(body_mass_g ~ bill_length_mm + bill_depth_mm +
                            flipper_length_mm,
                          data = train, ntree = 100)

    # predict the body mass of the i-th fold
    pred <- predict(model, test[, -1])

    # evaluate the MSE of predicted and true body mass
    mse_lst <- append(mse_lst, pred)
  }

  mse <- (1 / length(penguins)) * sum(penguins[6] - mse_lst) ^ 2
  return(mse)
}
