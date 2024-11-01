#' workflow/01-prepare.R
#' 
#' Perform any calculations/joining of data sets to prepare for the main analysis
#' or modelling of data. Cached data will be saved to the "cache" directory.
#' Munge is set to 'TRUE' to source files ordered within the "munge" directory
#' for basic cleaning tasks.
#' 

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# project automation with ProjectTemplate ---------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ProjectTemplate::load.project(munging = TRUE, data_loading = TRUE, cache_loading = FALSE)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# setup -------------------------------------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Make SERVER connection
# con <- SERVERConnection(dsn = "SERVER")

# Make a spark connection
# sc <- spark_connect(master = "local")

# Clear the cache (includes deleting locally cached files in /cache)
ClearCache()

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# load data ---------------------------------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### Import data from SQL UIU.Analysts for potentially identifying data
# query = "SELECT TOP 100 * FROM [SERVER].[SCHEMA].[TABLE]"
# data_raw <- SQLSimpleImport_XYZ(query)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# prepare data ------------------------------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

data <- data_raw

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# save data ---------------------------------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### create temp table in UIU.Analysts ----
# table = "XYZ"
# CreateTable_XYZ(df = data_raw, schema = "SCHEMA", table = table)


#### Cache prepared data without VSNs
cache("data")
