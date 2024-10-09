#' @name has_avworkspace-methods
#'
#' @title The `has_avworkspace` methods for `missing` and `ANY` signatures.
#'
#' @description The `AnVILBase` package defines S4 methods for the AnVIL
#'  package. These methods are defined for the 'missing' and 'ANY' signatures.
#'
#' @return Methods for the 'missing' and 'ANY' signatures provide a way to
#'   redirect calls to the appropriate method for the current cloud platform.
#'
#' @inheritParams AnVILBase-generics
#'
#' @examples
#' findMethods("has_avworkspace")
#' getMethod("has_avworkspace", c(platform = "missing"))
#'
NULL

#' @describeIn has_avworkspace-methods Check whether the current
#'   workspace is using either Azure or Google infrastructure.
#'
#' @exportMethod has_avworkspace
setMethod("has_avworkspace", c(platform = "missing"),
    function(strict, ..., platform) {
        has_avworkspace(strict, ..., platform = cloud_platform())
    }
)

#' @describeIn has_avworkspace-methods Check whether the current
#'   workspace is using either Azure or Google infrastructure.
#'
#' @exportMethod has_avworkspace
setMethod("has_avworkspace", c(platform = "ANY"),
    function(strict, ..., platform) {
        stop("'has_avworkspace()' not implemented for class ", class(platform))
    }
)

