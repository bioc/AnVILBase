#' @name avworkflow-generics
#'
#' @aliases avworkflow_jobs
#'
#' @title All the workflow type generics for AnVIL
#'
#' @description These are the generics to be used by the AnVIL package.
#'
#' @inheritParams AnVILBase-generics
#'
#' @seealso [AnVILBase-generics], [avworkspace-generics], [avtable-generics],
#'   [avdata-generics]
#'
#' @return called for the side effect of registering generic functions
#'
#' @examples
#' getGeneric("avworkflow_jobs")
#'
NULL

# avworkflow_jobs ----------------------------------------------------------

#' @rdname avworkflow-generics
#' @export
setGeneric(
    "avworkflow_jobs",
    function(..., platform) standardGeneric("avworkflow_jobs"),
    signature = "platform"
)
