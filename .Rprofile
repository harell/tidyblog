.First <- function(){
    if(isTRUE(as.logical(Sys.getenv("CI")))) return()
    if(identical(getOption(".First.time"), FALSE)) return() else options(.First.time = TRUE)
    
    if(getOption(".First.time")){
        options(.First.time = FALSE)
        pkgs <- c("tidyverse", "blogdown", "usethis", "kableExtra")
        suppressPackageStartupMessages(
            invisible(sapply(pkgs, library, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE))
        )
        message("Live preview a site using 'blogdown::serve_site()'")
    }
    
    options(
        blogdown.author = "Harel Lustiger",
        blogdown.ext = ".Rmd",
        blogdown.subdir = "tutorials", # A subdirectory under content/
        blogdown.warn.future = FALSE
    )
}

.Last <- function(){
    # if(isTRUE(as.logical(Sys.getenv("CI")))) return()
    # message("Shuting down live site preview")
    # try(blogdown::stop_server())
    # message("Cleaning up site repo")
    # unlink(list.files("./content", "*.html", full.names = TRUE, recursive = TRUE), recursive = TRUE, force = TRUE)
    # unlink("./static", recursive = TRUE, force = TRUE)
    # unlink("./public", recursive = TRUE, force = TRUE)
}
