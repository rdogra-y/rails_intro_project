require 'open-uri'
require 'json'
require 'faker'

puts "Seeding data..."

# API Key - Replace with your actual OpenWeather API key
openweather_api_key = "YOUR_VALID_OPENWEATHER_API_KEY"

# Fetch country data from REST Countries API
countries_url = "https://restcountries.com/v3.1/all"
countries_json = URI.open(countries_url).read
countries = JSON.parse(countries_json)

countries.first(10).each do |c|
  country = Country.find_or_create_by(name: c["name"]["common"]) do |new_country|
    new_country.capital = c["capital"]&.first || "Unknown"
    new_country.population = c["population"]
    new_country.currency = c["currencies"]&.keys&.first
  end

  # Fetch weather data for capital city (or fallback to country name)
  city_name = country.capital || country.name
  weather_url = "https://api.openweathermap.org/data/2.5/weather?q=#{city_name}&appid=#{openweather_api_key}&units=metric"

  begin
    weather_json = URI.open(weather_url).read
    weather = JSON.parse(weather_json)

    City.find_or_create_by(name: city_name, country: country) do |new_city|
      new_city.temperature = weather["main"]["temp"]
      new_city.humidity = weather["main"]["humidity"]
      new_city.weather_condition = weather["weather"].first["description"]
    end
  rescue OpenURI::HTTPError
    puts "Weather data not found for #{city_name}, skipping..."
  end
end

puts "Seeding complete!"
