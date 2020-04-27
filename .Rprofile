.First <- function(){
    source("_common.R")
    
    # Watchdog
    path <- ".git/First.lock"
    if(file.exists(path)) return() else file.create(path, recursive = TRUE)
    
    # Helper Functions
    blogdown <- new.env()
    blogdown$clean_blog <- function(){
        unlink("./static", recursive = TRUE, force = TRUE)
        unlink(list.files("./content", "*.html|*.yml", full.names = TRUE, recursive = TRUE), recursive = TRUE, force = TRUE)
    }
    blogdown$libraries <-  function(packages) suppressPackageStartupMessages(invisible(sapply(packages, library, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)))
    blogdown$get_repos <- function(){
        DESCRIPTION <- readLines("DESCRIPTION")
        Date <- trimws(gsub("Date:", "", DESCRIPTION[grepl("Date:", DESCRIPTION)]))
        URL <- if(length(Date) == 1) paste0("https://mran.microsoft.com/snapshot/", Date) else "https://cran.rstudio.com/"
        return(URL)
    }
    
    # Programming Logic
    ## Set global options
    options(Ncpus = 8, repos = structure(c(CRAN = blogdown$get_repos())), dependencies = "Imports")
    
    ## Load toolkit
    blogdown$libraries(c("tidyverse", "blogdown", "usethis", "kableExtra"))
    
    ## Empty cache
    # blogdown$clean_blog()
    
    ## Show information
    message("Live preview a site using 'blogdown::serve_site()'")
    message("For faster rendering experience, edit content in Notepad++'")
}

.Last <- function(){
    # Watchdog
    blogdown::stop_server()
    unlink(".git/First.lock")
    unlink("./static", recursive = TRUE, force = TRUE)
}

