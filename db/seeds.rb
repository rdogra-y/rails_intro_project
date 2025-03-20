require 'open-uri'
require 'json'
require 'faker'

puts "Seeding data..."

# API Key - Replace with your actual OpenWeather API key
openweather_api_key = "bd5e378503939ddaee76f12ad7a97608"

# Fetch country data from REST Countries API
countries_url = "https://restcountries.com/v3.1/all"
countries_json = URI.open(countries_url).read
countries = JSON.parse(countries_json)

countries.first(10).each do |c|
  # Fetch coordinates (latitude & longitude)
  latitude = c["latlng"]&.first
  longitude = c["latlng"]&.last

  country = Country.find_or_create_by(name: c["name"]["common"]) do |new_country|
    new_country.capital = c["capital"]&.first || "Unknown"
    new_country.population = c["population"]
    new_country.currency = c["currencies"]&.keys&.first
    new_country.latitude = latitude
    new_country.longitude = longitude
  end

  # Fetch weather data for the country using coordinates
  if latitude && longitude
    weather_url = "https://api.openweathermap.org/data/2.5/weather?lat=#{latitude}&lon=#{longitude}&appid=#{openweather_api_key}&units=metric"
  else
    # Fallback to city name if coordinates are missing
    city_name = country.capital || country.name
    weather_url = "https://api.openweathermap.org/data/2.5/weather?q=#{city_name}&appid=#{openweather_api_key}&units=metric"
  end

  begin
    weather_json = URI.open(weather_url).read
    weather = JSON.parse(weather_json)

    City.find_or_create_by(name: country.capital || country.name, country: country) do |new_city|
      new_city.temperature = weather["main"]["temp"]
      new_city.humidity = weather["main"]["humidity"]
      new_city.weather_condition = weather["weather"].first["description"]
      new_city.latitude = latitude
      new_city.longitude = longitude
    end
  rescue OpenURI::HTTPError
    puts "Weather data not found for #{country.name}, skipping..."
  end
end

# Generate 10 Fake Users
10.times do
User.create!(
  name: Faker::Name.name,
  email: Faker::Internet.email
)
end
puts "✅ 10 Fake Users Created!"
puts "Seeding complete!"
