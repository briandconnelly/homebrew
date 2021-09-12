test_that("input validation for commands", {
  expect_error(brew_cleanup(package = "unixodbc"))
  expect_error(brew_doctor(package = "unixodbc"))
  expect_error(brew_update(package = "unixodbc"))
  expect_error(brew_upgrade(package = "unixodbc"))
  expect_error(brew_outdated(package = "unixodbc"))
})

test_that("brew_outdated returns a list", {
  valid_result <- brew_outdated()
  expect_true(is.character(valid_result))
  expect_gte(length(valid_result), 0)
})
