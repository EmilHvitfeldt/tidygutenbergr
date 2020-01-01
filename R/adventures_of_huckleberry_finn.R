#' Adventures of Huckleberry Finn
#'
#' Downlaod and lightly preprocess "Adventures of Huckleberry Finn".
#'
#' @return tibble with 2 columns. "text" and "chapter".
#' @export
#'
#' @examples
#' \dontrun{
#' adventures_of_huckleberry_finn()
#' }
adventures_of_huckleberry_finn <- function() {
  text <- gutenberg_download(76)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:542)) %>%
    mutate(chapter = cumsum(str_detect(text, "^CHAPTER ")))

  text_prepped
}
