#' The Strange Case Of Dr. Jekyll And Mr. Hyde
#'
#' Downlaod and lightly preprocess "The Strange Case Of Dr. Jekyll And Mr.
#' Hyde".
#'
#' @return tibble with 3 columns. "text", "chapter" and "chapter_name".
#' @export
#'
#' @examples
#' \dontrun{
#' dr_jekyll_and_mr_hyde()
#' }
dr_jekyll_and_mr_hyde <- function() {
  text <- gutenberg_download(43)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:7))

  text_chapter_names <- tibble::tribble(
    ~chapter, ~chapter_name,
    1, "STORY OF THE DOOR",
    2, "SEARCH FOR MR. HYDE",
    3, "DR. JEKYLL WAS QUITE AT EASE",
    4, "THE CAREW MURDER CASE",
    5, "INCIDENT OF THE LETTER",
    6, "INCIDENT OF DR. LANYON",
    7, "INCIDENT AT THE WINDOW",
    8, "THE LAST NIGHT",
    9, "DR. LANYON'S NARRATIVE",
    10, "HENRY JEKYLL'S FULL STATEMENT OF THE CASE"
  )

  text_prepped %>%
    left_join(text_chapter_names, by = c("text" = "chapter_name")) %>%
    mutate(chapter = cumsum((!is.na(chapter))))
}
