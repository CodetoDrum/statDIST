
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

The function is set so that any given sample within the resulting data
frame contains unique samples from the hypothetical population
distribution. A big reason for this is to simulate the realities of
sampling in the *real world*. When research is done, one is generally
taking a single data set worth of measurements to then utilize for
inference and prediction. And this leads into the understanding that the
combination formula provides.

$nCk$

When we sample a population, the resulting data set represents one of
some total number of possible sets we *could* have collected for the
given number of measurements we actually took. We have `n` total
measurements available to take, but we only *choose* `k` of those
measurements.

So, `sample_data()` effectively generates as many *parallel* sample sets
for the same sample sizes from the same population. In the chunk below,
we are basically saying create 10 parallel instances of the same means
of sampling, collect 25 measurements in each of those instances from
some hypothetical population with 500 possible measurements that can
range from 0-250.

``` r
test_samples <- statDIST::sample_data(
  num_samples = 10,
  sample_size = 25,
  dist_size = 500,
  max_val = 250
)

head(test_samples$example_samples)
#>           V1       V2       V3          V4          V5        V6        V7
#> 1  92.086033 223.8434 164.4644 238.1381530 169.4489792 179.83298 167.00162
#> 2 192.180885 155.0948 240.6190  99.1509288 147.3917305  24.75027 113.98296
#> 3  74.555278 134.2413  41.4872 124.8308506   0.8874497  39.99445 104.02219
#> 4  90.113901 240.9650 249.3122 243.4629253 101.2703619 170.69763 128.43728
#> 5 149.085691 222.8487 223.3556   0.8874497 175.0157978  55.42809  70.11124
#> 6   5.278202 202.0703 176.2667 197.2487703 234.0841477 163.24607 178.53734
#>          V8        V9       V10
#> 1  98.43101  35.72676  67.54563
#> 2 200.41341 116.77145  37.91362
#> 3 172.17115  12.00192 142.55826
#> 4  24.39868 191.15153 192.18088
#> 5 116.38648 237.16065  33.98742
#> 6 186.76996 243.46293  22.23917
```

In this case, relative to our combinations intuition, we have `n = 500`
measurements, *choosing* `k = 25` of them in 10 total instances. For
this setup, you can view the total number of **UNIQUE** combinations of
25 measurements from a population of 500 *units* using a [combination
calculator](https://www.calculatorsoup.com/calculators/discretemathematics/combinations.php).
From there, you know we have 10 *parallel* instances of this total set,
which if run shows that we still have a very small subset of the total
possible instances we *could* have sampled.

However, we can use our generator function with other package functions
to demonstrate what happens to distributions of statistics to any
situation we wish to simulate relative to how those statistics
approximate the true underlying population parameters.

Because the information from the hypothetical population is core to
understanding other package outputs, those data are also housed in the
output of `sample_data()`. It is important to not the output of this
function comes as a list when using other package functions (which will
very likely require data frames or vectors to work).

``` r
head(test_samples[[c("population_dist")]], n = 25)
#>  [1]  11.070913  78.751484 233.128789 229.008823  58.187088   5.278202
#>  [7]  39.994450  19.998839 104.864515 179.832978  58.891338 147.275206
#> [13] 235.539738 167.001618   2.738908 222.848717 102.426545  78.883112
#> [19]  23.356882 211.203585 121.699438  38.230661 226.556425 136.466689
#> [25]  87.295502
```
