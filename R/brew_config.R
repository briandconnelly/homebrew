#' Title
#'
#' @return
#' @export
#'
#' @examples
brew_config <- function() {
  rlang::warn("This command is not yet supported")

  # TODO: figure this out. The format is all over the place
  retval <- brew_cmd_raw(cmd = "config")$stdout

  retval
}
