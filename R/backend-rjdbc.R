#' Backend: JDBCConnection
#'
#' @description
#' See `vignette("translation-function")` and `vignette("translation-verb")` for
#' details of overall translation technology. Key differences for this backend
#' are:
#'
#' * Use `FETCH FIRST` instead of `LIMIT`
#' * Custom types
#' * `paste()` uses `||`
#' * Custom subquery generation (no `AS`)
#' * `setdiff()` uses `MINUS` instead of `EXCEPT`
#'
#' Use `simulate_JDBCConnection()` with `lazy_frame()` to see simulated SQL without
#' converting to live access database.
#'
#' @name backend-JDBCConnection
#' @aliases NULL
#' @examples
#' library(dplyr, warn.conflicts = FALSE)
#'
#' lf <- lazy_frame(a = TRUE, b = 1, c = 2, d = "z", con = simulate_JDBCConnection())
#' lf %>% transmute(x = paste0(c, " times"))
#' lf %>% setdiff(lf)
NULL

#' @export
#' @rdname backend-JDBCConnection
simulate_JDBCConnection <- function() simulate_dbi("JDBCConnection")


# roacle package ----------------------------------------------------------
#' @export
dbplyr_edition.JDBCConnection <- dbplyr_edition.Oracle

#' @export
sql_query_select.JDBCConnection <- sql_query_select.Oracle

#' @export
sql_query_upsert.JDBCConnection <- sql_query_upsert.Oracle

#' @export
sql_translation.JDBCConnection <- sql_translation.Oracle

#' @export
sql_query_explain.JDBCConnection <- sql_query_explain.Oracle

#' @export
sql_table_analyze.JDBCConnection <- sql_table_analyze.Oracle

#' @export
sql_query_save.JDBCConnection <- sql_query_save.Oracle

#' @export
sql_values_subquery.JDBCConnection <- sql_values_subquery.Oracle

# registered onLoad located in the zzz.R script
setdiff.JDBCConnection <- setdiff.tbl_Oracle

#' @export
sql_expr_matches.JDBCConnection <- sql_expr_matches.Oracle

#' @export
db_supports_table_alias_with_as.JDBCConnection <- db_supports_table_alias_with_as.Oracle

utils::globalVariables(c("DATE", "CURRENT_TIMESTAMP", "TRUNC", "dbms_random.VALUE"))
