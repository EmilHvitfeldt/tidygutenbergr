#' Alice's Adventures in Wonderland
#'
#' Downlaod and lightly preprocess "Alice's Adventures in Wonderland".
#'
#' @return tibble with 3 columns. "text", "chapter" and "chapter_name".
#' @export
#'
#' @examples
#' \dontrun{
#' alices_adventures()
#' }
alices_adventures <- function() {
  text <- gutenberg_download(11)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:9)) %>%
    mutate(chapter = cumsum(str_detect(text, "^CHAPTER ")))

  text_chapter_names <- text_prepped %>%
    filter(str_detect(text, "^CHAPTER ")) %>%
    mutate(text = str_remove(text, "CHAPTER .*\\. ")) %>%
    rename(chapter_name = text)

  text_prepped %>%
    dplyr::left_join(text_chapter_names, by = "chapter")
}
