
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
distributions to actually *see* the data sets used when putting the
concept in action.

The function is set so that any given sample within the resulting data
frame contains unique samples from the hypothetical population
distribution. A big reason for this is to simulate the realities of
sampling in the *real world*. When research is done, one is generally
taking a single data set worth of measurements to then utilize for
inference and prediction. And this leads into the understanding that the
combination formula provides.

$`nCk`$

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
#>          V1       V2       V3        V4       V5        V6       V7        V8
#> 1  97.85125 218.0109 154.1003  33.91518 146.4028  51.59622 117.8865 194.58716
#> 2 116.88588 154.8180 112.7855 126.23427 230.8683  87.19535 176.4280 194.16100
#> 3  76.75105 112.9590 230.8683 239.47095 160.3899  48.35397 198.0298 109.92046
#> 4 188.14839 245.5937 127.0606 227.34517 152.7597  89.89179 226.9816  62.89789
#> 5 143.21573 195.9057 246.5901 209.00091 233.8444 245.97780 219.9521  46.17775
#> 6 104.32526 208.2926 198.0298 198.02977 246.1113 175.25872 122.0597 117.61193
#>          V9        V10
#> 1 140.94909 227.471667
#> 2 188.12524 115.566455
#> 3  21.91268 108.296901
#> 4  96.38525   9.409914
#> 5 112.96374 187.119453
#> 6 247.13689 191.780908
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
to demonstrate what happens to distributions of statistics relative to
how those statistics approximate the true underlying population
parameters.

Because the information from the hypothetical population is core to
understanding other package outputs, those data are also housed in the
output of `sample_data()`. It is important to note the output of this
function comes as a list when using other package functions (which will
very likely require data frames or vectors to work).

``` r
head(test_samples$population_dist, n = 25)
#>  [1] 159.666515 245.977797  33.295500  98.032971 225.165469  87.456204
#>  [7] 119.697360 225.169128 168.125619 236.532331  34.863380 134.973881
#> [13]   1.962092  72.696052 174.649086 140.051793 201.933003 143.511271
#> [19] 214.382051  90.501719  95.415468 191.780908 194.276033  97.293035
#> [25] 115.606920
```
