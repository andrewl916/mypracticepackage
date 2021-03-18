
# mypracticepackage

<!-- badges: start -->
[![R-CMD-check](https://github.com/andrewl916/mypracticepackage/workflows/R-CMD-check/badge.svg)](https://github.com/andrewl916/mypracticepackage/actions)
[![codecov](https://codecov.io/gh/andrewl916/mypracticepackage/branch/master/graph/badge.svg?token=7E5384U58R)](https://codecov.io/gh/andrewl916/mypracticepackage)
<!-- badges: end -->

The goal of mypracticepackage is to demonstrate multiple functions developed in 
the STAT 302 course at the University of Washington.

This package was developed in collaboration with Lori Wang.

## Installation

You can install mypracticepackage from the following line:

``` r
devtools::install_github("andrewl916/mypracticepackage", build_vignette = TRUE, build_opts = c())
```

## Use

The vignette demonstrates example usage of the main functions. You can see the 
vignette by using the following code:

``` r
devtools::install_github("andrewl916/mypracticepackage", build_vignette = TRUE, build_opts = c())
library(mypracticepackage)
# Use this to view the vignette in the Demo HTML help
help(package = "mypracticepackage", help_type = "html")
# Use this to view the vignette as an isolated HTML file
utils::browseVignettes(package = "mypracticepackage")
```


