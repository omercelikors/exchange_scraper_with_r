install.packages("exchangesScraper")
library(exchangesScraper)

# https://www.tcmb.gov.tr/kurlar/kurlar_tr.html

# As a date
# normal date
result1 <- get_exchange_rates_with_single_date("05.12.2022")
# date of holiday
result1 <- get_exchange_rates_with_single_date("04.12.2022")
# invalidated date format
result1 <- get_exchange_rates_with_single_date("05/12/2022")



# As a date range
# normal date range
result2 <- get_exchange_rates_with_date_range("27.12.2022", "29.12.2022")
# bigger than 30 days
result2 <- get_exchange_rates_with_date_range("27.10.2022", "29.12.2022")
# lower than 0 day
result2 <- get_exchange_rates_with_date_range("27.12.2022", "29.10.2022")
# invalidated date format
result2 <- get_exchange_rates_with_date_range("27-12-2022", "29.10.2022")
