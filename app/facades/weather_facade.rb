class WeatherFacade
  def self.get_weather(geo)
  	weather_data = WeatherService.get_weather(geo[:lat], geo[:lng])
  	current_weather = CurrentWeather.new(weather_data[:current])
  	daily_weather = weather_data[:daily][1..5].map do |daily_data|
      DailyWeather.new(daily_data)
    end
  	hourly_weather = weather_data[:hourly][1..8].map do |hourly_data|
       HourlyWeather.new(hourly_data)
    end
  	{current_weather: current_weather, daily_weather: daily_weather, hourly_weather: hourly_weather}
  end
end
