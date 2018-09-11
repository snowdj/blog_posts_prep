library(tidyverse)
#> ── Attaching packages ─────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 2.2.1.9000     ✔ purrr   0.2.4     
#> ✔ tibble  1.4.2          ✔ dplyr   0.7.4     
#> ✔ tidyr   0.7.2          ✔ stringr 1.2.0     
#> ✔ readr   1.1.1          ✔ forcats 0.2.0
#> ── Conflicts ────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
library(janitor)
read_csv("~/happiness/2017.csv") %>%
  clean_names() %>%
  mutate(
    summed = economy_gdp_per_capita + family + health_life_expectancy + freedom + generosity + trust_government_corruption + dystopia_residual,
    residual = happiness_score - summed
  ) %>%
  select(happiness_score, summed, residual)
#> Parsed with column specification:
#> cols(
#>   Country = col_character(),
#>   Happiness.Rank = col_integer(),
#>   Happiness.Score = col_double(),
#>   Whisker.high = col_double(),
#>   Whisker.low = col_double(),
#>   Economy..GDP.per.Capita. = col_double(),
#>   Family = col_double(),
#>   Health..Life.Expectancy. = col_double(),
#>   Freedom = col_double(),
#>   Generosity = col_double(),
#>   Trust..Government.Corruption. = col_double(),
#>   Dystopia.Residual = col_double()
#> )
#> # A tibble: 155 x 3
#>    happiness_score summed    residual
#>              <dbl>  <dbl>       <dbl>
#>  1            7.54   7.54 -0.0000784 
#>  2            7.52   7.52  0.000165  
#>  3            7.50   7.50  0.000296  
#>  4            7.49   7.49 -0.000366  
#>  5            7.47   7.47 -0.000203  
#>  6            7.38   7.38  0.0000796 
#>  7            7.32   7.32 -0.000388  
#>  8            7.31   7.31 -0.00000104
#>  9            7.28   7.28  0.000315  
#> 10            7.28   7.28 -0.0000449 
#> # ... with 145 more rows