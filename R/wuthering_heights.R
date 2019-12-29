#' Wuthering Heights
#'
#' Downlaod and lightly preprocess "Wuthering Heights".
#'
#' @return tibble with 2 columns. "text" and "chapter".
#' @export
#'
#' @examples
#' \dontrun{
#' wuthering_heights()
#' }
wuthering_heights <- function() {
  text <- gutenberg_download(768)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:3)) %>%
    mutate(chapter = cumsum(str_detect(text, "^CHAPTER "))) %>%
    ungroup()

  text_prepped
}
