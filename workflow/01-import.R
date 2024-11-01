#' workflow/00-import.R
#' 
#' Script to read in data from various sources, flat files, excel, the cube, sql
#' then save into the "data" folder for "munging" the data (harmonise/normalise) before
#' preparing via workflow/01-prepare.R



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# project automation with ProjectTemplate ---------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ProjectTemplate::load.project(munging = FALSE, data_loading = FALSE, cache_loading = FALSE)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# connections -------------------------------------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Make SERVER connection
# con <- SERVERConnection(dsn = "SERVER")

# Make a spark connection
# sc <- spark_connect(master = "local")

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# load data ---------------------------------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### Import from flatfile/excel
csv_file = "XYZ"
csv_file_path = here("data-raw", "csv", paste0(csv_file,".csv"))
csv_raw <- read_csv(file = csv_file_path, col_types = cols(.default = "c"))

xlsx_file = "XYZ"
xlsx_file_path = here("data-raw", "excel", paste0(xlsx_file,".xlsx"))
excel_raw <- read_xlsx(xlsx_file_path, sheet = "Sheet1", col_types = c("text"))

#### Import from ERBI cube, edit template function in import-helper.R and respective queries/cube/cube_XYZ.py
# cube_raw <- CubeImport_XYZ()

#### Import from SQL Server, edit template function in import-helper.R and respective queries/sql/sql_XYZ.R
# sql_raw <- SQLImport_XYZ()

#### Simpler query for example
query = "SELECT TOP 100 * FROM [SERVER].[DATABASE].[TABLE]"
sql_simple_raw <- SQLSimpleImport_XYZ(query)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# save data ---------------------------------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### create temp table in ERBI_UIU.Analysts ----
#### Important if the raw data has identifying data like VSNs
# table = "XYZ"
# CreateTable_XYZ(df = data_raw, schema = "Analysts", table = table)

#### Save imported data without VSNs
save(
     csv_raw,
     excel_raw,
     # cube_raw,
     # sql_raw,
     sql_simple_raw,
     file = "data/data.RData"
     )
