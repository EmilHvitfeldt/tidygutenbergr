#' The Legends Of King Arthur And His Knights
#'
#' Downlaod and lightly preprocess "The Legends Of King Arthur And His Knights".
#'
#' @return tibble with 2 columns. "text" and "chapter".
#' @export
#'
#' @examples
#' \dontrun{
#' king_arthur()
#' }
king_arthur <- function() {
  text <- gutenberg_download(12753)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:331)) %>%
    mutate(chapter = cumsum(str_detect(text, "^CHAPTER "))) %>%
    ungroup()

  text_prepped
}
