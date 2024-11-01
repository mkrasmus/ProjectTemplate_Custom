#' workflow/03-report.R
#' 
#' This is will report results using markdown, excel etc load.project will load the
#' data from the cache directory.
#' 
#' 

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# project automation with ProjectTemplate ---------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ProjectTemplate::load.project(munging = FALSE, cache_loading = TRUE, data_loading = FALSE)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# setup -------------------------------------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Make SERVER connection
# con <- SERVERConnection(dsn = "SERVER")

# Make a spark connection
# sc <- spark_connect(master = "local")

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# markdown documentation --------------------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

name_of_rmd_file <- 'TEMP NAME'

tryCatch({
    rmarkdown::render(here("markdown", paste0(name_of_rmd_file, ".Rmd")),  # markdown file
                      output_file =  ".html",
                      output_dir = here("reports", "html"))}, error=function(e){}
)
  



