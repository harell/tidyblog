withr::with_dir(
    usethis::proj_get(),
    pkgload::load_all(export_all = !FALSE, helpers = FALSE, quiet = TRUE, warn_conflicts = FALSE)
)

# global options ----------------------------------------------------------
options(
    width = 68,
    digits = 2,
    # Tidyverse
    tidyverse.quiet = TRUE,
    usethis.quiet = TRUE,
    tibble.width = getOption("width")
)

# knitr -------------------------------------------------------------------
knitr::opts_chunk$set(
    collapse = TRUE,
    out.width = '100%',
    echo = FALSE,
    results = "markup",
    message = FALSE,
    warning = FALSE,
    cache = !TRUE,
    comment = "#>",
    fig.retina = 0.8, # figures are either vectors or 300 dpi diagrams
    dpi = 300,
    out.width = "70%",
    fig.align = 'center',
    fig.width = 6,
    fig.asp = 0.618,  # 1 / phi
    fig.show = "hold",
    eval.after = 'fig.cap' # so captions can use link to demos
)

options(
    knitr.graphics.auto_pdf = FALSE,
    knitr.table.format = "html"
)

knitr::knit_hooks$set(
    error = function(x, options) {
        paste('\n\n<div class="alert alert-danger">',
              x %>%
                  stringr::str_replace_all('^#>\ Error in eval\\(expr, envir, enclos\\):', '**Caution:**'),
              '</div>', sep = '\n')
    },
    warning = function(x, options) {
        paste('\n\n<div class="alert alert-warning">',
              x %>%
                  stringr::str_replace_all('##', '\n') %>%
                  stringr::str_replace_all('^#>\ Warning:', '**Note:**') %>%
                  stringr::str_remove_all("#>"),
              '</div>', sep = '\n')
    },
    message = function(x, options) {
        paste('\n\n<div class="alert alert-info">',
              gsub('##|#>', '\n', paste("**Tip:**", x)),
              '</div>', sep = '\n')
    }
)


# blogdown ----------------------------------------------------------------
options(
    blogdown.author = "Harel Lustiger",
    blogdown.ext = ".Rmd",
    # blogdown.subdir = "tutorials", # A subdirectory under content/
    blogdown.warn.future = FALSE,
    blogdown.publishDir = tempfile("blogdown"),
    blogdown.method = "html"
)

# rmarkdown ---------------------------------------------------------------
kable <- knitr::kable

