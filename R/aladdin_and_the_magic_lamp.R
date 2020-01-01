#' Aladdin and the Magic Lamp
#' Downlaod and lightly preprocess "Aladdin and the Magic Lamp".
#'
#' @return tibble with 1 column. "text".
#' @export
#'
#' @examples
#' \dontrun{
#' aladdin_and_the_magic_lamp()
#' }
aladdin_and_the_magic_lamp <- function() {
  text <- gutenberg_download(57)

  text_prepped <- text %>%
    select(-gutenberg_id)

  text_prepped
}
