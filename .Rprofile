.First <- function(){
    options(
        tidyverse.quiet = TRUE,
        tibble.width = 66,
        blogdown.author = "Harel Lustiger",
        blogdown.ext = ".Rmd",
        # A subdirectory under content/
        blogdown.subdir = "post",
        blogdown.warn.future = FALSE
    )
    message("Live preview a site using 'blogdown::serve_site()'")
    pkgs <- c("tidyverse", "blogdown", "kableExtra")
    # remotes::install_cran(pkgs, quiet = TRUE)
    invisible(sapply(pkgs, library, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE))
}

.Last <- function(){
    message("Shuting down live site preview")
    try(blogdown::stop_server())
    message("Cleaning up site repo")
    unlink("./public", recursive = TRUE, force = TRUE)
}
