#' @title Display information about a formula or cask
#' @description `brew_info()` displays detailed information about a formula or
#' cask.
#' @param package Name of one or more formulae or casks
#' @inheritDotParams brew_cmd
#' @return A list of lists. Each sub-list contains information about a package
#' or cask specified by the `package` argument.
#' @note System and package analytics can be retrieved with [`brew_analytics`]
#' @export
#' @examples
#' # Get info about unixodbc package
#' brew_info("unixodbc")
brew_info <- function(package, ...) {
  assertthat::assert_that(
    is.vector(package),
    is.character(package),
    all(nchar(package) > 0)
  )

  jsonlite::parse_json(
    brew_cmd("info", args = c("--json", package), ...)$stdout
  )
}
