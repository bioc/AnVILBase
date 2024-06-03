#' @name avtable-generics
#'
#' @aliases avtable avtables avtable_import avtable_import_set
#'   avtable_delete_values
#'
#' @title All the table type generics for AnVIL
#'
#' @description These are the generics to be used by the AnVIL package.
#'
#' @inheritParams AnVILBase-generics
#'
#' @seealso [AnVILBase-generics], [avworkspace-generics], [avworkflow-generics]
#'
#' @return called for the side effect of registering generic functions
#'
#' @examples
#' getGeneric("avtable")
#'
NULL

# avtable -----------------------------------------------------------------

#' @rdname avtable-generics
#' @export
setGeneric(
    "avtable",
    function(..., platform) standardGeneric("avtable"),
    signature = "platform"
)

# avtables ----------------------------------------------------------------

#' @rdname avtable-generics
#' @export
setGeneric(
    "avtables",
    function(..., platform) standardGeneric("avtables"),
    signature = "platform"
)

# avtable_import ----------------------------------------------------------

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

# avtable_import_set ------------------------------------------------------

#' @rdname avtable-generics
#' @export
setGeneric(
    "avtable_delete",
    function(..., platform) standardGeneric("avtable_delete"),
    signature = "platform"
)

# avtable_delete_values ---------------------------------------------------

#' @rdname avtable-generics
#' @export
setGeneric(
    "avtable_delete_values",
    function(..., platform) standardGeneric("avtable_delete_values"),
    signature = "platform"
)
