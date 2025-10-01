#' Generate multiple series of statistics for a supplied series of sample data.
#'
#' @param .data A data frame or data frame housed within a list
#' @param stat_list The statistics to be run on each element of the data frame. This
#' needs to be a user-defined or package function that runs a statistic. This
#' function is intended to take in a list of functions, so the target parameter
#' is intended to be a list object. The default is a single element list with
#' `mean` as the function
#' @param ... Ellipsis intended to pass along additional arguments for the supplied
#' statistic
#'
#' @return A list of equal length vectors
#' @export
#'
#' @examples
#' BLANK

multi_sample_stats <- function(.data, stat_list = list(mean), ...) {

        # Ensure the supplied data is a data frame

        if (is.data.frame(.data) == FALSE) {

                stop("Data must be supplied as a data frame. Each column must represent a sample generated using the `sample_data` function.")

        }

        # Warn the user if their supplied statistics are not in the form of a list.

        if (!is.list(stat_list)) {

                warning("This function is designed to run multiple statistics at a time. If you only intend to use one statistic, use the `sample_stat` function.")

        }

        # Generate copies of the supplied data set equal to the number of stats intending to be ran

        data_copies <- replicate(length(stat_list), .data, simplify = FALSE)

        # Iterate the list of statistics over the data copies

        ran_stats <- Map(function(data, stats) {

                sample_stat(data, stat = stats)

                }, data_copies, stat_list)

        # Return the list of statistics

        ran_stats

}
