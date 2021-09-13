valid_brew_analytics <- function(package = "pwgen",
                                 days = 30,
                                 category = "install",
                                 ...) {
  brew_analytics(
    package = package,
    days = days,
    category = category,
    ...
  )
}


test_that("input validation", {
  expect_error(valid_brew_analytics(package = ""))
  expect_error(valid_brew_analytics(package = NA))
  expect_error(valid_brew_analytics(package = NULL))
  expect_error(valid_brew_analytics(package = character(0)))

  expect_error(valid_brew_analytics(days = 31))
  expect_error(valid_brew_analytics(days = "30"))
  expect_error(valid_brew_analytics(days = TRUE))
  expect_error(valid_brew_analytics(days = c(30, 90)))

  expect_error(valid_brew_analytics(category = 1))
  expect_error(valid_brew_analytics(category = "installs"))
  expect_error(valid_brew_analytics(category = TRUE))
  expect_error(valid_brew_analytics(category = c("install", "build-error")))

  expect_error(valid_brew_analytics(invalid_arg = TRUE))
  expect_error(valid_brew_analytics(categories = TRUE))
})

test_that("expected output", {
  expect_invisible(valid_brew_analytics())
  expect_true(is.logical(valid_brew_analytics()))
})
