library(tic, warn.conflicts = FALSE)
source("./AppData/tic/helpers.R")

# Branchs -----------------------------------------------------------------
if(TRUE)
    tic::do_blogdown()

# Stage: Before Script ----------------------------------------------------
get_stage("before_script") %>%
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
    add_code_step(blogdown::install_hugo())

# Stage: Deploy -----------------------------------------------------------
get_stage("deploy")

# Stage: After Deploy -----------------------------------------------------
get_stage("after_deploy")
