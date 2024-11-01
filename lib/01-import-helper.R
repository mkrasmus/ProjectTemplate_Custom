#' Variables and functions used for importing data prior to preparing data for analysis
#'
#'

#### Project variables ----

####

#### Project helper functions -----

# This function attempts connection to ODBC Data Sources' system DSN if prepared then
# function will execute connection via system DSN name, if not will attempt connection
# via standard connection
SERVERConnection <- function(dsn = "DSN"){

if (dbCanConnect(odbc::odbc(), dsn = "DSN")) {
  con <- DBI::dbConnect(odbc::odbc(), dsn = "DSN")
} else {
  con <- dbConnect(odbc::odbc(), 
                 Driver = "SQL Server", 
                 Server = "SERVER", 
                 Trusted_Connection = "True"
                 )
}
  
  return(con)
}

#### A template of a function to import data from the OLAP cube. 
#### Edit python file in "queries/cube" - see reticulate package to setup globalenv 
#### https://rstudio.github.io/reticulate/reference/source_python.html
CubeImport_XYZ <- function(){
  
  # python_file = "cube_XYZ"
  # python_file_path = here("queries", "cube", paste0(python_file,".py")) 
  # reticulate::source_python(file = python_file_path, envir = globalenv())
  
  return(data)
  
}

#### A template of a function to import data from SQL server. 
#### Edit R file in "queries/sql" - note the use of glue_sql and parameters 
#### https://glue.tidyverse.org/reference/glue_sql.html
SQLImport_XYZ <- function(){
  
  # source(here("queries", "sql", "sql_XYZ.R"))
  
  return(data)
  
}


SQLSimpleImport_XYZ <- function(query){

  data <- tbl(src = con, from = sql(query)) %>% as.data.frame

  return(data)
}

#### A function to create sql table into ERBI_UIU
CreateTable_XYZ <- function(df, schema = "ANALYSTS", table){
  
  if (dbExistsTable(
    conn = con
    ,name = Id(schema = schema, table = table)
  )){
    dbRemoveTable(
      conn = con
      ,name = Id(schema = schema, table = table)
    )
  } else {NULL}
  
  dbWriteTable(conn = con
               ,name = Id(schema = schema, table = table)
               ,value = df
  )
  
  #bDisconnect(con)
  
}
