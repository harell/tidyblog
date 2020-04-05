library(tic, warn.conflicts = FALSE)
source("./AppData/tic/helpers.R")

# Macros ------------------------------------------------------------------
if(TRUE) tic::do_blogdown()

# Stage: Before Install ---------------------------------------------------
get_stage("before_install") 

# Stage: Install ----------------------------------------------------------
get_stage("install") %>% 
    add_code_step(remotes::install_deps(repos = repo_default(), dependencies = TRUE))

# Stage: Before Script ----------------------------------------------------
get_stage("before_script")

# Stage: Script -----------------------------------------------------------
get_stage("script") 

# Stage: After Success ----------------------------------------------------
get_stage("after_success")

# Stage: After Failure ----------------------------------------------------
get_stage("after_failure") %>%
    add_code_step(print(sessioninfo::session_info(include_base = FALSE)))

# Stage: Before Deploy ----------------------------------------------------
get_stage("before_deploy") %>% 
    add_step(step_setup_ssh(private_key_name = "TIC_DEPLOY_KEY")) %>% 
    add_step(step_setup_push_deploy(path = "public", branch = "gh-pages", remote_url = NULL, orphan = FALSE, checkout = TRUE))

# Stage: Deploy -----------------------------------------------------------
get_stage("deploy")

# Stage: After Deploy -----------------------------------------------------
get_stage("after_deploy")
