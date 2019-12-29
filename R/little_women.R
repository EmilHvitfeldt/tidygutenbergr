#' Little Women
#'
#' Downlaod and lightly preprocess "Little Women".
#'
#' @return tibble with 3 columns. "text", "chapter" and "chapter_name".
#' @export
#'
#' @examples
#' \dontrun{
#' little_women()
#' }
#'
#' @importFrom gutenbergr gutenberg_download
little_women <- function() {
  text <- gutenberg_download(514)

  text_prepped <- text %>%
    dplyr::select(-gutenberg_id) %>%
    dplyr::slice(-(1:69)) %>%
    dplyr::mutate(chapter = cumsum(stringr::str_detect(text, "^CHAPTER ")))

  text_chapter_names <- text_prepped %>%
    dplyr::group_by(chapter) %>%
    dplyr::slice(3) %>%
    dplyr::rename(chapter_name = text)

  text_prepped %>%
    dplyr::left_join(text_chapter_names, by = "chapter")
}

utils::globalVariables(c("gutenberg_id", "chapter", "chapter_name", "book"))
