#' The Wonderful Wizard of Oz
#'
#' Downlaod and lightly preprocess "The Wonderful Wizard of Oz".
#'
#' @return tibble with 3 columns. "text", "chapter" and "chapter_name".
#' @export
#'
#' @examples
#' \dontrun{
#' wizard_of_oz()
#' }
wizard_of_oz <- function() {
  text <- gutenberg_download(55)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:76)) %>%
    mutate(chapter = cumsum(str_detect(text, "^ *[0-9]*\\. ")))

  text_chapter_names <- text_prepped %>%
    group_by(chapter) %>%
    slice(1) %>%
    mutate(chapter_name = str_remove(text, "^ *[0-9]*\\. *")) %>%
    select(-text)

  text_prepped %>%
    left_join(text_chapter_names, by = "chapter")
}
