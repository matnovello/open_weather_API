require "http"

response = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=brooklyn&appid=#{ENV["OPEN_WEATHER_API_KEY"]}&units=imperial")

#temperature min/max, description, wind speed, etc.
#temp
temp = response.parse["main"]["temp"]
#max temp
temp_min = response.parse["main"]["temp_min"]
#min temp
temp_max = response.parse["main"]["temp_max"]
#feels like
temp_feels = response.parse["main"]["feels_like"]
#description
description = response.parse["weather"][0]["description"]
#wind speed

while true
  puts "enter a city name for currentv weather conditions"
  input_city = gets.chomp

  if input_city == "q"
    puts "OK, you quit"
    break
  end

  response = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=#{input_city}&appid=#{ENV["OPEN_WEATHER_API_KEY"]}&units=imperial")

  puts "It's Currently #{temp} in #{input_city} with #{description}"
end
