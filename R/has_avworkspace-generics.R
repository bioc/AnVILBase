#' @name has_avworkspace-generics
#'
#' @aliases has_avworkspace
#'
#' @title The generic for checking if the user is within an environment
#'
#' @description These are generics to be used by the AnVILGCP and AnVILAz
#'   packages.
#'
#' @inheritParams AnVILBase-generics
#'
#' @seealso [AnVILBase-generics], [avworkspace-generics], [avtable-generics]
#'
#' @return called for the side effect testing the workspace environment
#'
#' @examples
#' getGeneric("has_avworkspace")
#'
NULL

# has_avworkspace ----------------------------------------------------------

#' @rdname has_avworkspace-generics
#' @export
setGeneric(
    "has_avworkspace",
    function(strict, ..., platform) standardGeneric("has_avworkspace"),
    signature = "platform"
)

