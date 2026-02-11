library(tidyverse)

this_year <- as.integer(format(Sys.Date(), "%Y"))

dates <- seq(
  from = as.Date(paste0(this_year - 1, "-10-01")),
  to   = as.Date(paste0(this_year, "-09-01")),
  by   = "1 month"
)

date_strings <- format(dates, "%m-%Y")

filenames <- glue::glue("FuelWatchRetail-{date_strings}.csv")

base_url <- "https://warsydprdstafuelwatch.blob.core.windows.net/historical-reports"

urls <- glue::glue(
  "{base_url}/FuelWatchRetail-{date_strings}.csv"
)

for (i in seq_along(urls)) {
  download.file(
    url = urls[i],
    destfile = filenames[i],
    mode = "wb"
  )
}
