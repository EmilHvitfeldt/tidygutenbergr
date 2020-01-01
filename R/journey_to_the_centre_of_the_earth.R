#' A Journey to the Centre of the Earth
#'
#' Downlaod and lightly preprocess "A Journey to the Centre of the Earth".
#'
#' @return tibble with 3 columns. "text", "chapter" and "chapter_name".
#' @export
#'
#' @examples
#' \dontrun{
#' journey_to_the_centre_of_the_earth()
#' }
journey_to_the_centre_of_the_earth <- function() {
  text <- gutenberg_download(18857)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:113)) %>%
    mutate(chapter = cumsum(str_detect(text, "^CHAPTER ")))

  text_chapter_names <- text %>%
    slice((1:44) * 2 + 21) %>%
    mutate(chapter = row_number()) %>%
    mutate(chapter_name = str_remove(text, "^CHAPTER [0-9]* *")) %>%
    select(-gutenberg_id, -text)

  text_prepped %>%
    left_join(text_chapter_names, by = "chapter")
}
