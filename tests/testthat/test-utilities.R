test_that("avworkspaces_clean() preserves leading and trailing spaces", {
    ## add intentional spaces in workspace.name
    testws <- tibble::tibble(
        workspace.name = " a test workspace ",
        workspace.lastModified = "2023-06-26T21:17:26.343Z",
        workspace.createdBy = "test.bioc@gmail.com",
        workspace.namespace = "bioconductor-rpci-anvil",
        accessLevel = "READER",
        extraCol = TRUE
    )
    restbl <- testws
    ## for testing names
    coi <- c("name", "lastModified", "createdBy", "namespace", "accessLevel")
    names(restbl) <- coi
    ## for testing select operation
    restbl <- restbl[, coi]
    ## for testing Date coercion
    restbl[["lastModified"]] <- as.Date(restbl[["lastModified"]])

    expect_identical(
        avworkspaces_clean(testws),
        restbl
    )
})

