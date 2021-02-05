# Download the appropriate documentation.

#' @export
tldr_get <- function (object, pathno=1) {
    path <- paste(.libPaths()[pathno], "tldR-docs", sep="/") 
    call <- paste(
        "git -C", 
        path, 
        c(
            "pull origin",
            paste("sparse-checkout set Packages/", object, sep="")
        )
    )
    call <- paste(call, collapse=" && ")
    system(call)
    return(path)
}
