brew_cmd_raw <- function(cmd,
                         args = character(),
                         brew_cmd = Sys.which("brew"),
                         echo = rlang::is_interactive(),
                         ...) {
  assertthat::assert_that(
    assertthat::is.string(cmd),
    is.vector(args),
    is.character(args),
    assertthat::is.string(brew_cmd)
  )

  if (nchar(brew_cmd) == 0 || !file.exists(brew_cmd)) {
    cli::cli_abort("Could not find {.code brew} command {.path {brew_cmd}}")
  }

  processx::run(
    command = brew_cmd,
    args = c(cmd, args),
    error_on_status = FALSE,
    echo = echo,
    ...
  )
}

#' Run a homebrew command
#'
#' @param cmd The command to run (e.g., `install`)
#' @param args Additional arguments for the command
#' @param brew_cmd Optional: Location of `brew` command.
#' @param echo Whether to print output and error messages to the screen.
#' Defaults to `TRUE` for interactive sessions.
#' @param ... Additional arguments passed to [`processx::run()`]
#'
#' @return A logical value indicating whether the command was successful or not
#' @export
#'
#' @examples
#' # TODO
brew_cmd <- function(cmd,
                     args = character(),
                     brew_cmd = Sys.which("brew"),
                     echo = rlang::is_interactive(),
                     ...) {
  ellipsis::check_dots_used()

  assertthat::assert_that(
    assertthat::is.string(cmd),
    is.vector(args),
    is.character(args),
    assertthat::is.string(brew_cmd)
  )

  if (nchar(brew_cmd) == 0 || !file.exists(brew_cmd)) {
    cli::cli_abort("Could not find {.code brew} command {.path {brew_cmd}}")
  }

  retval <- processx::run(
    command = brew_cmd,
    args = c(cmd, args),
    error_on_status = TRUE,
    echo = echo,
    ...
  )

  invisible(retval$status == 0)
}

#' @rdname brew_cmd
#' @description `brew_cleanup()` TODO
#' @export
brew_cleanup <- function(args = character(), ...) {
  brew_cmd(cmd = "cleanup", args = args, ...)
}

#' @rdname brew_cmd
#' @description `brew_doctor()` TODO
#' @export
brew_doctor <- function(args = character(), ...) {
  brew_cmd(cmd = "doctor", args = args, ...)
}

#' @rdname brew_cmd
#' @description `brew_reinstall()` TODO
#' @export
brew_reinstall <- function(args = character(), ...) {
  brew_cmd(cmd = "reinstall", args = args, ...)
}

#' @rdname brew_cmd
#' @description `brew_update()` fetches the newest version of Homebrew and all formulae
#' @export
brew_update <- function(args = character(), ...) {
  brew_cmd(cmd = "update", args = args, ...)
}

#' @rdname brew_cmd
#' @description `brew_upgrade()` upgrades outdated casks and outdated, unpinned
#'   formulae using the same options they were originally installed with, plus
#'   any appended brew formula options.
#' @export
brew_upgrade <- function(args = character(), ...) {
  brew_cmd(cmd = "upgrade", args = args, ...)
}
