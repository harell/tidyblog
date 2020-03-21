# Imports -----------------------------------------------------------------
`%>%` <- magrittr::`%>%`

# knitr -------------------------------------------------------------------
knitr::opts_chunk$set(
    echo = FALSE, 
    message = FALSE,
    warning = FALSE,
    fig.retina = 0.8, # figures are either vectors or 300 dpi diagrams
    dpi = 300,
    out.width = "100%",
    fig.align = 'center',
    fig.width = 6,
    fig.asp = 0.618,  # 1 / phi
    fig.show = "hold",
    eval.after = 'fig.cap' # so captions can use link to demos
)

# Options Settings --------------------------------------------------------
options(
    width = 66,
    digits = 2
)

options(
    tidyverse.quiet = TRUE,
    tibble.width = getOption("width")
)

options(
    knitr.graphics.auto_pdf = FALSE,
    knitr.table.format = "html"
)