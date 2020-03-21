.First <- function(){
    if(is.null(getOption(".First.time"))) options(.First.time = TRUE)
    
    if(getOption(".First.time")){
        options(.First.time = FALSE)
        pkgs <- c("tidyverse", "blogdown", "kableExtra")
        suppressPackageStartupMessages(
            invisible(sapply(pkgs, library, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE))
        )
        message("Live preview a site using 'blogdown::serve_site()'")
    }
    
    options(
        blogdown.author = "Harel Lustiger",
        blogdown.ext = ".Rmd",
        blogdown.subdir = "post", # A subdirectory under content/
        blogdown.warn.future = FALSE
    )
}

.Last <- function(){
    message("Shuting down live site preview")
    try(blogdown::stop_server())
    message("Cleaning up site repo")
    unlink("./static", recursive = TRUE, force = TRUE)
    unlink("./public", recursive = TRUE, force = TRUE)
}
