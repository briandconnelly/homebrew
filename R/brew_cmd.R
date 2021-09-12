#' Run a homebrew command
#'
#' @param cmd The command to run (e.g., `install`)
#' @param args Additional arguments for the command
#' @param brew_cmd Optional: Location of `brew` command.
#' @param echo Whether to print output and error messages to the screen.
#' Defaults to `TRUE` for interactive sessions.
#' @param ... Additional arguments passed to [`processx::run()`]
#'
#' @return A list with components:
#' \describe{
#'   \item{`status`}{The exit status of the process. If this is `NA`, then the process was killed and had no exit status.}
#'   \item{`stdout`}{The standard output of the command, in a character scalar.}
#'   \item{`stderr`}{The standard error of the command, in a character scalar.}
#'   \item{`timeout`}{Whether the process was killed because of a timeout.}
#' }
#' @export
#'
#' @examples
#' \dontrun{
#' brew_cmd("install", "unixodbc")
#' }
brew_cmd <- function(cmd,
                     args = character(),
                     brew_cmd = Sys.which("brew"),
                     echo = rlang::is_interactive(),
                     ...) {
  check_brew_command(brew_cmd)
  ellipsis::check_dots_used()

  assertthat::assert_that(
    assertthat::is.string(cmd),
    assertthat::noNA(cmd),
    is.vector(args),
    is.character(args),
    assertthat::is.string(brew_cmd),
    assertthat::is.flag(echo),
    assertthat::noNA(echo)
  )

  processx::run(
    command = brew_cmd,
    args = c(cmd, args),
    echo = echo,
    ...
  )
}

check_brew_command <- function(brew_cmd) {
  if (nchar(brew_cmd) == 0) {
    cli::cli_abort("Could not find {.code brew} command")
  } else if (!file.exists(brew_cmd)) {
    cli::cli_abort("Could not find {.code brew} command: {.path {brew_cmd}} does not exist")
  }
}


homebrew_commands <- function() {
  output <- brew_cmd(
    cmd = "commands",
    args = c("--quiet", "--include_aliases"),
    echo = FALSE
  )$stdout
  strsplit(output, "\n")[[1]]
}


is_homebrew_command <- function(cmd) {
  cmd %in% homebrew_commands()
}


assertthat::on_failure(is_homebrew_command) <- function(call, env) {
  paste(deparse(call[[2]]), "is not a valud Homebrew command")
}
