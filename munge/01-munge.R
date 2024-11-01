#' munge/01-munge.R
#' 
#' When Munge is set to 'TRUE' in load.project files are sourced within the "munge" directory
#' for basic cleaning tasks.
#' 

### Example with template RProject

if (exists("csv_raw")) {
    rm(csv_raw)
} else {
    print("visit munge directory, update munge files")
}

if (exists("excel_raw")) {
  rm(excel_raw)
} else {
    print("visit munge directory, update munge files")
  }

if (exists("sql_simple_raw")) {
  data_raw <- sql_simple_raw; rm(sql_simple_raw)
} else {
    print("visit munge directory, update munge files")
  }   

