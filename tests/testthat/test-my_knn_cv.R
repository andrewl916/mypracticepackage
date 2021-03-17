test_that("Check for error if input has NA data", {
  expect_error((my_knn_cv(my_penguins[3:6], my_penguins %>% dplyr::pull(species)
                          , 1, 5)))
})

my_penguins <- na.omit(my_penguins)

test_that("Check for correct output type", {
  expect_type(my_knn_cv(my_penguins[3:6], my_penguins %>% dplyr::pull(species)
                        , 1, 5), "list")
})

