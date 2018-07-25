library("bigrquery")
project <- "analytics-db-owners" # put your project ID here
sql <- "SELECT * FROM [analytics-db-owners:Data_Warehouse.cube_session] LIMIT 1000"
todo_copies <- query_exec(sql, project = project, useLegacySql = TRUE)

file.edit('~/.Renviron')
set_service_token("token2.json")

library(curl)
ie_get_proxy_for_url()
Sys.setenv(http_proxy = "asusproxy.ascorp.com:80")
Sys.setenv(https_proxy = "asusproxy.ascorp.com:80")
