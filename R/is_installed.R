#' Determine whether a formula or cask is installed
#'
#' @inheritParams brew_install
#' @inheritParams brew_list
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' library(homebrew)
#'
#' is_installed("unixodbc")
#' }
is_installed <- function(x, formulae = TRUE, casks = TRUE) {
  assertthat::assert_that(
    assertthat::is.flag(formulae),
    assertthat::noNA(formulae),
    assertthat::is.flag(casks),
    assertthat::noNA(casks)
  )

  x %in% brew_list(formulae = formulae, casks = casks)$name
}


#' @rdname is_installed
#' @description `is_formula_installed()` TODO
#' @export
is_formula_installed <- function(x) {
  is_installed(x, formulae = TRUE, casks = FALSE)
}


#' @rdname is_installed
#' @description `is_cask_installed()` TODO
#' @export
is_cask_installed <- function(x) {
  is_installed(x, formulae = FALSE, casks = TRUE)
}
