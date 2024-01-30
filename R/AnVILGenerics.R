#' @name AnVILGenerics
#'
#' @aliases avcopy avlist avremove avbackup avrestore avstorage
#'
#' @title All the generics for AnVIL
#'
#' @description These are the generics to be used by the AnVIL package.
#'
#' @param platform A Platform derived object.
#'
#' @param ... Arguments passed to the methods.
#'
#' @export
setGeneric(
    "avcopy",
    function(..., platform) standardGeneric("avcopy"),
    signature = "platform"
)

#' @rdname AnVILGenerics
#' @export
setGeneric(
    "avlist",
    function(..., platform) standardGeneric("avlist"),
    signature = "platform"
)

#' @rdname AnVILGenerics
#' @export
setGeneric(
    "avremove",
    function(..., platform) standardGeneric("avremove"),
    signature = "platform"
)

#' @rdname AnVILGenerics
#' @export
setGeneric(
    "avbackup",
    function(..., platform) standardGeneric("avbackup"),
    signature = "platform"
)

#' @rdname AnVILGenerics
#' @export
setGeneric(
    "avrestore",
    function(..., platform) standardGeneric("avrestore"),
    signature = "platform"
)

#' @rdname AnVILGenerics
#' @export
setGeneric(
    "avstorage",
    function(..., platform) standardGeneric("avstorage"),
    signature = "platform"
)
