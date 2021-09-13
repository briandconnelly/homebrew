#' Retrieve analytics data for a formula or cask
#'
#' @inheritParams brew_info
#' @param days Number of days' worth of analytics data to retrieve. One of 30
#' (default), 90, or 365.
#' @param category Type of analytics data to retrieve. One of `"install"`
#' (default), `"install-on-request"`, or `"build-error"`.
#' @inheritDotParams brew_cmd
#'
#' @export
#'
#' @examples
#' # Retrieve 90-day install data for unixodbc
#' brew_analytics("unixodbc", days = 90)
brew_analytics <- function(package,
                           days = 30,
                           category = c(
                             "install",
                             "install-on-request",
                             "build-error"
                           ),
                           ...) {
  category <- rlang::arg_match(category)
  assertthat::assert_that(
    is.character(package),
    all(nchar(package) > 0),
    length(package) > 0,
    assertthat::is.number(days),
    days %in% c(30, 90, 365),
    assertthat::is.string(category),
    category %in% c("install", "install-on-request", "build-error")
  )

  result <- brew_cmd(
    cmd = "info",
    args = c("--analytics", "--days", days, "--category", category, package),
    echo = TRUE,
    ...
  )

  # TODO parse `result`.
  # until then, return invisible logical value indicating success/failure
  invisible(result$status == 0)
}
