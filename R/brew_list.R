#' Check installed formulae and casks
#'
#' @description `brew_list()` lists all installed packages
#'
#' @param formulae Include installed formulae (default: `TRUE`)
#' @param casks Include installed casks (default: `TRUE`)
#' @inheritDotParams brew_cmd
#' @return A data frame (or tibble, if installed) containing the `name` and
#' `version` of each installed package and how it was installed (i.e., via
#' formula or cask).
#' @export
#'
#' @examples
#' \dontrun{
#' brew_list()
#' }
brew_list <- function(formulae = TRUE, casks = TRUE, ...) {
  checkmate::assert_flag(formulae)
  checkmate::assert_flag(casks)

  if (formulae) {
    formulae <- brew_cmd(
      cmd = "list",
      args = c("--formulae", "--versions"),
      echo = FALSE,
      ...
    )
    formulae_df <- as.data.frame(
      do.call(rbind, strsplit(strsplit(formulae$stdout, "\n")[[1]], " "))
    )
    names(formulae_df) <- c("name", "version")
    formulae_df$type <- "formula"
  } else {
    formulae_df <- data.frame(
      name = character(),
      version = character(),
      type = character()
    )
  }

  if (casks) {
    casks <- brew_cmd(
      cmd = "list",
      args = c("--casks", "--versions"),
      echo = FALSE,
      ...
    )
    casks_df <- as.data.frame(
      do.call(rbind, strsplit(strsplit(casks$stdout, "\n")[[1]], " "))
    )
    names(casks_df) <- c("name", "version")
    casks_df$type <- "cask"
  } else {
    casks_df <- data.frame(
      name = character(),
      version = character(),
      type = character()
    )
  }

  everything <- rbind(formulae_df, casks_df)
  everything$type <- factor(everything$type, levels = c("formula", "cask"))

  ifelse(is_installed("tibble"), tibble::as_tibble(everything), everything)
}


#' @rdname brew_list
#'
#' @description `is_installed()` checks if a given package is installed
#' @inheritParams brew_install
#' @inheritParams brew_list
#'
#' @return A logical value indicating whether or not the package is installed
#' @export
#'
#' @examples
#' \dontrun{
#' # Check whether or not unixodbc is installed
#' is_installed("unixodbc")
#' }
is_installed <- function(package, formulae = TRUE, casks = TRUE) {
  checkmate::assert_character(
    package,
    min.chars = 1, min.len = 1, any.missing = FALSE
  )
  checkmate::assert_flag(formulae)
  checkmate::assert_flag(casks)

  package %in% brew_list(formulae = formulae, casks = casks)$name
}
