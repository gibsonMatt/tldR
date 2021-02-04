# Instantiate local sparse directory.
tldr_init <- function () {
    path <- paste(.libPaths()[pathno], "(/tldR-docs)")
    git2r::clone(
        "https://github.com/mpjuers/tldR-docs.git",
        local_path=path
        checkout=FALSE
    )
    system(paste("git -C", path, "sparse-checkout init"))
}

tldr_get <- function (object, pathno=1) {
    path <- paste(.libPaths()[pathno], "/tldR-docs")
    system(paste("git -C", path, "git sparse-checkout set", obj))
}
