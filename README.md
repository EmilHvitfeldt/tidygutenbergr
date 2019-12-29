
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tidygutenbergr

<!-- badges: start -->

<!-- badges: end -->

The goal of tidygutenbergr is to provide simple cleaning functions for
popular works collected from gutenberg.org.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("EmilHvitfeldt/tidygutenbergr")
```

## Example

``` r
library(tidygutenbergr)

king_arthur()
#> Determining mirror for Project Gutenberg from http://www.gutenberg.org/robot/harvest
#> Using mirror http://aleph.gutenberg.org
#> # A tibble: 9,194 x 2
#>    text                                                                  chapter
#>    <chr>                                                                   <int>
#>  1 "CHAPTER I"                                                                 1
#>  2 ""                                                                          1
#>  3 "_The Prophecies of Merlin, and the Birth of Arthur_"                       1
#>  4 ""                                                                          1
#>  5 ""                                                                          1
#>  6 "King Vortigern the usurper sat upon his throne in London, when, sud…       1
#>  7 "upon a certain day, ran in a breathless messenger, and cried aloud-…       1
#>  8 ""                                                                          1
#>  9 "\"Arise, Lord King, for the enemy is come; even Ambrosius and Uther…       1
#> 10 "whose throne thou sittest--and full twenty thousand with them--and …       1
#> # … with 9,184 more rows
```

## Code of Conduct

Please note that the ‘tidygutenbergr’ project is released with a
[Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md). By
contributing to this project, you agree to abide by its terms.
