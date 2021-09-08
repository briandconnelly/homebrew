#' Determine whether a package is installed
#'
#' @description `is_installed()` checks if a given package is installed either
#' via formula or cask
#' @inheritParams brew_install
#' @inheritParams brew_list
#'
#' @return A logical value indicating whether or not the package is installed
#' @export
#'
#' @examples
#' # Check whether or not unixodbc is installed
#' is_installed("unixodbc")
is_installed <- function(package, formulae = TRUE, casks = TRUE) {
  assertthat::assert_that(
    assertthat::is.flag(formulae),
    assertthat::noNA(formulae),
    assertthat::is.flag(casks),
    assertthat::noNA(casks)
  )

  package %in% brew_list(formulae = formulae, casks = casks)$name
}
