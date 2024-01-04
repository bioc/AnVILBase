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
#' @description This function returns the cloud platform identifier.
#'
#' @return A character string with the cloud platform identifier, either
#'   "azure" or "gcp".
#' @export
cloud_platform <- function() {
    .get_platform()
}
