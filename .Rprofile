.First <- function(){
    if(is.null(getOption(".First.time"))) options(.First.time = TRUE)
    
    options(
        tidyverse.quiet = TRUE,
        tibble.width = 66
    )
    
    options(
        knitr.graphics.auto_pdf = FALSE
    )
    
    options(
        blogdown.author = "Harel Lustiger",
        blogdown.ext = ".Rmd",
        blogdown.subdir = "post", # A subdirectory under content/
        blogdown.warn.future = FALSE
    )
    
    if(getOption(".First.time")){
        options(.First.time = FALSE)
        pkgs <- c("tidyverse", "blogdown", "kableExtra")
        invisible(sapply(pkgs, library, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE))
        message("Live preview a site using 'blogdown::serve_site()'")
    }
    
    `%>%` <- magrittr::`%>%`
}

.Last <- function(){
    message("Shuting down live site preview")
    try(blogdown::stop_server())
    message("Cleaning up site repo")
    unlink("./static", recursive = TRUE, force = TRUE)
    unlink("./public", recursive = TRUE, force = TRUE)
}
