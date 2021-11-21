#' @title Clean up Homebrew environment
#' @description `brew_cleanup()` removes stale lock files and outdated downloads
#' for all formulae and casks, and removes old versions of installed formulae.
#' @inheritDotParams brew_cmd
#' @export
brew_cleanup <- function(...) {
  invisible(brew_cmd(cmd = "cleanup", ...)$status == 0)
}


#' @title Check for potential problems
#' @description `brew_doctor()` checks your system for potential problems
#' @inheritDotParams brew_cmd
#' @return Logical value indicating whether or not problems were found
#' @export
brew_doctor <- function(...) {
  invisible(brew_cmd(cmd = "doctor", ...)$status == 0)
}


#' @title Update Homebrew environment and formulae
#' @description `brew_update()` fetches the newest version of Homebrew and all
#' formulae
#' @inheritDotParams brew_cmd
#' @export
brew_update <- function(...) {
  invisible(brew_cmd(cmd = "update", ...)$status == 0)
}


#' @title Upgrade outdated packages
#' @description `brew_upgrade()` upgrades outdated casks and outdated, unpinned
#'   formulae using the same options they were originally installed with, plus
#'   any appended brew formula options.
#' @inheritDotParams brew_cmd
#' @export
brew_upgrade <- function(...) {
  invisible(brew_cmd(cmd = "upgrade", ...)$status == 0)
}


#' @title List outdated packages
#' @description `brew_outdated()` returns a list of installed packages that have
#' an updated version available
#' @inheritDotParams brew_cmd
#' @return A list of strings, one for each package that is outdated
#' @export
brew_outdated <- function(...) {
  result <- brew_cmd(cmd = "outdated", echo = FALSE, ...)
  strsplit(result$stdout, "\n")[[1]]
}


#' @title Get help
#' @description `brew_help()` can be used to get information about Homebrew or
#' the available commands
#' @inheritDotParams brew_cmd
#' @return A string
#' @export
#' @examples
#' \dontrun{
#' # Get help about the 'install' command
#' brew_help("install")
#' }
brew_help <- function(...) {
  cli::cli_verbatim(brew_cmd(cmd = "help", echo = FALSE, ...)$stdout)
}
