\name{get_exchange_rates_with_single_date & get_exchange_rates_with_date_range}
\alias{exchangesScraper}
\title{Scraper for Exchange Rates}
\usage{
get_exchange_rates_with_single_date(date)
get_exchange_rates_with_date_range(start_date, end_date)
}
\description{
This package crawls exchange rates of Central Bank.
Package consists of two functions. One of them works single parameter with date,
other needs double parameters as start date and end date.
}
\examples{
\dontrun{
  Date range must be greater than zero and lower than 30.
  get_exchange_rates_with_date_range("01.01.2022", "29.12.2022")
  get_exchange_rates_with_date_range("01.12.2022", "29.10.2022")}

\dontrun{
  Format must be "DD.MM.YYYY".
  get_exchange_rates_with_single_date("05-12.2022")}

\dontrun{
  Format must be "DD.MM.YYYY".
  get_exchange_rates_with_date_range("01/12/2022", "29/12/2022")}

# Run:
  Format must be "DD.MM.YYYY".
  Date range must be greater than zero and lower than 30.
  get_exchange_rates_with_date_range("10.12.2022", "29.12.2022")
# End(Run)
}

\arguments{
\item{date}{Desc: Single date for obtaining exchanges, Type: String, Format: "DD.MM.YYYY"}

\item{start_date}{Desc: Start of date range for obtaining exchanges, Type: String, Format: "DD.MM.YYYY"}

\item{end_date}{Desc: End of date range for obtaining exchanges, Type: String, Format: "DD.MM.YYYY"}
}

\value{
Package returns data frame from both two functions.
}

\details{
Request delay is 1 second after each request.
}
