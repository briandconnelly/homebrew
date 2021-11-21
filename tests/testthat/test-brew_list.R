test_that("brew_list validates arguments correctly", {
  expect_error(brew_list(formulae = 1))
  expect_error(brew_list(casks = 1))
  expect_error(brew_list(formulae = "yes"))
  expect_error(brew_list(casks = "nope"))
  expect_error(brew_list(formulae = NA))
  expect_error(brew_list(casks = NA))
})

test_that("brew_list returns the expected tibble", {
  valid_result <- brew_list(formulae = TRUE, casks = TRUE)
  expect_true(is.data.frame(valid_result))
  expect_gte(nrow(valid_result), 0)
  expect_equal(colnames(valid_result), c("name", "version", "type"))
  expect_true(is.character(valid_result$name))
  expect_true(is.character(valid_result$version))
  expect_true(is.factor(valid_result$type))
  expect_equal(levels(valid_result$type), c("formula", "cask"))

  valid_result <- brew_list(formulae = TRUE, casks = FALSE)
  expect_true(is.data.frame(valid_result))
  expect_gte(nrow(valid_result), 0)
  expect_equal(colnames(valid_result), c("name", "version", "type"))
  expect_true(is.character(valid_result$name))
  expect_true(is.character(valid_result$version))
  expect_true(is.factor(valid_result$type))
  expect_equal(levels(valid_result$type), c("formula", "cask"))

  valid_result <- brew_list(formulae = FALSE, casks = TRUE)
  expect_true(is.data.frame(valid_result))
  expect_gte(nrow(valid_result), 0)
  expect_equal(colnames(valid_result), c("name", "version", "type"))
  expect_true(is.character(valid_result$name))
  expect_true(is.character(valid_result$version))
  expect_true(is.factor(valid_result$type))
  expect_equal(levels(valid_result$type), c("formula", "cask"))

  valid_result <- brew_list(formulae = FALSE, casks = FALSE)
  expect_true(is.data.frame(valid_result))
  expect_equal(nrow(valid_result), 0)
  expect_equal(colnames(valid_result), c("name", "version", "type"))
  expect_true(is.character(valid_result$name))
  expect_true(is.character(valid_result$version))
  expect_true(is.factor(valid_result$type))
  expect_equal(levels(valid_result$type), c("formula", "cask"))
})

valid_is_installed <- function(package = "pwgen",
                               formulae = TRUE,
                               casks = TRUE) {
  is_installed(
    package = package,
    formulae = formulae,
    casks = casks
  )
}


test_that("is_installed validates arguments correctly", {
  expect_error(valid_is_installed(package = X))
  expect_error(valid_is_installed(package = ""))
  expect_error(valid_is_installed(package = NA))
  expect_error(valid_is_installed(package = NULL))
  expect_error(valid_is_installed(package = character(0)))

  expect_error(valid_is_installed(formulae = 1))
  expect_error(valid_is_installed(casks = 1))
  expect_error(valid_is_installed(formulae = "yes"))
  expect_error(valid_is_installed(casks = "nope"))
  expect_error(valid_is_installed(formulae = NA))
  expect_error(valid_is_installed(casks = NA))

  expect_error(valid_is_installed(pkg = "pwgen"))
  # R seems to be auto-correcting these invalid arguments
  # expect_error(valid_is_installed(cask = FALSE))
  # expect_error(valid_is_installed(formula = TRUE))
})

test_that("is_installed returns a logical", {
  expect_true(is.logical(valid_is_installed()))
  expect_true(is.logical(valid_is_installed(c("pwgen", "unixodbc"))))
  expect_true(is.logical(valid_is_installed(package = "fakepackage123")))
})
