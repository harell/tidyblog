.First <- function(){
    # Watchdog
    path <- ".git/First.lock"
    if(file.exists(path)) return() else file.create(path, recursive = TRUE)
    
    # Helper Functions
    libraries <-  function(packages) suppressPackageStartupMessages(invisible(sapply(packages, library, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)))
    get_repos <- function(){
        DESCRIPTION <- readLines("DESCRIPTION")
        Date <- trimws(gsub("Date:", "", DESCRIPTION[grepl("Date:", DESCRIPTION)]))
        URL <- if(length(Date) == 1) paste0("https://mran.microsoft.com/snapshot/", Date) else "https://cran.rstudio.com/"
        return(URL)
    }
    
    # Programming Logic
    ## Set global options
    .libPaths(Sys.getenv("R_LIBS_USER"))
    options(Ncpus = 8, repos = structure(c(CRAN = get_repos())), dependencies = "Imports")
    
    ## Load toolkit
    libraries(c("tidyverse", "blogdown", "usethis", "kableExtra"))
    
    ## Set blogdown options
    options(
        blogdown.author = "Harel Lustiger",
        blogdown.ext = ".Rmd",
        blogdown.subdir = "tutorials", # A subdirectory under content/
        blogdown.warn.future = FALSE
    )
    
    ## Empty cache
    unlink(list.files("./content", "*.html", full.names = TRUE, recursive = TRUE), recursive = TRUE, force = TRUE)
    unlink("./static", recursive = TRUE, force = TRUE)
    unlink("./public", recursive = TRUE, force = TRUE)
    
    ## Show information
    message("Live preview a site using 'blogdown::serve_site()'")
}

.Last <- function(){
    # Watchdog
    if(file.exists(".git/First.lock")) unlink(".git/First.lock") else blogdown::stop_server()
}
