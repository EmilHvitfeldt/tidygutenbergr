#' Beauty and the Beast
#'
#' Downlaod and lightly preprocess "Beauty and the Beast".
#'
#' @return tibble with 1 column. "text".
#' @export
#'
#' @examples
#' \dontrun{
#' beauty_and_the_beast()
#' }
beauty_and_the_beast <- function() {
  text <- gutenberg_download(7074)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:27))

  text_prepped
}
