#' Twenty Thousand Leagues under the Sea
#'
#' Downlaod and lightly preprocess "Twenty Thousand Leagues under the Sea".
#'
#' @return tibble with 3 columns. "text", "chapter" and "chapter_name".
#' @export
#'
#' @examples
#' \dontrun{
#' leagues_under_the_sea()
#' }
leagues_under_the_sea <- function() {
  text <- gutenberg_download(164)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:24)) %>%
    mutate(chapter = cumsum(str_detect(text, "^CHAPTER ")))

  text_chapter_names <- text_prepped %>%
    dplyr::group_by(chapter) %>%
    dplyr::slice(3) %>%
    dplyr::rename(chapter_name = text)

  text_prepped %>%
    dplyr::left_join(text_chapter_names, by = "chapter")
}
