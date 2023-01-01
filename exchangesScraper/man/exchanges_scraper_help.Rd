\name{get_exchange_rates_with_single_date & get_exchange_rates_with_date_range}
\alias{exchangesScraper}
\title{Scraper for Exchange Rates}
\usage{
\strong{get_exchange_rates_with_single_date(date)}
\strong{get_exchange_rates_with_date_range(start_date, end_date)}
}
\description{
This package currently crawls exchange rates of Turkish Central Bank.
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
* If you request a date belonging to holiday, there is no data on site.\cr
* Request delay is 1 second after each request.\cr
* This package will be expanded by including central bank exchange rates of other countries.\cr
* Current main link is \strong{"https://www.tcmb.gov.tr/kurlar/kurlar_tr.html"}.\cr
}
