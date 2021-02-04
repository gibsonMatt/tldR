#setwd("/Users/matthew/OneDrive/Projects/tldR/scratch")



#Constructor
tldr <- function(function_name){
  
  #######Lookup markdown file using githup api###################################
  #Lookup code goes here
  md <- "../pages/paste/paste.md" #temp example file
  ###############################################################################
  
  ####Note###
  #We could also do the conversion to HTML here instead of in the renderHTML method
  ##########
  
  value <- list(function_name = function_name, markdown_dir = md)
  attr(value, "class") <- "tldr"
  
  ##########################################################################################################
  #I'm not sure what convention is, but we could also call the renderHTML method in the constructor, so that 
  #you dont have to first define the object of class tldr and then call renderHTML.
  #
  #renderHTML(value)
  ##########################################################################################################
  
  return(value)
}


#Define generic
renderHTML <- function(object){
  UseMethod("renderHTML", object)
}


#Default method for tldr
renderHTML.default <- function(object){
  
  #Create temp file (needed to render to viewer, for security reasons)
  file_name <- tempfile(pattern = "doc", tmpdir = tempdir(), fileext = ".html")
  
  #Convert markdown to html and save to temp file
  a <- rmarkdown::render(input = object$markdown_dir, output_format = html_document(theme = "flatly"), output_dir = tempdir(), output_file = "doc.html", quiet = T)
  
  #Show html in viewer
  rstudioapi::viewer(a)
}




#Create new tldr object
t <- tldr("paste")

#Render the doc
renderHTML(t)

