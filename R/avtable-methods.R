#' @name avtable-methods
#'
#' @title The avtable methods for 'missing' and 'ANY' signatures
#'
#' @description The `AnVILBase` package defines S4 methods for the AnVIL
#'  package. These methods are defined for the 'missing' and 'ANY' signatures.
#'
#' @inheritParams avtable-generics
#'
#' @include avtable-generics.R
#'
#' @return Methods for the 'missing' and 'ANY' signatures provide a way to
#'   redirect calls to the appropriate method for the current cloud platform.
#'
#' @examples
#' findMethods("avtable")
#' getMethod("avtable", c(platform = "missing"))
#'
NULL

#' @describeIn avtable-methods Show the contents of a particular table (entity
#'   / type) within a workspace.
#' @exportMethod avtable
setMethod("avtable", c(platform = "missing"),
    function(..., platform) {
        avtable(..., platform = cloud_platform())
    }
)

#' @describeIn avtable-methods Show the contents of a particular table (entity
#'   / type) within a workspace.
#' @exportMethod avtable
setMethod("avtable", c(platform = "ANY"),
    function(..., platform) {
        stop("'avtable()' not implemented for class ", class(platform))
    }
)

#' @describeIn avtable-methods List entities / types accross or within
#'   the current workspace respectively.
#' @exportMethod avtables
setMethod("avtables", c(platform = "missing"),
    function(..., platform) {
        avtables(..., platform = cloud_platform())
    }
)

#' @describeIn avtable-methods List entities / types accross or within
#'   the current workspace respectively.
#' @exportMethod avtables
setMethod("avtables", c(platform = "ANY"),
    function(..., platform) {
        stop("'avtables()' not implemented for class ", class(platform))
    }
)

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

#' @describeIn avtable-methods Creates a grouping table for each
#'   distinct value in the column identified by `set`.
#' @exportMethod avtable_import_set
setMethod("avtable_import_set", c(platform = "missing"),
    function(..., platform) {
        avtable_import_set(..., platform = cloud_platform())
    }
)

#' @describeIn avtable-methods Creates a grouping table for each
#'   distinct value in the column identified by `set`.
#' @exportMethod avtable_import_set
setMethod("avtable_import_set", c(platform = "ANY"), function(..., platform) {
    stop(
        "'avtable_import_set()' not implemented for class ", class(platform)
    )
})

#' @describeIn avtable-methods Delete a table
#' @exportMethod avtable_delete
setMethod("avtable_delete", c(platform = "missing"), function(..., platform) {
    avtable_delete(..., platform = cloud_platform())
})

#' @describeIn avtable-methods Delete a table
#' @exportMethod avtable_delete
setMethod("avtable_delete", c(platform = "ANY"), function(..., platform) {
    stop("'avtable_delete()' not implemented for class ", class(platform))
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

