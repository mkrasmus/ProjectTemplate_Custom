workflow
================

Project processing scripts in the workflow directory are automatically executed 
by `ProjectTemplate::load.project(munging = TRUE)`.

Scripts in the workflow directory are executed sequentially; script files should
be numbered.

Default files are:

  - _00-import.R_ - Import data from various data sources
  - _01-prepare.R_ - Data wrangling, applying calculations and joining data from different sources
  - _02-model.R_ - R code for performing statistical analysis
  - _03-report.R_ - R code for reporting results, using rmarkdown or quarto

`ProjectTemplate::cache("var_name")` would be used to store the resulting data
in the _cache_ directory.
