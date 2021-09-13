valid_brew_cmd <- function(cmd = "info",
                           args = c("unixodbc"),
                           brew_cmd = Sys.which("brew"),
                           echo = FALSE,
                           ...) {
  brew_cmd(
    cmd = cmd,
    args = args,
    brew_cmd = brew_cmd,
    echo = echo,
    ...
  )
}

test_that("brew_cmd validates arguments correctly", {
  valid_result <- valid_brew_cmd()
  expect_named(valid_result)
  expect_equal(names(valid_result), c("status", "stdout", "stderr", "timeout"))

  expect_error(valid_brew_cmd(cmd = NULL))
  expect_error(valid_brew_cmd(cmd = NA))
  expect_error(valid_brew_cmd(cmd = 12))
  expect_error(valid_brew_cmd(cmd = TRUE))
  expect_error(valid_brew_cmd(cmd = c("install", "info")))

  expect_error(valid_brew_cmd(args = NULL))
  expect_error(valid_brew_cmd(args = NA))
  expect_error(valid_brew_cmd(args = 12))
  expect_error(valid_brew_cmd(args = TRUE))

  expect_error(valid_brew_cmd(brew_cmd = NULL))
  expect_error(valid_brew_cmd(brew_cmd = NA))
  expect_error(valid_brew_cmd(brew_cmd = 12))
  expect_error(valid_brew_cmd(brew_cmd = TRUE))
  expect_error(valid_brew_cmd(brew_cmd = "/really/bad/path/brew"))

  expect_error(valid_brew_cmd(echo = 1))
  expect_error(valid_brew_cmd(echo = NA))
  expect_error(valid_brew_cmd(echo = NULL))
  expect_error(valid_brew_cmd(echo = "TRUE"))

  # Catch typos / unknown arguments
  expect_error(valid_brew_cmd(ehco = TRUE))
  expect_error(valid_brew_cmd(brew_command = Sys.which("brew")))
  expect_error(valid_brew_cmd(unknown_arg = TRUE))
})


test_that("command helper functions work", {
  expect_true(length(homebrew_commands()) > 0)

  for (cmd in c("info", "install", "uninstall", "list", "doctor")) {
    expect_true(is_homebrew_command(cmd))
  }

  for (cmd in c("brew", "zanzibar", "---env")) {
    expect_false(is_homebrew_command(cmd))
  }

  expect_error(check_brew_command(brew_cmd = ""))
  expect_error(check_brew_command(brew_cmd = "/really/bad/path/brew"))
})
