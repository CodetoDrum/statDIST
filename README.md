
<!-- README.md is generated from README.Rmd. Please edit that file -->

# statDIST

<!-- badges: start -->
<!-- badges: end -->

The goal of statDIST is to make learning fundamental statistics concepts
easier. At the core of this package is the `sample_generator()`
function, which allows one to generate any number of samples containing
any number of measurements up to one less than a hypothetical population
distribution that is user-defined.

The fundamental premise is that **seeing** data as it is transformed is
much better than memorizing formulas.

## Installation

You can install the development version of statDIST from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("CodetoDrum/statDIST")
```

## Example

Everything starts by generating samples to experiment with. The initial
creation of this function was motivated by a desire to generate sampling
distributions to actually *see* the concept in action.

``` r
test_samples <- statDIST::sample_data(
  num_samples = 10,
  sample_size = 25,
  dist_size = 500,
  max_val = 250
)

head(test_samples)
#>          V1        V2        V3        V4         V5        V6          V7
#> 1 143.55841  72.51941 126.98961  36.92456  87.469435 181.72959   0.5877459
#> 2  35.76111  81.42530 133.36528 124.87073 227.190344 162.83462 140.1595119
#> 3 237.09103  84.64977 246.42320 230.94065 105.773396 214.11362 239.9545615
#> 4  98.32326 129.20248  72.91055 102.59955 141.709435 114.98707  33.8921282
#> 5 238.98046  72.45935 152.25161 116.93146  40.474232  53.84555 101.8878694
#> 6 214.11362 109.86007  91.28807 222.65079   7.636704 103.06274 247.7135793
#>          V8         V9       V10
#> 1  34.87961  63.085903  19.63741
#> 2 163.50261  64.218952 109.86007
#> 3  96.41134 212.574885  80.92781
#> 4 187.09121  85.832635  75.36191
#> 5 147.67703   4.527207 148.11875
#> 6 164.52108  51.350754  12.05071
```
