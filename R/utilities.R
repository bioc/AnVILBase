#' @name avbase-utilities
#'
#' @title Helper functions for working in AnVIL
#'
#' @description
#' * `avstop_for_status` - Check HTTP status code and raise error when
#'   less than 400.
#'
#' @param response Response object from httr
#'
#' @param op Operation that was attempted
#'
#' @importFrom httr status_code http_condition headers
#'
#' @return `avstop_for_status` - `response` if status code less than 400
#'   otherwise throw an error
#'
#' @examples
#' if (interactive()) {
#'     test <- httr::GET("http://google.com/")
#'     avstop_for_status(test, "google")
#' }
#'
#' @export
avstop_for_status <-
    function(response, op)
{
    status <- status_code(response)
    if (status < 400L)
        return(invisible(response))

    cond <- http_condition(status, "error")
    type <- headers(response)[["content-type"]]
    msg <- NULL
    if (nzchar(type) && grepl("application/json", type)) {
        content <- as.list(response)
        msg <- content[["message"]]
        if (is.null(msg))
            ## e.g., from bond DRS server
            msg <- content$response$text
    } else if (nzchar(type) && grepl("text/html", type)) {
        ## these pages can be too long for a standard 'stop()' message
        cat(as.character(response), file = stderr())
    }

    message <- paste0(
        "'", op, "' failed:\n  ",
        conditionMessage(cond),
        if (!is.null(msg)) "\n  ", msg
    )
    stop(message, call.=FALSE)
}

#' @rdname avbase-utilities
#'
#' @description
#' * `avworkspaces_clean` - Clean workspace information
#'
#' @param .data A tibble with workspace information
#'
#' @return `avworkspaces_clean` - A cleaned tibble with workspace information
#'
#' @export
avworkspaces_clean <- function(.data) {
    .data |>
        dplyr::select(
            name = .data$workspace.name,
            lastModified = .data$workspace.lastModified,
            createdBy = .data$workspace.createdBy,
            namespace = .data$workspace.namespace,
            accessLevel = .data$accessLevel
        ) |>
        dplyr::mutate(
            lastModified = as.Date(.data$lastModified)
        ) |>
        dplyr::arrange(
            .data$name,
            dplyr::desc(.data$lastModified)
        )
}
