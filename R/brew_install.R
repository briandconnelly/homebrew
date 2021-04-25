#' Install a formula or cask
#'
#' @param x Name(s) of formula or cask
#' @param cask If `TRUE`, `x` refers to a cask. If `FALSE` (default), `x` refers to a formula.
#' @param force Install without checking for previous installations (default: `FALSE`)
#' @param only_dependencies Install only dependencies and not the formula itself (default: `FALSE`)
#' @param keep_tmp Do not delete temporary files created during installation (default: `FALSE`)
#' @param ... Optional arguments for [`brew_cmd()`]
#'
#' @return A logical value indicating whether or not the installation was a success
#'
#' @export
#'
#' @examples
#' library(homebrew)
#'
#' \dontrun{
#' brew_install("unixodbc")}
brew_install <- function(x,
                         cask = FALSE,
                         force = FALSE,
                         only_dependencies = FALSE,
                         keep_tmp = FALSE,
                         ...) {
  args <- c()

  if (cask) args <- append(args, "--cask")
  if (force) args <- append(args, "--force")
  if (only_dependencies) args <- append(args, "--only-dependencies")
  if (keep_tmp) args <- append(args, "--keep-tmp")

  args <- append(args, x)

  brew_cmd(
    cmd = "install",
    args = args,
    ...
  )
}

#' @rdname brew_install
#' @export
brew_install_formula <- function(x, ...) {
  brew_install(x, cask = FALSE, ...)
}

#' @rdname brew_install
#' @export
brew_install_cask <- function(x, ...) {
  brew_install(x, cask = TRUE, ...)
}
