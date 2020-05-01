.First <- function(){
    assign(".Rprofile", new.env(), envir = globalenv())
    
    # Helpers
    unlink <- function(x) base::unlink(x, recursive = TRUE, force = TRUE)
    
    .Rprofile$libraries <-  function(packages) suppressPackageStartupMessages(invisible(sapply(packages, library, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)))
    .Rprofile$get_repos <- function(){
        DESCRIPTION <- readLines("DESCRIPTION")
        Date <- trimws(gsub("Date:", "", DESCRIPTION[grepl("Date:", DESCRIPTION)]))
        URL <- if(length(Date) == 1) paste0("https://mran.microsoft.com/snapshot/", Date) else "https://cran.rstudio.com/"
        return(URL)
    }
    
    .Rprofile$NEW_SESSION <- new.env()
    .Rprofile$NEW_SESSION$unset <- function() Sys.unsetenv("NEW_SESSION")
    .Rprofile$NEW_SESSION$set <- function() Sys.setenv(NEW_SESSION = FALSE)
    .Rprofile$NEW_SESSION$get <- function() as.logical(Sys.getenv("NEW_SESSION"))
    
    .Rprofile$blogdown <- new.env()
    .Rprofile$blogdown$clean_blog <- function(){
        unlink("./static")
        unlink(list.files("./content", "*.html|*.yml", full.names = TRUE, recursive = TRUE))
    }
    
    # Programming Logic
    source("_common.R")
    
    ## .First watchdog
    if(isFALSE(.Rprofile$NEW_SESSION$get())) return() else .Rprofile$NEW_SESSION$set()
    
    ## Initiate the package management system
    options(Ncpus = 8, repos = structure(c(CRAN = .Rprofile$get_repos())), dependencies = "Imports")
    
    ## Load toolkit
    .Rprofile$libraries(c("tidyverse", "blogdown", "usethis", "kableExtra"))
    
    ## Empty cache
    # .Rprofile$blogdown$clean_blog()
    
    ## Show information
    message("Live preview a site using 'blogdown::serve_site()'")
    message("For faster rendering experience, edit content in Notepad++'")
}

.Last <- function(){
    unlink <- function(x) base::unlink(x, recursive = TRUE, force = TRUE)
    
    ## .First watchdog
    .Rprofile$NEW_SESSION$unset()
    
    ## Tidy up
    try(servr::daemon_stop())
    unlink("./static")
}

