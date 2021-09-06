#' Get Homebrew version information
#'
#' `brew_version()` returns the version numbers of Homebrew,
#' Homebrew/homebrew-core and Homebrew/homebrew-cask (if tapped)
#'
#' @return A named list with items `homebrew`, `core`, and `cask`
#' @export
#'
#' @examples
#' brew_version()
brew_version <- function() {
  output <- brew_cmd_raw(cmd = "--version", echo = FALSE)$stdout
  versions <- strsplit(output, "\n")[[1]]

  rlang::warn("This function is not fully implemented")

  structure(
    list(
      homebrew = package_version(strsplit(versions[[1]], " ")[[1]][[2]]),
      core = paste0(tail(strsplit(versions[[2]], " ")[[1]], -1), collapse = " "),
      cask = paste0(tail(strsplit(versions[[3]], " ")[[1]], -1), collapse = " ")
    )
  )
}
