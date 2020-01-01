#' The Prophet
#'
#' Downlaod and lightly preprocess "The Prophet".
#'
#' @return tibble with 1 column. "text".
#' @export
#'
#' @examples
#' \dontrun{
#' the_prophet()
#' }
the_prophet <- function() {
  text <- gutenberg_download(58585)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:79))

  text_prepped
}
