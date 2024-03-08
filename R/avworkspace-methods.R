#' @name avworkspace-methods
#'
#' @title The `avworkspace` methods for 'missing' and 'ANY' signatures
#'
#' @description The `AnVILBase` package defines S4 methods for the AnVIL
#'  package. These methods are defined for the 'missing' and 'ANY' signatures.
#'
NULL

#' @describeIn avworkspace-methods Get the current workspace namespace/name
#' @exportMethod avworkspace
setMethod("avworkspace", c(platform = "missing"), function(..., platform) {
    avworkspace(..., platform = cloud_platform())
})

#' @describeIn avworkspace-methods Get the current workspace namespace/name
#' @exportMethod avworkspace
setMethod("avworkspace", c(platform = "ANY"), function(..., platform) {
    stop("'avworkspace()' not implemented for class ", class(platform))
})

#' @describeIn avworkspace-methods List workspaces
#' @exportMethod avworkspaces
setMethod("avworkspaces", c(platform = "missing"), function(..., platform) {
    avworkspaces(..., platform = cloud_platform())
})

#' @describeIn avworkspace-methods List workspaces
#' @exportMethod avworkspaces
setMethod("avworkspaces", c(platform = "ANY"), function(..., platform) {
    stop("'avworkspaces()' not implemented for class ", class(platform))
})

#' @describeIn avworkspace-methods Get the name of the current workspace
#' @exportMethod avworkspace_name
setMethod("avworkspace_name", c(platform = "missing"),
    function(..., platform) {
        avworkspace_name(..., platform = cloud_platform())
    }
)

#' @describeIn avworkspace-methods Get the name of the current workspace
#' @exportMethod avworkspace_name
setMethod("avworkspace_name", c(platform = "ANY"), function(..., platform) {
    stop("'avworkspace_name()' not implemented for class ", class(platform))
})

#' @describeIn avworkspace-methods Get the namespace of the current workspace
#' @exportMethod avworkspace_namespace
setMethod("avworkspace_namespace", c(platform = "missing"),
    function(..., platform) {
        avworkspace_namespace(..., platform = cloud_platform())
    }
)

#' @describeIn avworkspace-methods Get the namespace of the current workspace
#' @exportMethod avworkspace_namespace
setMethod("avworkspace_namespace", c(platform = "ANY"),
    function(..., platform) {
        stop(
            "'avworkspace_namespace()' not implemented for class ",
            class(platform)
        )
    }
)

#' @describeIn avworkspace-methods Clone the current workspace
#' @exportMethod avworkspace_clone
setMethod("avworkspace_clone", c(platform = "missing"),
    function(..., platform) {
        avworkspace_clone(..., platform = cloud_platform())
    }
)

#' @describeIn avworkspace-methods Clone the current workspace
#' @exportMethod avworkspace_clone
setMethod("avworkspace_clone", c(platform = "ANY"), function(..., platform) {
    stop("'avworkspace_clone()' not implemented for class ", class(platform))
})
