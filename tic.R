library(tic, warn.conflicts = FALSE)
source("./AppData/tic/helpers.R")

# Macros ------------------------------------------------------------------
if(TRUE) tic::do_blogdown()

# Stage: Before Install ---------------------------------------------------
get_stage("before_install")

# Stage: Install ----------------------------------------------------------
get_stage("install")

# Stage: Before Script ----------------------------------------------------
get_stage("before_script") %>%
    add_code_step(if(nchar(Sys.getenv("id_rsa")) == 0) stop("id_rsa not defined; use travis::use_travis_deploy()")) %>% 
    add_code_step(remotes::install_deps(dependencies = TRUE))

# Stage: Script -----------------------------------------------------------
get_stage("script") 

# Stage: After Success ----------------------------------------------------
get_stage("after_success")

# Stage: After Failure ----------------------------------------------------
get_stage("after_failure") %>%
    add_code_step(print(sessioninfo::session_info(include_base = FALSE)))

# Stage: Before Deploy ----------------------------------------------------
get_stage("before_deploy")

# Stage: Deploy -----------------------------------------------------------
get_stage("deploy")

# Stage: After Deploy -----------------------------------------------------
get_stage("after_deploy")
