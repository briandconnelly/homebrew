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
