#' Get Homebrew version information
#'
#' `brew_version()` returns version info about Homebrew, core formulae, and
#' casks.
#'
#' @note Version information for installed packages can be retrieved with
#' [brew_list()]
#' @return A named list containing the following items:
#'
#' \describe{
#'   \item{`homebrew`}{String describing the version of Homebrew}
#'     \item{`core`}{String describing git commit info for
#'     [core formulae](https://github.com/Homebrew/homebrew-core)}
#'   \item{`cask`}{String describing git commit info for
#'     [casks](https://github.com/Homebrew/homebrew-cask), if tapped}
#' }
#'
#' @export
#'
#' @examples
#' brew_version()
brew_version <- function(...) {
  output <- brew_cmd(cmd = "--version", echo = FALSE, ...)$stdout
  versions <- strsplit(output, "\n")[[1]]

  structure(
    list(
      homebrew = strsplit(versions[[1]], " ")[[1]][[2]],
      core = versions[[2]],
      cask = versions[[3]]
    )
  )
}
