#' Great Expectations
#'
#' Downlaod and lightly preprocess "Great Expectations".
#'
#' @return tibble with 2 columns. "text" and "chapter".
#' @export
#'
#' @examples
#' \dontrun{
#' great_expectations()
#' }
great_expectations <- function() {
  text <- gutenberg_download(1400)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:13)) %>%
    mutate(chapter = cumsum(str_detect(text, "^Chapter ")))

  text_prepped
}
