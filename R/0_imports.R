#' @importFrom gutenbergr gutenberg_download
#' @importFrom dplyr slice select mutate filter row_number rename ungroup
#' @importFrom dplyr group_by if_else left_join
#' @importFrom stringr str_detect str_remove str_trim

utils::globalVariables(c("gutenberg_id", "chapter", "chapter_name", "book",
                         "part", "upper_text"))
