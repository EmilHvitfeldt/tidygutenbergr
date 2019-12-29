#' Peter Pan
#'
#' Downlaod and lightly preprocess "Peter Pan".
#'
#' @return tibble with 3 columns. "text", "chapter" and "chapter_name".
#' @export
#'
#' @examples
#' \dontrun{
#' peter_pan()
#' }
peter_pan <- function() {
  text <- gutenberg_download(16)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:50)) %>%
    mutate(chapter = cumsum(str_detect(text, "^Chapter ")))

  text_chapter_names <- text_prepped %>%
    filter(str_detect(text, "^Chapter ")) %>%
    mutate(text = str_remove(text, "Chapter [0-9]{1,2} ")) %>%
    rename(chapter_name = text)

  text_prepped %>%
    dplyr::left_join(text_chapter_names, by = "chapter")
}
