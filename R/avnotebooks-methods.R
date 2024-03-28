#' @name avnotebooks-methods
#'
#' @title All the notebook type methods for AnVIL
#'
#' @description These are the methods to be used by the AnVIL package.
#'
#' @inheritParams avnotebooks-generics
#'
#' @include avnotebooks-generics.R
#'
#' @return Methods for the 'missing' and 'ANY' signatures provide a way to
#'   redirect calls to the appropriate method for the current cloud platform.
#'
#' @examples
#' findMethods("avnotebooks")
#' getMethod("avnotebooks", c(platform = "missing"))
#'
NULL

#' @describeIn avnotebooks-methods List the available notebooks in the current
#'   workspace
#'
#' @exportMethod avnotebooks
setMethod("avnotebooks", c(platform = "missing"),
    function(..., platform) {
        avnotebooks(..., platform = cloud_platform())
    }
)

#' @describeIn avnotebooks-methods List the available notebooks in the current
#'   workspace
#'
#' @exportMethod avnotebooks
setMethod("avnotebooks", c(platform = "ANY"),
    function(..., platform) {
        stop("'avnotebooks()' not implemented for class ", class(platform))
    }
)

#' @describeIn avnotebooks-methods sync the contents of the workspace storage to
#'   the local file system
#'
#' @exportMethod avnotebooks_localize
setMethod("avnotebooks_localize", c(platform = "missing"),
    function(..., platform) {
        avnotebooks_localize(..., platform = cloud_platform())
    }
)

#' @describeIn avnotebooks-methods sync the contents of the workspace storage to
#'   the local file system
#'
#' @exportMethod avnotebooks_localize
setMethod("avnotebooks_localize", c(platform = "ANY"),
    function(..., platform) {
        stop(
            "'avnotebooks_localize()' not implemented for class ",
            class(platform)
        )
    }
)

#' @describeIn avnotebooks-methods sync the contents of the local file system to
#'   the workspace storage
#'
#' @exportMethod avnotebooks_delocalize
setMethod("avnotebooks_delocalize", c(platform = "missing"),
    function(..., platform) {
        avnotebooks_delocalize(..., platform = cloud_platform())
    }
)

#' @describeIn avnotebooks-methods sync the contents of the local file system to
#'   the workspace storage
#'
#' @exportMethod avnotebooks_delocalize
setMethod("avnotebooks_delocalize", c(platform = "ANY"),
    function(..., platform) {
        stop(
            "'avnotebooks_delocalize()' not implemented for class ",
            class(platform)
        )
    }
)
