#' Generate a series of statistics for a supplied series of sample data.
#'
#' @param .data A data frame or data frame housed within a list
#' @param stat The statistic to be run on each element of the data frame. This
#' needs to be a user-defined or package function that runs a statistic. The default
#' is `mean`
#' @param ... Ellipsis intended to pass along additional arguments for the supplied
#' statistic
#'
#' @return A numeric vector
#' @export
#'
#' @examples
#' BLANK

sample_stat <- function(.data, stat = mean, ...) {

        # Ensure the supplied data is a data frame

        if (is.data.frame(.data) == FALSE) {

                stop("Data must be supplied as a data frame. Each column must represent a sample generated using the `sample_data` function.")

        }

        # Ensure the supplied statistic is found in either the base or stats package

        if (!as.character(substitute(stat)) %in% c(ls("package:base"), ls("package:stats"))) {

                warning("The supplied statistic is not found in either the `base` or `stats` package. Make sure to verify the results after running your statistic through this function.")

        }

        if (is.list(stat)) {

                stop("This function is only designed to run a single statistic at a time. For a list of statistical functions, use the `multi_sample_stats` function.")

        }

        # Pivot the input data frame to a long format

        sample_data_long <- reshape(.data,
                                    direction = "long",
                                    varying = list(names(.data)),
                                    v.names = "result_value",
                                    times = c(paste(names(.data), "Sample_Vector", sep = "_")))

        rownames(sample_data_long) <- NULL

        # Store the names of each vector from the data frame

        vector_names <- unique(sample_data_long$time)

        # Factor the vector names

        sample_data_long$time <- factor(sample_data_long$time, levels = vector_names)

        # Split the long data frame based on the vector names

        sample_long_split <- split(sample_data_long, sample_data_long$time)

        # Iterate the supplied statistic over each vector element

        sample_stat <- lapply(sample_long_split, function(x) { stat(x$result_value, ...) })

        # Un-list the vector statistics

        sample_stat_vec <- unlist(sample_stat)

        # Return the resulting vector of statistic values

        sample_stat_vec

}
