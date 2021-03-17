data(my_penguins)
penguins <- na.omit(my_penguins)

test_that("Check for error if input is incorrectly formatted", {
  expect_error(my_rf_cv("string"))
})

test_that("Check for correct output type", {
  expect_type(my_rf_cv(5), "double")
})

