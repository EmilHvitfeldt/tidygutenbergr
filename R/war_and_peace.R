#' War and Peace
#'
#' Downlaod and lightly preprocess "War and Peace".
#'
#' @return tibble with 3 columns. "text", "book" and "chapter".
#' @export
#'
#' @examples
#' \dontrun{
#' war_and_peace()
#' }
#' @importFrom dplyr ungroup group_by
war_and_peace <- function() {
  text <- gutenberg_download(2600)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:808)) %>%
    mutate(book = cumsum(str_detect(text, "^BOOK ")),
           book = book + cumsum(str_detect(text, "^FIRST EPILOGUE")),
           book = book + cumsum(str_detect(text, "^SECOND EPILOGUE"))) %>%
    group_by(book) %>%
    mutate(chapter = cumsum(str_detect(text, "^CHAPTER "))) %>%
    ungroup()

  text_prepped
}
