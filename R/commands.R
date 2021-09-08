#' @title TODO
#' @description `brew_cleanup()` TODO
#' @param ... Additional parameters passed to [brew_cmd]
#' @export
brew_cleanup <- function(...) {
  brew_cmd(cmd = "cleanup", args = args, ...)
}


#' @title TODO
#' @description `brew_doctor()` TODO
#' @inheritDotParams brew_cleanup
#' @export
brew_doctor <- function(...) {
  brew_cmd(cmd = "doctor", args = args, ...)
}


#' @title Update Homebrew environment and formulae
#' @description `brew_update()` fetches the newest version of Homebrew and all
#' formulae
#' @inheritDotParams brew_cleanup
#' @export
brew_update <- function(...) {
  brew_cmd(cmd = "update", ...)
}


#' @title Upgrade outdated packages
#' @description `brew_upgrade()` upgrades outdated casks and outdated, unpinned
#'   formulae using the same options they were originally installed with, plus
#'   any appended brew formula options.
#' @inheritDotParams brew_cleanup
#' @export
brew_upgrade <- function(...) {
  brew_cmd(cmd = "upgrade", ...)
}


#' @title Display information about TODO
#' @description `brew_info()` displays brief information about your Homebrew
#' installation or specific packages.
#' @param package Name of formula or cask. If one is not given, info about your
#' homebrew environment is shown.
#' @inheritDotParams brew_cleanup
#' @export
#' @examples
#' # Get info about Homebrew installation
#' brew_info()
#'
#' # Get info about unixodbc package
#' brew_info("unixodbc")
brew_info <- function(package = NULL, ...) {
  if (is.null(package)) {
    brew_cmd(cmd = "info", ...)
  } else {
    brew_cmd("info", args = c(package), ...)
  }
}
