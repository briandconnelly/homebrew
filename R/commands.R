#' @title TODO
#' @description `brew_cleanup()` TODO
#' @inheritDotParams brew_cmd
#' @export
brew_cleanup <- function(...) {
  invisible(brew_cmd(cmd = "cleanup", ...)$status == 0)
}


#' @title TODO
#' @description `brew_doctor()` TODO
#' @inheritDotParams brew_cmd
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
#' @return TODO
#' @export
brew_outdated <- function(...) {
  result <- brew_cmd(cmd = "outdated", echo = FALSE, ...)
  strsplit(result$stdout, "\n")[[1]]
}


#' @title Display information about TODO
#' @description `brew_info()` displays brief information about your Homebrew
#' installation or specific packages.
#' @param package Name of formula or cask. If one is not given, info about your
#' homebrew environment is shown.
#' @inheritDotParams brew_cmd
#' @export
#' @examples
#' # Get info about Homebrew installation
#' brew_info()
#'
#' # Get info about unixodbc package
#' brew_info("unixodbc")
brew_info <- function(package = NULL, ...) {
  retval <- ifelse(
    is.null(package),
    brew_cmd(cmd = "info", ...),
    brew_cmd("info", args = c(package), ...)
  )

  invisible(retval$status == 0)
}
