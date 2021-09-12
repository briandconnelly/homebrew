test_that("brew_version works as expected", {
  # Error on unexpected arguments
  expect_error(brew_version(package = "unixodbc"))
  expect_error(brew_version(formula = FALSE))

  # Returns a named list
  valid_result <- brew_version()
  expect_true(is.list(valid_result))
  expect_named(valid_result)
  expect_true(utils::hasName(valid_result, "homebrew"))
  expect_true(utils::hasName(valid_result, "core"))
  # 'cask' won't be present if not tapped
})
