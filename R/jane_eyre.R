#' Jane Eyre
#'
#' Downlaod and lightly preprocess "Jane Eyre".
#'
#' @return tibble with 3 columns. "text" and "chapter".
#' @export
#'
#' @examples
#' \dontrun{
#' jane_eyre()
#' }
jane_eyre <- function() {
  text <- gutenberg_download(1260)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:144)) %>%
    mutate(chapter = cumsum(str_detect(text, "^CHAPTER ")))

  text_prepped
}
