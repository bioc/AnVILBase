#' @name avdata-generics
#'
#' @aliases avdata avdata_import
#'
#' @title All the avdata generics for AnVIL
#'
#' @description These are the generics to be used by the AnVIL package.
#'
#' @inheritParams AnVILBase-generics
#'
#' @seealso [AnVILBase-generics], [avworkspace-generics], [avtable-generics],
#'   [avworkflow-generics]
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

