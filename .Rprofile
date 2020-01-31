.First <- function(){
    options(
        blogdown.author = "Harel Lustiger",
        blogdown.ext = ".Rmd",
        # A subdirectory under content/
        blogdown.subdir = "post",
        blogdown.warn.future = FALSE
    )
    message("Live preview a site using 'blogdown::serve_site()'")
}

.Last <- function(){
    try(blogdown::stop_server())
    unlink("./public", recursive = TRUE, force = TRUE)
}
