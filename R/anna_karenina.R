#' Anna Karenina
#'
#' Downlaod and lightly preprocess "Anna Karenina".
#'
#' @return tibble with 2 columns. "text", "part" and "chapter".
#' @export
#'
#' @examples
#' \dontrun{
#' anna_karenina()
#' }
anna_karenina <- function() {
  text <- gutenberg_download(1399)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:12)) %>%
    mutate(part = cumsum(str_detect(text, "^PART "))) %>%
    group_by(part) %>%
    mutate(chapter = cumsum(str_detect(text, "^Chapter "))) %>%
    ungroup()

  text_prepped
}
