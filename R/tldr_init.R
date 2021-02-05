# Initiate documentation directory for the library. 

#' @export
tldr_init <- function (pathno=1) {
    path <- paste(.libPaths()[pathno], "tldR-docs", sep="/")
    print(path)
    git2r::clone(
        "https://github.com/mpjuers/tldR-docs.git",
        local_path=path,
        checkout=FALSE
    )
    command <- paste("git -C", path, "sparse-checkout init --cone")
    # print(command)
    system(command)
}
