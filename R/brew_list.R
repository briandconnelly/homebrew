#' List all installed formulae and casks
#'
#' `brew_list()` returns a data frame containing the names and versions of all
#' installed formulae and casks.
#'
#' @param formulae Whether to search installed formulae (default: `TRUE`)
#' @param casks Whether to search installed casks (default: `TRUE`)
#' @return
#' @export
#'
#' @examples
brew_list <- function(formulae = TRUE, casks = TRUE) {
  assertthat::assert_that(
    assertthat::is.flag(formulae),
    assertthat::is.flag(casks)
  )

  if (formulae) {
    formulae <- homebrew:::brew_cmd_raw("list", args = c("--formulae", "--versions"), echo = FALSE)
    formulae_df <- as.data.frame(do.call(rbind, strsplit(strsplit(formulae$stdout, "\n")[[1]], " ")))
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
    casks <- homebrew:::brew_cmd_raw("list", args = c("--casks", "--versions"), echo = FALSE)
    casks_df <- as.data.frame(do.call(rbind, strsplit(strsplit(casks$stdout, "\n")[[1]], " ")))
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

  if (rlang::is_installed("tibble")) {
    tibble::as_tibble(everything)
  } else {
    everything
  }
}
