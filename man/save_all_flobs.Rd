% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/save.R
\name{save_all_flobs}
\alias{save_all_flobs}
\title{Save all flobs.}
\usage{
save_all_flobs(table_name = NULL, conn, dir = ".", sep = "_-_")
}
\arguments{
\item{table_name}{A vector of character strings indicating names of tables to save flobs from.
By default all tables are included.}

\item{conn}{A SQLite connection object.}

\item{dir}{A character string of the path to the directory to save files to.}

\item{sep}{A string of the separator used to construct file names from values.}
}
\value{
An invisible named list of named vectors of the file names and new file names saved.
}
\description{
Rename \code{\link[flobr]{flob}}s from a SQLite database and save to directory.
}
\examples{
flob <- flobr::flob_obj
conn <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
DBI::dbGetQuery(conn, "CREATE TABLE Table1 (IntColumn INTEGER PRIMARY KEY NOT NULL)")
DBI::dbWriteTable(conn, "Table1", data.frame(IntColumn = c(1L, 2L)), append = TRUE)
key <- data.frame(IntColumn = 2L)
write_flob(flob, "BlobColumn", "Table1", key, conn, exists = FALSE)
dir <- tempdir()
save_all_flobs(conn = conn, dir = dir)
DBI::dbDisconnect(conn)
}
