#' Generate a series of equal sized samples from a user-defined distribution
#'
#' @param num_samples The total number of samples to create
#' @param sample_size The total number of measurements in each sample. Must be one less than dist_size.
#' @param dist_size The total number of measurements within a hypothetical population distribution.
#' @param max_val The maximum number a value can assume within the population.
#'
#' @return a data frame
#' @export
#'
#' @examples
#' head(sample_data())

sample_data <- function(num_samples = 25,
                        sample_size = 50,
                        dist_size = 100,
                        max_val = 100) {

        # Exit this function if any of the inputs are anything but a number.

        stopifnot(is.numeric(num_samples), is.numeric(sample_size),
                  is.numeric(dist_size), is.numeric(max_val))

        distribution <- stats::runif(dist_size, min = 0, max = max_val)

        # Ensure sample sizes aren't larger than the distribution size.

        if (sample_size >= length(distribution)) {

                stop("The sample_size value must be less than dist_size.")

        }

        as.data.frame(replicate(
                num_samples,
                sample(distribution, sample_size, replace = F)))

}
