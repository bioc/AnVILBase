#' @name AnVILBase-methods
#'
#' @title The AnVILBase methods for 'missing' and 'ANY' signatures
#'
#' @description The `AnVILBase` package defines S4 methods for the AnVIL
#'  package. These methods are defined for the 'missing' and 'ANY' signatures.
#'
#' @inheritParams AnVILBase-generics
#'
#' @include AnVILBase-generics.R
#'
#' @return Methods for the 'missing' and 'ANY' signatures provide a way to
#'   redirect calls to the appropriate method for the current cloud platform.
#'
#' @examples
#' findMethods("avcopy")
#' getMethod("avcopy", c(platform = "missing"))
#'
#'
NULL

#' @describeIn AnVILBase-methods Copy a file from the cloud
#' @exportMethod avcopy
setMethod("avcopy", c(platform = "missing"), function(..., platform) {
    avcopy(..., platform = cloud_platform())
})

#' @describeIn AnVILBase-methods Copy a file from the cloud
#' @exportMethod avcopy
setMethod("avcopy", c(platform = "ANY"), function(..., platform) {
    stop("'avcopy()' not implemented for class ", class(platform))
})

#' @describeIn AnVILBase-methods List files in the cloud
#' @exportMethod avlist
setMethod("avlist", c(platform = "missing"), function(..., platform) {
    avlist(..., platform = cloud_platform())
})

#' @describeIn AnVILBase-methods List files in the cloud
#' @exportMethod avlist
setMethod("avlist", c(platform = "ANY"), function(..., platform) {
    stop("'avlist()' not implemented for class ", class(platform))
})

#' @describeIn AnVILBase-methods Remove a file from the cloud
#' @exportMethod avremove
setMethod("avremove", c(platform = "missing"), function(..., platform) {
    avremove(..., platform = cloud_platform())
})

#' @describeIn AnVILBase-methods Remove a file from the cloud
#' @exportMethod avremove
setMethod("avremove", c(platform = "ANY"), function(..., platform) {
    stop("'avremove()' not implemented for class ", class(platform))
})

#' @describeIn AnVILBase-methods Backup a file to the cloud
#' @exportMethod avbackup
setMethod("avbackup", c(platform = "missing"), function(..., platform) {
    avbackup(..., platform = cloud_platform())
})

#' @describeIn AnVILBase-methods Backup a file to the cloud
#' @exportMethod avbackup
setMethod("avbackup", c(platform = "ANY"), function(..., platform) {
    stop("'avbackup()' not implemented for class ", class(platform))
})

#' @describeIn AnVILBase-methods Restore a file from the cloud
#' @exportMethod avrestore
setMethod("avrestore", c(platform = "missing"), function(..., platform) {
    avrestore(..., platform = cloud_platform())
})

#' @describeIn AnVILBase-methods Restore a file from the cloud
#' @exportMethod avrestore
setMethod("avrestore", c(platform = "ANY"), function(..., platform) {
    stop("'avrestore()' not implemented for class ", class(platform))
})

#' @describeIn AnVILBase-methods Get the storage location
#' @exportMethod avstorage
setMethod("avstorage", c(platform = "missing"), function(..., platform) {
    avstorage(..., platform = cloud_platform())
})

#' @describeIn AnVILBase-methods Get the storage location
#' @exportMethod avstorage
setMethod("avstorage", c(platform = "ANY"), function(..., platform) {
    stop("'avstorage()' not implemented for class ", class(platform))
})
