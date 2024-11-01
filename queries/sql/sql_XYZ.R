# --
# -- -------------
# -- Example Query
# -- -------------
# --


drop_temp_tables <- glue_sql("
                        If OBJECT_ID ('tempdb..#XYZ_123') is not null Begin drop table #XYZ_123; end;
                        If OBJECT_ID ('tempdb..#XYZ_1234') is not null Begin drop table #XYZ_1234; end;
                        "
                             , .con = con)

### SQL TABLES :- 
temp_table_XYZ_123 <- glue_sql("
                      SELECT *
                    	INTO #XYZ_123
                    	FROM [DB].[SCHEMA].[Example_XYZ_123]"
                               , .con = con)

temp_table_XYZ_1234 <- glue_sql("
                      SELECT *
                    	INTO #XYZ_1234
                    	FROM [DB].[SCHEMA].[Example_XYZ_1234]"
                                , .con = con)


import_result <- glue_sql("
                          SELECT * FROM #XYZ_123 X123
                    					  INNER JOIN #XYZ_1234 X1234 ON X123.[EXAMPLE_ID] = X1234.[EXAMPLE_ID]
                            		"
                          , .con = con)



## Execute queries and import dataset
dbExecute(con, drop_temp_tables, immediate = TRUE)

dbExecute(con, temp_table_XYZ_123, immediate = TRUE)

dbExecute(con, temp_table_XYZ_1234, immediate = TRUE)

###Final dataset to save
query <- DBI::dbSendQuery(con, import_result)
data <- DBI::dbFetch(query)
DBI::dbClearResult(query)
