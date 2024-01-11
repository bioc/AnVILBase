.get_env_opt <-
    function(envvar, option, default)
{
    opt <- Sys.getenv(envvar, unset = default)
    getOption(option, opt)
}

.get_platform <- function(default = "") {
    opt <- .get_env_opt("GOOGLE_PROJECT", "GCLOUD_SDK_PATH", default)
    if (nzchar(opt))
        return("AnVILGCP")

    opt <- .get_env_opt("WORKSPACE_ID", "AnVILAz.workspace_id", default)
    if (nzchar(opt))
        return("AnVILAz")

    stop("The runtime environment must be within an AnVIL workspace.")
}

#' @title Cloud Platform Identifier
#'
#' @description This function calls the appropriate class constructor based on
#'   environment variables or options within the workspace. This function is
#'   useful for methods dispatch.
#'
#' @details
#' When `GOOGLE_PROJECT` is set, the function returns an object of class
#'  `gcp`. When `WORKSPACE_ID` is set, the function returns an object of
#'  class `azure`. Otherwise, the function returns an error.
#'
#' @return An instance of class `gcp` or `azure` depending on the environment
#'   variables or options set within the Terra workspace.
#'
#' @export
cloud_platform <- function() {
    switch(
        .get_platform(),
        AnVILGCP = {
            if (requireNamespace("AnVILGCP", quietly = TRUE))
                AnVILGCP::gcp()
            else
                stop("The AnVILGCP package is not installed.")
        },
        AnVILAz = {
            if (requireNamespace("AnVILAz", quietly = TRUE))
                AnVILAz::azure()
            else
                stop("The AnVILAz package is not installed.")
        },
        stop("The runtime environment must be within an AnVIL workspace.")
    )
}
