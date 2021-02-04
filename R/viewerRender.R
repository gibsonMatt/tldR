#setwd("/Users/matthew/OneDrive/Projects/tldR/scratch")



#Constructor

#' @export
tldr <- function(name){

    #######Lookup markdown file using githup api###################################
    #Lookup code goes here
    path <- tldr_get(name, 1)
    md <- paste(path, "/Packages/", name, "/doc.Rmd", sep='')#temp example file
    ###############################################################################

    ####Note###
    #We could also do the conversion to HTML here instead of in the renderHTML method
    ##########

    value <- list(name = name, doc = md, examples=list(), package="")
    attr(value, "class") <- "tldr"

    ##########################################################################################################
    #I'm not sure what convention is, but we could also call the renderHTML method in the constructor, so that 
    #you dont have to first define the object of class tldr and then call renderHTML.
    #
    #renderHTML(value)
    ##########################################################################################################

    renderHTML(value)
    return(value)
}


#Define generic

#' @export
renderHTML <- function(object){
    UseMethod("renderHTML", object)
}


#Default method for tldr

#' @export
renderHTML.default <- function(object){

    #Create temp file (needed to render to viewer, for security reasons)
    file_name <- tempfile(pattern = "doc", tmpdir = tempdir(), fileext = ".html")

    #Convert markdown to html and save to temp file
    a <- rmarkdown::render(
        input = object$doc,
        output_format = rmarkdown::html_document(theme = "flatly"),
        output_dir = tempdir(),
        output_file = "doc.html",
        quiet = T
    )

    #Show html in viewer
    rstudioapi::viewer(a)
}




#Create new tldr object
t <- tldr("base/paste")

#Render the doc
# renderHTML(t)

