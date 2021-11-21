#' Show Homebrew and System Configuration
#'
#' `brew_config()` returns important information about your Homebrew
#' installation and other related system information.
#'
#' @return A string containing the raw text output from `brew config`
#' @export
#'
#' @examples
#' \dontrun{
#' brew_config()
#' }
brew_config <- function() {
  brew_cmd(cmd = "config")$stdout
}
