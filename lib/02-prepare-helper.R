#' Variables and functions used for preparing the datasets for analysis
#' 
#' Load into R scripts by including: source("functions/prepare-helper.R")
#'
#'
#'

#### Project variables ----



# Helper functions --------------------------------------------------------

ClearCache <- function(){
  
  if (file.exists(here("cache", "data.RData"))) {
    clear.cache("data")
  } else {
    "Cache was clear of data.RData"
  }

}




          