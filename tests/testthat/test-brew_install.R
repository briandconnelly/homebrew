valid_brew_install <- function(package = "pwgen",
                               cask = FALSE,
                               force = FALSE,
                               only_dependencies = FALSE,
                               keep_tmp = FALSE,
                               ...) {
  brew_install(
    package = package,
    cask = cask,
    force = force,
    only_dependencies = only_dependencies,
    keep_tmp = keep_tmp,
    ...
  )
}

test_that("input validation", {
  expect_error(valid_brew_install(package = ""))
  expect_error(valid_brew_install(package = NA))
  expect_error(valid_brew_install(package = NULL))
  expect_error(valid_brew_install(package = character(0)))

  expect_error(valid_brew_install(cask = 1))
  expect_error(valid_brew_install(cask = "rstudio"))
  expect_error(valid_brew_install(cask = NA))
  expect_error(valid_brew_install(cask = NULL))

  expect_error(valid_brew_install(force = 1))
  expect_error(valid_brew_install(force = "yes"))
  expect_error(valid_brew_install(force = NA))
  expect_error(valid_brew_install(force = NULL))

  expect_error(valid_brew_install(only_dependencies = 1))
  expect_error(valid_brew_install(only_dependencies = "yes"))
  expect_error(valid_brew_install(only_dependencies = NA))
  expect_error(valid_brew_install(only_dependencies = NULL))

  expect_error(valid_brew_install(keep_tmp = 1))
  expect_error(valid_brew_install(keep_tmp = "yes"))
  expect_error(valid_brew_install(keep_tmp = NA))
  expect_error(valid_brew_install(keep_tmp = NULL))

  expect_error(valid_brew_install(unknown_arg = 21))
  expect_error(valid_brew_install(pakcage = "pwgen"))

  expect_error(brew_install_formula(package = ""))
  expect_error(brew_install_cask(package = ""))
  expect_error(brew_reinstall(package = ""))
  expect_error(brew_uninstall(package = ""))
})
