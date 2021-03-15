#' k-nearest neighbors cross-validation function
#'
#' This function predicts output class of an input data using k-nearest
#'   neighbors cross-validation
#'
#' @param train input data frame.
#' @param cl true class value of your training data.
#' @param k_nn integer representing the number of neighbors.
#' @param k_cv integer representing the number of folds.
#'
#' @return List containing elements: class, a vector of the predicted class for
#'   for all observations; and cv_err, a numeric with the cross-validation
#'   misclassification error.
#'
#' @examples
#' # import palmerpenguins data
#' data(package = "palmerpenguins")
#' # delete rows with NA data
#' penguins <- na.omit(penguins)
#'
#' # create x and y matrices
#' train <- penguins[3:6]
#' cl <- penguins %>% pull(species)
#' cv_err <- my_knn_cv(train, cl, 1, 5)$cv_error
#'
#' @export

my_knn_cv <- function(train, cl, k_nn, k_cv){
  # randomly assigns observations to folds 1,...,k
  folds <- sample(rep(1:k_cv, length = length(cl)))

  # create empty list to store predictions
  preds <- rep(NA, length(cl))

  for (i in (1:k_cv)){
    # create training and testing data
    x_train <- train[folds != i, ]
    x_test <- train[folds == i, ]
    y_train <- cl[folds != i]
    y_test <- cl[folds == i]

    # use knn() to predict the class of the i-th fold
    y_pred <- knn(x_train, x_test, y_train, k = k_nn)

    # record the prediction
    preds[folds == i] <- y_pred
  }
  # calculate the class given the full data
  class <- knn(train, train, cl, k = k_nn)

  # converts class names in cl to numeric factor values
  cl_num <- rep(NA, length(cl))
  for (i in seq(1, length(cl))) {
    if (cl[i] == "Adelie") {
      cl_num[i] <- 1
    } else if (cl[i] == "Chinstrap") {
      cl_num[i] <- 2
    } else {
      cl_num[i] <- 3
    }
  }

  # calculate the misclassification and training set errors
  cv_err <- mean(preds != cl_num)
  training_err <- mean(class != cl)

  # put list and cv_error into one list
  results <- list("class" = class,
                  "cv_error" = cv_err,
                  "training_error" = training_err)

  return(results)
}
