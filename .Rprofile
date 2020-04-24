.First <- function(){
    # Helper Functions
    set_repos <- function(){
        DESCRIPTION <- readLines("DESCRIPTION")
        Date <- trimws(gsub("Date:", "", DESCRIPTION[grepl("Date:", DESCRIPTION)]))
        if(length(Date) == 1) options(repos = paste0("https://mran.microsoft.com/snapshot/", Date))
    }
    
    # Programming Logic
    suppressWarnings(try(set_repos(), silent = TRUE))
    if(isFALSE(getOption(".First.time"))) return() else options(.First.time = TRUE)
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
