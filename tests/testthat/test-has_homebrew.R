test_that("input validation and correct result type", {
  expect_error(has_homebrew(NULL))
  expect_true(is.logical(has_homebrew()))
})
