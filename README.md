
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

head(test_samples)
#>           V1         V2        V3        V4         V5         V6        V7
#> 1 220.037531 199.627761  82.24498  20.33222 105.036637   5.129173 145.49630
#> 2 103.351283   4.114628 140.96307  96.10850  89.978830 173.697645  74.12033
#> 3   8.670273 185.122546 216.19767 210.11382  93.874113 175.320355 196.77278
#> 4 223.799237 210.113816  24.32749 163.80686 238.061381   6.921670 113.47048
#> 5  31.068881 216.432231 127.95142 203.46545   9.929301  85.736144 128.28356
#> 6  49.260996 163.623187  95.84529 158.01924 221.302477  39.314231 139.53907
#>          V8         V9        V10
#> 1 198.65151  64.229465  27.874453
#> 2 169.00509  70.658327   2.855304
#> 3 242.13269  21.178258 127.305406
#> 4  26.55791  23.427939 145.496303
#> 5  27.07758   8.670273 201.567899
#> 6 147.41986 199.621270 226.315577
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
