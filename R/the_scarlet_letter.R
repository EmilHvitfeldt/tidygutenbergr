#' The Scarlet Letter
#'
#' Downlaod and lightly preprocess "The Scarlet Letter".
#'
#' @return tibble with 3 columns. "text", "chapter" and "chapter_name".
#' @export
#'
#' @examples
#' \dontrun{
#' the_scarlet_letter()
#' }
the_scarlet_letter <- function() {
  text <- gutenberg_download(25344)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:207)) %>%
    slice(-(8482:8508))

  text_chapter_names <- text %>%
    slice(1:24 * 2 + 77) %>%
    mutate(text = str_remove(text, "^[IVX]*\\. *")) %>%
    mutate(chapter_name = str_remove(text, " *[0-9]* *$")) %>%
    mutate(chapter_name = paste0(chapter_name, ".")) %>%
    mutate(chapter = row_number()) %>%
    select(-text, -gutenberg_id)

  text_prepped %>%
    mutate(text = trimws(text)) %>%
    left_join(text_chapter_names, by = c("text" = "chapter_name")) %>%
    mutate(chapter = cumsum((!is.na(chapter))))
}
