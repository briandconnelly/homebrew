test_that("input validation", {
  expect_error(brew_info())
  expect_error(brew_info(TRUE))
  expect_error(brew_info(""))
  expect_error(brew_info(c("unixodbc", "")))
  expect_error(pkg = "unixodbc")
})

test_that("output", {
  valid_result1 <- brew_info(package = "unixodbc")
  expect_true(is.list(valid_result1))
  expect_equal(length(valid_result1), 1)
  expect_equal(valid_result1[[1]]$name, "unixodbc")

  valid_result2 <- brew_info(package = c("unixodbc", "pwgen"))
  expect_true(is.list(valid_result2))
  expect_equal(length(valid_result2), 2)
})
