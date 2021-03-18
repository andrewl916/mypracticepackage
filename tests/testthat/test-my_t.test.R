set.seed(214)
p <- 0.4
coin_flips <- rbinom(200, size = 1, prob = p)

test_that("non-numeric input throws error", {
  expect_error(my_t.test("string", alternative = "greater", mu = p))
})

test_that("Check for correct output type", {
  expect_type(my_t.test(as.numeric(coin_flips), alternative = "greater", mu = p),
              "list")
})

test_that("Checck if p_value has correct type", {
  expect_type(my_t.test(as.numeric(coin_flips), alternative = "greater", mu = p)$p_val,
              "double")
})
