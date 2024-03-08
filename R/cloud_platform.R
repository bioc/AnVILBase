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

    default
}

#' @title Cloud Platform Identifier
#'
#' @description This function calls the appropriate class constructor based on
#'   environment variables or options within the workspace. This function is
#'   useful for methods dispatch.
#'
#' @details When `GOOGLE_PROJECT` is set, the function returns an object of
#'   class `gcp`. When `WORKSPACE_ID` is set, the function returns an object of
#'   class `azure`. Otherwise, the function returns an error. The user may also
#'   add options to set a default cloud platform. For AnVIL instances running on
#'   Google Cloud, the user can set
#'   `options(GCLOUD_SDK_PATH = "/home/user/google-cloud-sdk")`
#'   to set the default cloud platform to `gcp`. For AnVIL instances running on
#'   Azure, the user can set `options(AnVILAz.workspace_id = "myworkspace")`
#'   to set the default cloud platform to `azure`. Note that the values provided
#'   are example values and should be replaced with verifiable values.
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
                stop("Install the 'AnVILGCP' package to use GCP on AnVIL.")
        },
        AnVILAz = {
            if (requireNamespace("AnVILAz", quietly = TRUE))
                AnVILAz::azure()
            else
                stop("Install the 'AnVILAz' package to use Azure on AnVIL.")
        },
        {
            errmsg <- paste(
                strwrap(
                    "The runtime environment must be within an AnVIL
                    workspace. To diagnose, check the workspace environment
                    variables and ensure that you have an associated
                    'GOOGLE_PROJECT' or 'WORKSPACE_ID' environment variable
                    for Google Cloud and Azure workspaces, respectively."
                , exdent = 2L),
                collapse = "\n"
            )
            stop(errmsg)
        }
    )
}
