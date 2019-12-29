#' Frankenstein
#'
#' Downlaod and lightly preprocess "Frankenstein".
#'
#' @return tibble with 3 columns. "text" and "chapter".
#' @export
#'
#' @examples
#' \dontrun{
#' frankenstein()
#' }
#'
#' @importFrom gutenbergr gutenberg_download
#' @importFrom dplyr slice select mutate
#' @importFrom stringr str_detect
frankenstein <- function() {
  text <- gutenberg_download(84)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:12)) %>%
    mutate(chapter = cumsum(str_detect(text, "^Chapter ")))

  text_prepped
}
