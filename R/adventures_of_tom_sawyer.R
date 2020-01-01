#' The Adventures of Tom Sawyer
#'
#' Downlaod and lightly preprocess "The Adventures of Tom Sawyer".
#'
#' @return tibble with 3 columns. "text", "chapter" and "chapter_name".
#' @export
#'
#' @examples
#' \dontrun{
#' adventures_of_tom_sawyer()
#' }
adventures_of_tom_sawyer <- function() {
  text <- gutenberg_download(74)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:430)) %>%
    mutate(chapter = cumsum(str_detect(text, "^CHAPTER ")))

  text_chapter_names <- text %>%
    slice(11:100) %>%
    filter(str_detect(text, "^CHAPTER")) %>%
    mutate(text = str_remove(text, "^CHAPTER [IVX]*\\. ")) %>%
    mutate(text = str_remove(text, "--.*")) %>%
    mutate(chapter_name = str_remove(text, "-Aunt Polly Decides Upon her Duty")) %>%
    mutate(chapter = row_number()) %>%
    select(-gutenberg_id, -text)

  text_prepped %>%
    left_join(text_chapter_names, by = "chapter")
}
