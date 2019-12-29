#' The Merry Adventures of Robin Hood
#'
#' Downlaod and lightly preprocess "The Merry Adventures of Robin Hood".
#'
#' @return tibble with 3 columns. "text", "chapter" and "chapter_name".
#' @export
#'
#' @examples
#' \dontrun{
#' robin_hood()
#' }
robin_hood <- function() {
  text <- gutenberg_download(964)

  text_chapter_names <- text %>%
    dplyr::slice(59:80) %>%
    select(-gutenberg_id) %>%
    mutate(text = str_remove(text, "^ *[IVXl]* *"),
           text = str_remove(text, " [0-9]*$"),
           text = str_trim(text),
           chapter = row_number()) %>%
    dplyr::rename(chapter_name = text) %>%
    mutate(chapter_name = if_else(
      chapter_name == "THE ADVENTURE WITH MIDGE, THE MILLER'S SON",
      "THE ADVENTURE WITH MIDGE THE MILLER'S SON",
      chapter_name)
    ) %>%
    mutate(chapter_name = if_else(
      chapter_name == "THE ADVENTURE WITH MIDGE, THE MILLER'S SON",
      "THE ADVENTURE WITH MIDGE THE MILLER'S SON",
      chapter_name)
    )

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:85)) %>%
    mutate(upper_text = trimws(toupper(text))) %>%
    left_join(text_chapter_names, by = c("upper_text" = "chapter_name")) %>%
    mutate(chapter = cumsum(!is.na(chapter))) %>%
    select(-upper_text)

  text_prepped %>%
    dplyr::left_join(text_chapter_names, by = "chapter")
}
