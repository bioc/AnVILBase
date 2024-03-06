#' @name avtable-generics
#'
#' @aliases avtable_import avtable_delete_values
#'
#' @title All the table type generics for AnVIL
#'
#' @description These are the generics to be used by the AnVIL package.
#'
#' @param platform A Platform derived object.
#'
#' @param ... Arguments passed to the methods.
#'
#' @seealso [AnVILBase-generics], [avworkspace-generics]
#'
#' @export
setGeneric(
    "avtable",
    function(..., platform) standardGeneric("avtable"),
    signature = "platform"
)

#' @rdname avtable-generics
#' @export
setGeneric(
    "avtables",
    function(..., platform) standardGeneric("avtables"),
    signature = "platform"
)

#' @rdname avtable-generics
#' @export
setGeneric(
    "avtable_import",
    function(..., platform) standardGeneric("avtable_import"),
    signature = "platform"
)

#' @rdname avtable-generics
#' @export
setGeneric(
    "avtable_import_set",
    function(..., platform) standardGeneric("avtable_import_set"),
    signature = "platform"
)

#' @rdname avtable-generics
#' @export
setGeneric(
    "avtable_delete",
    function(..., platform) standardGeneric("avtable_delete"),
    signature = "platform"
)

#' @rdname avtable-generics
#' @export
setGeneric(
    "avtable_delete_values",
    function(..., platform) standardGeneric("avtable_delete_values"),
    signature = "platform"
)

