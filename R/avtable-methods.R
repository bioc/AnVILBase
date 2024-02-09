#' @name avtable-methods
#'
#' @title The avtable methods for 'missing' and 'ANY' signatures
#'
#' @description The `AnVILBase` package defines S4 methods for the AnVIL
#'  package. These methods are defined for the 'missing' and 'ANY' signatures.
#'
NULL

#' @describeIn avtable-methods Upload a dataset to the DATA tab
#' @exportMethod avtable_import
setMethod("avtable_import", c(platform = "missing"), function(..., platform) {
    avtable_import(..., platform = cloud_platform())
})

#' @describeIn avtable-methods Upload a dataset to the DATA tab
#' @exportMethod avtable_import
setMethod("avtable_import", c(platform = "ANY"), function(..., platform) {
    stop("'avtable_import()' not implemented for class ", class(platform))
})

#' @describeIn avtable-methods Delete a row in a table based on the key
#' @exportMethod avtable_delete_values
setMethod("avtable_delete_values", c(platform = "missing"),
    function(..., platform) {
        avtable_delete_values(..., platform = cloud_platform())
    }
)

#' @describeIn avtable-methods Delete a row in a table based on the key
#' @exportMethod avtable_delete_values
setMethod("avtable_delete_values", c(platform = "ANY"),
    function(..., platform) {
        stop(
            "'avtable_delete_values()' not implemented for class ",
            class(platform)
        )
    }
)
