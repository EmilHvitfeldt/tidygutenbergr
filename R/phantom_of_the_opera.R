#' The Phantom of the Opera
#'
#' Downlaod and lightly preprocess "The Phantom of the Opera".
#'
#' @return tibble with 3 columns. "text", "chapter" and "chapter_name".
#' @export
#'
#' @examples
#' \dontrun{
#' phantom_of_the_opera()
#' }
phantom_of_the_opera <- function() {
  text <- gutenberg_download(175)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:68)) %>%
    mutate(chapter = cumsum(str_detect(text, "^Chapter "))) %>%
    mutate(chapter = chapter + cumsum(str_detect(text, "^Epilogue")))

  text_chapter_names <- text %>%
    dplyr::slice(31:58) %>%
    select(-gutenberg_id) %>%
    mutate(text = str_remove(text, " *[IVX]* *"),
           chapter = row_number() - 1) %>%
    dplyr::rename(chapter_name = text)

  text_prepped %>%
    dplyr::left_join(text_chapter_names, by = "chapter")
}
