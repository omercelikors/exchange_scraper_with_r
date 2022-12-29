# https://www.tcmb.gov.tr/kurlar/kurlar_tr.html (main link)
options(warn=-1)
install_packages_if_necessary <- function(packages) {
  
  # Install packages not yet installed
  installed_packages <- packages %in% rownames(installed.packages())
  if (any(installed_packages == FALSE)) {
    install.packages(packages[!installed_packages])
  }
  
  # Packages loading
  invisible(lapply(packages, library, character.only = TRUE))
}

is_date_check <- function(date, date_name) {
  if (is.na(date) ){
    str1 <- date_name
    str2 <- " is not valid."
    validation_text <- paste(str1,str2,sep="")
    stop(validation_text)
  } else {
    str1 <- date_name
    str2 <- " is valid."
    validation_text <- paste(str1,str2,sep="")
    print(validation_text)
  }
}

days_diff_check <- function(days_diff) {
  if (days_diff > 30 | days_diff < 0){
    validation_text <- "Validation error is occured. Day differences must 
                        not be greater than 30 or lower than 0."
    stop(validation_text)
  } else {
    validation_text <- "Date range is valid."
    print(validation_text)
  }
}

find_diff_of_dates <- function(start_date, end_date) {
  days_diff <- end_date - start_date
  return (days_diff)
}

convert_to_date <- function(date) {
  date <- as.Date(date, "%d.%m.%Y")
  return (date)
}

scrape_target_url <- function(date) {
  #install.packages("xml2")
  #install.packages("XML")
  
  #library(xml2)
  #library(XML)
  
  install_packages_if_necessary(c("xml2", "XML"))
 
  day <- format(date, format = "%d")
  month <- format(date, format = "%m")
  year <- format(date, format = "%Y")
  
  year_month <- paste(year, month, sep="")
  day_month_year <- paste(day, month, year, sep="")
  
  target_url <- sprintf("https://www.tcmb.gov.tr/kurlar/%s/%s.xml", year_month, 
                        day_month_year)
  
  tryCatch(
    {
    
      # Read the xml file.
      exchange_rates_data= read_xml(target_url)
      Sys.sleep(0.5)
    
      # Parse the exchange_rate_data into R structure representing XML tree.
      exchange_rates_xml <- xmlParse(exchange_rates_data)
    
      # Convert the parsed XML to a dataframe.
      exchange_rates <- xmlToDataFrame(nodes=getNodeSet(exchange_rates_xml, 
                                            "//Currency")) # Global variable.
      exchange_rates$Date <- format(date, "%d.%m.%Y")
     
      return (exchange_rates)
    
    }, warning = function(w) {
      
        print(paste("Warning text:", w, "Date:", date, sep=" "))
    
    }, error = function(e) {
        
        is_include <- grepl("404", e, fixed = TRUE)
    
        if (!is_include){
          exchange_rates <- NULL
          print(paste("Error text:", e, "Date:", format(date, "%d.%m.%Y"), sep=" "))
          return (exchange_rates)
        } else {
          return (404)
        }
    
    }
  )

}

get_exchange_rates_with_date_range <- function(start_date, end_date) {
  start_date <- convert_to_date(start_date)
  end_date <- convert_to_date(end_date)
  
  is_date_check(start_date, "Start date")
  is_date_check(end_date, "End date")
  
  days_diff <- find_diff_of_dates(start_date, end_date)
  days_diff_check(days_diff)
  
  result_exchange_rates <- data.frame()
  for (added_day in 0:days_diff) {
    exchange_rates <- scrape_target_url(start_date + added_day)
    
    if (is.null(exchange_rates)){
      print(paste("There is an error on date", 
                  format(start_date + added_day, "%d.%m.%Y"), sep=" "))
      next
    } else if (is.numeric(exchange_rates)) {
      
      print(paste("There is no data on date", 
                  format(start_date + added_day, "%d.%m.%Y"), sep=" "))
      next
      
    }
    result_exchange_rates <- rbind(result_exchange_rates, 
                                      exchange_rates)
  }
  
  # View(result_exchange_rates)
  return (result_exchange_rates)
}

get_exchange_rates_with_single_date <- function(date) {
  date <- convert_to_date(date)
  is_date_check(date, "Date")
  exchange_rates <- scrape_target_url(date)
  if (is.null(exchange_rates)){
    
    print(paste("There is an error on date", format(date, "%d.%m.%Y"), sep=" "))
    
  } else if (is.numeric(exchange_rates)) {
    
    print(paste("There is no data on date", format(date, "%d.%m.%Y"), sep=" "))
    
  } else {
    
    # View(exchange_rates)
    return (exchange_rates)
    
  }
}

result <- get_exchange_rates_with_date_range("01.12.2022", "29.12.2022")
#get_exchange_rates_with_single_date("5.12.2022")






 
