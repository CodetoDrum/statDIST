sample_data <- function(num_samples = 25,
                        sample_size = 50,
                        dist_size = 100,
                        max_val = 100) {

        distribution <- runif(dist_size, min = 0, max = max_val)

        if (sample_size >= length(distribution)) {

                stop("The sample_size value must be less than dist_size.")

        }

        as.data.frame(replicate(
                num_samples,
                sample(distribution, sample_size, replace = F)))

}
