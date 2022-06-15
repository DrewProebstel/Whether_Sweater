class WeatherFacade
  def self.get_weather(geo)
  	weather_data = WeatherService.get_weather(geo[:lat], geo[:lng])
  	current_weather = CurrentWeather.new(weather_data[:current])
  	daily_weather = weather_data[:daily][0..4].map do |daily_data|
      DailyWeather.new(daily_data)
    end
  	hourly_weather = weather_data[:hourly][0..7].map do |hourly_data|
       HourlyWeather.new(hourly_data)
    end
  	{current_weather: current_weather, daily_weather: daily_weather, hourly_weather: hourly_weather}
  end

  def self.get_weather_for_trip(geo)
    weather_data = WeatherService.get_weather(geo[:lat], geo[:lng])
    weather_data[:hourly].map do |hourly_data|
      HourlyWeather.new(hourly_data)
    end
  end
end
