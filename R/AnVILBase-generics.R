#' @name AnVILBase-generics
#'
#' @aliases avcopy avlist avremove avbackup avrestore avstorage
#'
#' @title All the generics for AnVIL
#'
#' @description These are the generics to be used by the AnVIL package.
#'
#' @param platform A Platform derived class indicating the AnVIL environment,
#'   currently, `azure` and `gcp` classes are compatible.
#'
#' @param ... Arguments passed to the methods.
#'
#' @seealso [avworkspace-generics], [avtable-generics], [avworkflow-generics]
#'
#' @return called for the side effect of registering generic functions
#'
#' @examples
#' getGeneric("avcopy")
#'
#' @export
setGeneric(
    "avcopy",
    function(..., platform) standardGeneric("avcopy"),
    signature = "platform"
)

#' @rdname AnVILBase-generics
#' @export
setGeneric(
    "avlist",
    function(..., platform) standardGeneric("avlist"),
    signature = "platform"
)

#' @rdname AnVILBase-generics
#' @export
setGeneric(
    "avremove",
    function(..., platform) standardGeneric("avremove"),
    signature = "platform"
)

#' @rdname AnVILBase-generics
#' @export
setGeneric(
    "avbackup",
    function(..., platform) standardGeneric("avbackup"),
    signature = "platform"
)

#' @rdname AnVILBase-generics
#' @export
setGeneric(
    "avrestore",
    function(..., platform) standardGeneric("avrestore"),
    signature = "platform"
)

#' @rdname AnVILBase-generics
#' @export
setGeneric(
    "avstorage",
    function(..., platform) standardGeneric("avstorage"),
    signature = "platform"
)
