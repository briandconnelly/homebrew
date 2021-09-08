#' @title TODO
#' @description `brew_cleanup()` TODO
#' @param ... Additional parameters passed to [brew_cmd]
#' @export
brew_cleanup <- function(...) {
  invisible(brew_cmd(cmd = "cleanup", args = args, ...)$status == 0)
}


#' @title TODO
#' @description `brew_doctor()` TODO
#' @inheritDotParams brew_cleanup
#' @export
brew_doctor <- function(...) {
  invisible(brew_cmd(cmd = "doctor", args = args, ...)$status == 0)
}


#' @title Update Homebrew environment and formulae
#' @description `brew_update()` fetches the newest version of Homebrew and all
#' formulae
#' @inheritDotParams brew_cleanup
#' @export
brew_update <- function(...) {
  invisible(brew_cmd(cmd = "update", ...)$status == 0)
}


#' @title Upgrade outdated packages
#' @description `brew_upgrade()` upgrades outdated casks and outdated, unpinned
#'   formulae using the same options they were originally installed with, plus
#'   any appended brew formula options.
#' @inheritDotParams brew_cleanup
#' @export
brew_upgrade <- function(...) {
  invisible(brew_cmd(cmd = "upgrade", ...)$status == 0)
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
    retval <- brew_cmd(cmd = "info", ...)
  } else {
    retval <- brew_cmd("info", args = c(package), ...)
  }

  invisible(retval$status == 0)
}
