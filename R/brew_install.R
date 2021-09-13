#' Install a formula or cask
#'
#' @description `brew_install()` installs a formula or cask
#'
#' @param package Name of package(s) (formula or cask)
#' @param cask If `TRUE`, `package` refers to a cask. If `FALSE` (default),
#' `package` refers to a formula.
#' @param force Do not check for previous installations
#' (default: `FALSE`)
#' @param only_dependencies Install only dependencies and not the formula itself
#' (default: `FALSE`)
#' @param keep_tmp Do not delete temporary files created during installation
#' (default: `FALSE`)
#' @inheritDotParams brew_cmd
#'
#' @return A logical value indicating whether or not the installation was a
#' success
#'
#' @export
#'
#' @examples
#' \dontrun{
#' brew_install("unixodbc")
#' }
brew_install <- function(package,
                         cask = FALSE,
                         force = FALSE,
                         only_dependencies = FALSE,
                         keep_tmp = FALSE,
                         ...) {
  assertthat::assert_that(
    is.character(package),
    all(nchar(package) > 0),
    length(package) > 0,
    assertthat::is.flag(cask),
    assertthat::noNA(cask),
    assertthat::is.flag(force),
    assertthat::noNA(force),
    assertthat::is.flag(only_dependencies),
    assertthat::noNA(only_dependencies),
    assertthat::is.flag(keep_tmp),
    assertthat::noNA(keep_tmp)
  )

  args <- c()

  if (cask) args <- append(args, "--cask")
  if (force) args <- append(args, "--force")
  if (only_dependencies) args <- append(args, "--only-dependencies")
  if (keep_tmp) args <- append(args, "--keep-tmp")

  args <- append(args, package)

  invisible(brew_cmd(cmd = "install", args = args, ...)$status == 0)
}


#' @rdname brew_install
#' @export
#' @examples
#' \dontrun{
#' # Install the Homebrew-compiled version of R
#' brew_install_formula("r")
#' }
brew_install_formula <- function(package, ...) {
  brew_install(package = package, cask = FALSE, ...)
}


#' @rdname brew_install
#' @export
#' @examples
#' \dontrun{
#' brew_install_cask("rstudio")
#' }
brew_install_cask <- function(package, ...) {
  brew_install(package = package, cask = TRUE, ...)
}


#' @rdname brew_install
#' @description `brew_reinstall()` uninstalls and then reinstalls a formula or
#' cask using the same options it was originally installed with, plus any
#' appended options specific to a formula.
#' @param package Name of formula or cask
#' @export
#' @examples
#' \dontrun{
#' brew_reinstall("unixodbc")
#' }
brew_reinstall <- function(package, ...) {
  invisible(brew_cmd(cmd = "reinstall", args = c(package), ...)$status == 0)
}


#' @rdname brew_install
#' @description `brew_uninstall()` uninstalls a formula or cask
#' @export
#' @examples
#' \dontrun{
#' brew_uninstall("unixodbc")
#' }
brew_uninstall <- function(package, ...) {
  invisible(brew_cmd(cmd = "uninstall", args = c(package), ...)$status == 0)
}
