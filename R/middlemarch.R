#' Great Expectations
#'
#' Downlaod and lightly preprocess "Great Expectations".
#'
#' @return tibble with 3 columns. "text", "book" and "chapter".
#' @export
#'
#' @examples
#' \dontrun{
#' middlemarch()
#' }
middlemarch <- function() {
  text <- gutenberg_download(145)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:77)) %>%
    mutate(book = cumsum(str_detect(text, "^BOOK [IVX]*\\."))) %>%
    group_by(book) %>%
    mutate(chapter = cumsum(str_detect(text, "^CHAPTER "))) %>%
    ungroup()

  text_prepped
}
