# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# Dataset Description
1. Weather Data:
   - Source: OpenWeather API
   - Fields: City Name, Temperature, Humidity, Weather Condition
   - URL: https://openweathermap.org/api

2. Country Data:
   - Source: REST Countries API
   - Fields: Country Name, Capital, Population, Currency
   - URL: https://restcountries.com/

# Dataset erd diagram
-----------------------------------
User (linked to Country, though its role isn't fully clear)
-----------------------------------
                  ^
                  |
                  |
            Many to Many
-----------------------------------
Country (stores country details)
-----------------------------------
                  ^
                  |
                  |
            one to Many
--------------------------------------
City (linked to Country, representing one-to-many relationship)
---------------------------------------
