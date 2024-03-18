.get_env_opt <-
    function(envvar, option, default)
{
    opt <- Sys.getenv(envvar, unset = default)
    getOption(option, opt)
}

#' @name cloud_platform
#'
#' @param default `character(1)`. The default cloud platform to use if no
#'  environment variables or options are set. The default is `""`.
#'
#' @export
avplatform_namespace <- function(default = "") {
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
#' @description `cloud_platform` calls the appropriate class constructor based
#'   on environment variables or options within the workspace. This function is
#'   used to determine the cloud platform to dispatch on for AnVIL methods. It
#'   returns an error when neither the Azure or Google Cloud environment
#'   variables are set. The `avplatform_namespace` function is a lower level helper to
#'   identify the platform based on environment variables or options. Generally,
#'   these functions are \emph{not} meant to be used directly.
#'
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
#' @return For `cloud_platform`: An instance of class `gcp` or `azure` based
#'   on environment variables or options set within the AnVIL workspace.
#'   For `avplatform_namespace`: A character string indicating the cloud platform.
#'
#' @examples
#' avplatform_namespace()
#' if (interactive()) {
#'     cloud_platform()
#' }
#' @export
cloud_platform <- function() {
    switch(
        avplatform_namespace(),
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
