#' @name avdata-generics
#'
#' @aliases avdata avdata_import
#'
#' @title All the avdata generics for AnVIL
#'
#' @description These are the generics to be used by the AnVIL package.
#'
#' @param platform A Platform derived object.
#'
#' @param ... Arguments passed to the methods.
#'
#' @seealso [AnVILBase-generics], [avworkspace-generics], [avtable-generics]
#'
NULL

# avdata ------------------------------------------------------------------

#' @rdname avdata-generics
#' @export
setGeneric(
    "avdata",
    function(..., platform) standardGeneric("avdata"),
    signature = "platform"
)

# avdata_import -----------------------------------------------------------

#' @rdname avdata-generics
#' @export
setGeneric(
    "avdata_import",
    function(..., platform) standardGeneric("avdata_import"),
    signature = "platform"
)

