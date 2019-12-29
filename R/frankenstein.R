#' Frankenstein
#'
#' Downlaod and lightly preprocess "Frankenstein".
#'
#' @return tibble with 2 columns. "text" and "chapter".
#' @export
#'
#' @examples
#' \dontrun{
#' frankenstein()
#' }
frankenstein <- function() {
  text <- gutenberg_download(84)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:12)) %>%
    mutate(chapter = cumsum(str_detect(text, "^Chapter ")))

  text_prepped
}
