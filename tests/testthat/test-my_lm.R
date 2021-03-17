test_that("Check for error if input is incorrectly formatted", {
  expect_error(my_lm("string", y ~ x))
})

data("mtcars")
formula <- mpg ~ hp + wt
data <- mtcars

test_that("Check for correct output type", {
  expect_type(my_lm(formula, data), "list")
})

