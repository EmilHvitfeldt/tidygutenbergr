#' Treasure Island
#'
#' Downlaod and lightly preprocess "Treasure Island".
#'
#' @return tibble with 4 columns. "text", "chapter", "part" and "chapter_name".
#' @export
#'
#' @examples
#' \dontrun{
#' treasure_island()
#' }
treasure_island <- function() {
  text <- gutenberg_download(120)

  text_prepped <- text %>%
    select(-gutenberg_id) %>%
    slice(-(1:115)) %>%
    mutate(chapter = cumsum(str_detect(text, "^[0-9]{1,2}$")))

  text_chapter_names <- tibble::tribble(
    ~part, ~chapter, ~chapter_name,
    1, 1, "THE OLD SEA-DOG AT THE ADMIRAL BENBOW",
    1, 2, "BLACK DOG APPEARS AND DISAPPEARS",
    1, 3, "THE BLACK SPOT",
    1, 4, "THE SEA-CHEST",
    1, 5, "THE LAST OF THE BLIND MAN",
    1, 6, "THE CAPTAIN'S PAPERS",
    2, 7, "I GO TO BRISTOL",
    2, 8, "AT THE SIGN OF THE SPY-GLASS",
    2, 9, "POWDER AND ARMS",
    2, 10, "THE VOYAGE",
    2, 11, "WHAT I HEARD IN THE APPLE BARREL",
    2, 12, "COUNCIL OF WAR",
    3, 13, "HOW MY SHORE ADVENTURE BEGAN",
    3, 14, "THE FIRST BLOW",
    3, 15, "THE MAN OF THE ISLAND",
    4, 16, "NARRATIVE CONTINUED BY THE DOCTOR: HOW THE SHIP WAS ABANDONED",
    4, 17, "NARRATIVE CONTINUED BY THE DOCTOR: THE JOLLY-BOAT'S LAST TRIP",
    4, 18, "NARRATIVE CONTINUED BY THE DOCTOR: END OF THE FIRST DAY'S FIGHTING",
    4, 19, "NARRATIVE RESUMED BY JIM HAWKINS: THE GARRISON IN THE STOCKADE",
    4, 20, "SILVER'S EMBASSY",
    4, 21, "THE ATTACK",
    5, 22, "HOW MY SEA ADVENTURE BEGAN",
    5, 23, "THE EBB-TIDE RUNS",
    5, 24, "THE CRUISE OF THE CORACLE",
    5, 25, "I STRIKE THE JOLLY ROGER",
    5, 26, "ISRAEL HANDS",
    5, 27, '"PIECES OF EIGHT"',
    6, 28, "IN THE ENEMY'S CAMP",
    6, 29, "THE BLACK SPOT AGAIN",
    6, 30, "ON PAROLE",
    6, 31, "THE TREASURE-HUNT--FLINT'S POINTER",
    6, 32, "THE TREASURE-HUNT--THE VOICE AMONG THE TREES",
    6, 33, "THE FALL OF A CHIEFTAIN",
    6, 34, "AND LAST"
  )

  text_prepped %>%
    dplyr::left_join(text_chapter_names, by = "chapter")
}
