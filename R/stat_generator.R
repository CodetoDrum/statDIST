sample_stats <- function(samp_data, stat = mean) {

        if (is.data.frame(samp_data) == FALSE) {

                stop("Data must be supplied as a data frame. Each column must represent a sample.")

        }

        sample_stat <- numeric()

        for (i in seq_along(samp_data)) {

                ind_stat <- stat(samp_data[, i], na.rm = TRUE)

                sample_stat <- append(sample_stat, ind_stat)

        }

        sample_stat

}
