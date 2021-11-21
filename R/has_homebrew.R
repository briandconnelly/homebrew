#' Check whether Homebrew is installed
#'
#' @description `has_homebrew()` checks whether Homebrew is installed on this
#' machine. Although most functions in this package allow the path to Homebrew's
#' `brew` command to be specified, this function only checks whether `brew`
#' exists in the system's path.
#'
#' @seealso <https://brew.sh> for installation instructions
#'
#' @return A logical value indicating whether Homebrew could be found
#' @export
#'
#' @examples
#' has_homebrew()
has_homebrew <- function() {
  unname(fs::file_exists(find_brew_command()))
}
