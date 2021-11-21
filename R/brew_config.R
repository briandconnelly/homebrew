#' Title
#'
#' @return A string containing the raw text output from `brew config`
#' @export
#'
#' @examples
#' \dontrun{
#' TODO
#' }
brew_config <- function() {
  rlang::warn("This command is not yet supported")

  # TODO: figure this out. The format is all over the place
  retval <- brew_cmd(cmd = "config")$stdout

  retval
}
