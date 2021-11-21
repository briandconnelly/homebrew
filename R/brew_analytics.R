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
#' \dontrun{
#' # Retrieve 90-day install data for unixodbc
#' brew_analytics("unixodbc", days = 90)
#' }
brew_analytics <- function(package,
                           days = 30,
                           category = c(
                             "install",
                             "install-on-request",
                             "build-error"
                           ),
                           ...) {
  category <- arg_match(category)

  checkmate::assert_character(
    package,
    min.chars = 1, min.len = 1, any.missing = FALSE
  )
  checkmate::assert_integerish(days)
  checkmate::assert_choice(days, choices = c(30, 90, 365))
  checkmate::assert_choice(
    category,
    choices = c("install", "install-on-request", "build-error")
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
