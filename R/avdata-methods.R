#' @name avdata-methods
#'
#' @title The avdata methods for 'missing' and 'ANY' signatures
#'
#' @description The `AnVILBase` package defines S4 methods for the AnVIL
#'  package. These methods are defined for the 'missing' and 'ANY' signatures.
#'
#' @inheritParams avdata-generics
#'
#' @include avdata-generics.R
#'
#' @return Methods for the 'missing' and 'ANY' signatures provide a way to
#'   redirect calls to the appropriate method for the current cloud platform.
#'
#' @examples
#' findMethods("avdata")
#' getMethod("avdata", c(platform = "missing"))
#'
NULL

#' @describeIn avdata-methods Get reference data from workspace attributes
#' @exportMethod avdata
setMethod("avdata", c(platform = "missing"),
    function(..., platform) {
        avdata(..., platform = cloud_platform())
    }
)

#' @describeIn avdata-methods Get reference data from workspace attributes
#' @exportMethod avdata
setMethod("avdata", c(platform = "ANY"),
    function(..., platform) {
        stop("'avdata()' not implemented for class ", class(platform))
    }
)

#' @describeIn avdata-methods Upload data to the workspace attributes
#' @exportMethod avdata_import
setMethod("avdata_import", c(platform = "missing"),
    function(..., platform) {
        avdata_import(..., platform = cloud_platform())
    }
)

#' @describeIn avdata-methods Upload data to the workspace attributes
#' @exportMethod avdata_import
setMethod("avdata_import", c(platform = "ANY"),
    function(..., platform) {
        stop("'avdata_import()' not implemented for class ", class(platform))
    }
)
