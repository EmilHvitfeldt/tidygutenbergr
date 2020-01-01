#' Dracula
#'
#' Downlaod and lightly preprocess "Dracula".
#'
#' @return tibble with 2 columns. "text" and "chapter".
#' @export
#'
#' @examples
#' \dontrun{
#' dracula()
#' }
dracula <- function() {
  text <- gutenberg_download(345)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:161)) %>%
    mutate(chapter = cumsum(str_detect(text, "^CHAPTER "))) %>%
    slice(1:15321)

  text_prepped
}
