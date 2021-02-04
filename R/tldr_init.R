# Initiate documentation directory for the library. 

#' @export
tldr_init <- function () {
    path <- paste(.libPaths()[pathno])
    git2r::clone(
        "https://github.com/mpjuers/tldR-docs.git",
        local_path=path
        checkout=FALSE
    )
    system(paste("git -C", paste(path, "/tldR-docs"), "sparse-checkout init --cone"))
}
