setOldClass("response")
setOldClass("httr2_response")

#' @rdname Response
#'
#' @name Response
#'
#' @aliases flatten,response-method
#'
#' @author M. Morgan, M. Ramos
#'
#' @importFrom httr content
#' @importFrom httr2 resp_body_string
#' @importFrom jsonlite fromJSON
#' @importFrom tibble as_tibble
NULL

#' @rdname Response
#'
#' @name Response
#'
#' @title Process service responses to tibble and other data structures.
#'
#' @aliases flatten
#'
#' @param x A `response` object returned by the service.
#'
#' @return `flatten()` returns a `tibble` where each row correseponds
#'     to a top-level list element of the return value, and columns
#'     are the unlisted second and more-nested elements.
#'
#' @examples
#' if (AnVILGCP::gcloud_exists()) {
#'     leonardo <- Leonardo()
#'     leonardo$listRuntimes() |> flatten()
#'
#'     leonardo$getSystemStatus() |> str()
#'
#'     leonardo$getSystemStatus() |> as.list()
#' }
#' @export
setGeneric("flatten", function(x) standardGeneric("flatten"))

#' @describeIn Response Reduce httr response object to a two-dimensional table
#' @exportMethod flatten
setMethod("flatten", "response",
    function(x)
{
    .resp_tibble(x, content, as="text", encoding = "UTF-8")
})

#' @describeIn Response Create a compact representation of the list-like JSON
#'   response
#'
#' @param object A `response` object returned by the service.
#'
#' @return `str()` displays a compact representation of the list-like
#'     JSON response; it returns `NULL`.
#'
#' @exportMethod str
setMethod("str", "response",
    function(object)
{
    value <- content(object, as="text", encoding = "UTF-8")
    if (nzchar(value)) {
        json <- fromJSON(value)
    } else {
        json <- character()
    }
    str(json)
})

#' @rdname Response
#'
#' @param as character(1); one of 'raw', 'text', 'parsed'
#'
#' @param \dots not currently used
#'
#' @return `as.list()` returns the content of the web service request
#'     as a list.
#'
#' @export
as.list.response <-
    function(x, ..., as=c("text", "raw", "parsed"))
{
    as <- match.arg(as)
    value <- content(x, as=as, encoding = "UTF-8")
    if (identical(as, "text") && nzchar(value)) {
        value <- fromJSON(value)
    }
    value
}

#' @describeIn Response Reduce httr2 request responses to two-dimensional table
#'   form
#' @exportMethod flatten
setMethod("flatten", "httr2_response",
    function(x)
{
    .resp_tibble(x, response_body_string)
})

.resp_tibble <- function(x, fun, ...) {
    value <- fun(x, ...)
    if (nzchar(value)) {
        json <- fromJSON(value, flatten = TRUE)
        as_tibble(json)
    } else {
        tibble()
    }
}
