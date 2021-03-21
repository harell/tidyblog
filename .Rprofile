assign(".Rprofile", new.env(), envir = globalenv())

# .First ------------------------------------------------------------------
.First <- function(){
    try(if(testthat::is_testing()) return())

    # Package Management System
    Date <- as.character(read.dcf("DESCRIPTION", "Date"));
    URL <- if(is.na(Date)) "https://cran.rstudio.com/" else paste0("https://mran.microsoft.com/snapshot/", Date)
    options(repos = URL)

    suppressMessages(try({renv::consent(provided = TRUE); unlink("./renv")}))
    options(
        renv.lockfile = "renv.lock",
        renv.consent = TRUE,
        renv.clean = FALSE,
        renv.settings = list(
            ignored.packages = c("renv"),
            snapshot.type = "explicit",
            auto.snapshot = FALSE,
            package.dependency.fields = c("Imports", "Depends", "LinkingTo", "Suggests")[1:3],
            vcs.ignore.library = TRUE,
            use.cache = TRUE
        )
    )

    # Programming Logic
    pkgs <- c("usethis", "devtools", "magrittr", "testthat")
    invisible(sapply(pkgs, require, warn.conflicts = FALSE, character.only = TRUE))
}

# .Last -------------------------------------------------------------------
.Last <- function(){
    try(if(testthat::is_testing()) return())
    # try(blogdown::stop_server(1))
}

# pkgdown -----------------------------------------------------------------
.Rprofile$pkgdown$browse <- function(name){
    if(missing(name)){
        path <- "./docs"
        name <- "index.html"
    } else {
        path <- "./docs/articles"
        name <- match.arg(name, list.files(path, "*.html"))
    }
    try(browseURL(stringr::str_glue('{path}/{name}', path = path, name = name)))
    invisible()
}

.Rprofile$pkgdown$create <- function(){
    path_script <- tempfile("system-", fileext = ".R")
    job_name <- "Rendering Package Website"

    writeLines(c(
        "devtools::document()",
        "rmarkdown::render('README.Rmd', 'md_document')",
        "unlink(usethis::proj_path('docs'), TRUE, TRUE)",
        paste0("try(detach('package:",read.dcf("DESCRIPTION", "Package")[[1]], "', unload = TRUE, force = TRUE))"),
        "pkgdown::build_site(devel = FALSE, lazy = FALSE)"
    ), path_script)

    .Rprofile$utils$run_script(path_script, job_name)
}

.Rprofile$pkgdown$update <- function(){
    path_script <- tempfile("system-", fileext = ".R")
    job_name <- "Rendering Package Website"

    writeLines(c(
        "devtools::document()",
        "rmarkdown::render('README.Rmd', 'md_document')",
        paste0("try(detach('package:",read.dcf("DESCRIPTION", "Package")[[1]], "', unload = TRUE, force = TRUE))"),
        "pkgdown::build_site(devel = TRUE, lazy = TRUE)"
    ), path_script)

    .Rprofile$utils$run_script(path_script, job_name)
}

# bookdown ----------------------------------------------------------------
.Rprofile$pkgdown$browse <- function(){
    path <- "./_book"
    name <- "index.html"
    try(browseURL(stringr::str_glue('{path}/{name}', path = path, name = name)))
    invisible()
}

.Rprofile$bookdown$create <- function(){
    path_script <- tempfile("system-", fileext = ".R")
    job_name <- "Rendering Book"

    writeLines(c(
        "temp_dir <<- tempfile('bookdown-')",
        "if(fs::dir_exists(temp_dir)) fs::dir_delete(temp_dir)",
        "files <- list.files(full.names = TRUE, recursive = TRUE)",
        "fs::dir_create(temp_dir)",
        "fs::dir_create(unique(dirname(file.path(temp_dir, gsub('^\\\\./', '', files)))))",
        "message('Coping files to temp location')",
        "fs::file_copy(files, file.path(temp_dir, gsub('^\\\\./', '', files)))",
        "message('Rendering files')",
        "withr::with_dir(file.path(temp_dir, 'vignettes'), {",
        "bookdown::render_book('index.Rmd', output_dir = '../_book', quiet = TRUE)",
        "})",
        "message('Retrieving book from temp location')",
        "if(fs::dir_exists('_book')) fs::dir_delete('_book')",
        "fs::dir_copy(file.path(temp_dir, '_book'), getwd())",
        "message('Done!')"),
        path_script)

    .Rprofile$utils$run_script(path_script, job_name, workingDir = usethis::proj_get())
}


# blogdown ----------------------------------------------------------------
.Rprofile$blogdown$clean <- function(){
    try(blogdown::stop_server())
    files_to_delete <- list.files("./vignettes/content", ".html$", recursive = TRUE, full.names = TRUE)
    unlink(files_to_delete, recursive = TRUE)
    unlink(file.path(".", "vignettes", "static"), recursive = TRUE)
    unlink(file.path(".", "vignettes", "public"), recursive = TRUE)
}

# .Rprofile$blogdown$build_site <- function(){
#     try(blogdown::stop_server())
#     .Rprofile$blogdown$clean()
#     withr::with_dir(file.path(getwd(), 'vignettes'), blogdown::build_site())
# }

.Rprofile$blogdown$serve_site <- function(){
    try(blogdown::stop_server())
    .Rprofile$blogdown$clean()
    withr::with_dir(file.path(getwd(), 'vignettes'), blogdown::serve_site())
}


# Utils -------------------------------------------------------------------
.Rprofile$utils$run_script <- function(path, name, workingDir = "."){
    withr::with_envvar(
        c(TESTTHAT = "true"),
        rstudioapi::jobRunScript(
            path = path,
            name = name,
            workingDir = workingDir,
            importEnv = FALSE,
            exportEnv = ""
        ))
    invisible()
}

