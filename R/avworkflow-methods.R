#' @name avworkflow-methods
#'
#' @title All the workflow type methods for AnVIL
#'
#' @description These are the methods to be used by the AnVIL package.
#'
#' @inheritParams avworkflow-generics
#'
#' @include avworkflow-generics.R
#'
NULL

#' @describeIn avworkflow-methods Get the status of a workflow execution
#' @exportMethod avworkflow_jobs
setMethod("avworkflow_jobs", c(platform = "missing"),
    function(..., platform) {
        avworkflow_jobs(..., platform = cloud_platform())
    }
)

#' @describeIn avworkflow-methods Get the status of a workflow execution
#' @exportMethod avworkflow_jobs
setMethod("avworkflow_jobs", c(platform = "ANY"),
    function(..., platform) {
        stop("'avworkflow_jobs()' not implemented for class ", class(platform))
    }
)
