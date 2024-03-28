#' @name avnotebooks-generics
#'
#' @aliases avnotebooks avnotebooks_localize avnotebooks_delocalize
#'
#' @title All the avnotebooks generics for AnVIL
#'
#' @description These are the generics to be used by the AnVIL package.
#'
#' @inheritParams AnVILBase-generics
#'
#' @seealso [AnVILBase-generics], [avworkspace-generics], [avtable-generics],
#'  [avdata-generics], [avworkflow-generics]
#'
#' @return called for the side effect of registering generic functions
#'
#' @examples
#' getGeneric("avnotebooks")
#'
#'
NULL

# avnotebooks --------------------------------------------------------------

#' @rdname avnotebooks-generics
#' @export
setGeneric(
    "avnotebooks",
    function(..., platform) standardGeneric("avnotebooks"),
    signature = "platform"
)

# avnotebooks_localize -----------------------------------------------------

#' @rdname avnotebooks-generics
#' @export
setGeneric(
    "avnotebooks_localize",
    function(..., platform) standardGeneric("avnotebooks_localize"),
    signature = "platform"
)

# avnotebooks_delocalize ---------------------------------------------------

#' @rdname avnotebooks-generics
#' @export
setGeneric(
    "avnotebooks_delocalize",
    function(..., platform) standardGeneric("avnotebooks_delocalize"),
    signature = "platform"
)
