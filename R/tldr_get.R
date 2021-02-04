# Download the appropriate documentation.

tldr_get <- function (object, pathno=1) {
    path <- paste(.libPaths()[pathno], "/tldR-docs")
    call <- paste("git -C", path, c("pull origin", paste("git sparse-checkout set", obj)))
    call <- paste(call, collapse=" && ")
    system(call)
    return(path)
}
