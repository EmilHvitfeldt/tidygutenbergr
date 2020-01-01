#' Great Expectations
#'
#' Downlaod and lightly preprocess "Great Expectations".
#'
#' @return tibble with 4 columns. "text", "book", "chapter" and "chapter_name".
#' @export
#'
#' @examples
#' \dontrun{
#' a_tale_of_two_cities()
#' }
a_tale_of_two_cities <- function() {
  text <- gutenberg_download(98)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:70)) %>%
    mutate(book = cumsum(str_detect(text, "^Book the "))) %>%
    group_by(book) %>%
    mutate(chapter = cumsum(str_detect(text, "^[IVX]*\\. "))) %>%
    ungroup()

  text_chapter_names <- text %>%
    slice(11:64)  %>%
    filter(nchar(trimws(text)) > 0) %>%
    mutate(book = cumsum(str_detect(text, "Book the "))) %>%
    group_by(book) %>%
    mutate(chapter = cumsum(str_detect(text, "Chapter "))) %>%
    ungroup() %>%
    filter(chapter != 0) %>%
    mutate(chapter_name = str_remove(text, " *Chapter [IVX]* *")) %>%
    select(-gutenberg_id, -text)

  text_prepped %>%
    left_join(text_chapter_names, by = c("book", "chapter"))
}
