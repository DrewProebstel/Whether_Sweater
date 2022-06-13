class WeatherSerializer
  def self.format_weather(data)

  	{
  	   data: {
           id: nil,
         type: 'forecast',
   attributes: {
          current_weather: {
               datetime: data[:current_weather].datetime,
                sunrise: data[:current_weather].sunrise,
                 sunset: data[:current_weather].sunset,
            temperature: data[:current_weather].temperature,
             feels_like: data[:current_weather].feels_like,
               humidity: data[:current_weather].humidity,
                    uvi: data[:current_weather].uvi,
             visibility: data[:current_weather].visibility,
             conditions: data[:current_weather].conditions,
                   icon: data[:current_weather].icon
                            },
            daily_weather:
              data[:daily_weather].map do |weather|
                  {
                   date: weather.date,
                sunrise: weather.sunrise,
                 sunset: weather.sunset,
               max_temp: weather.max_temp,
               min_temp: weather.min_temp,
             conditions: weather.conditions,
                   icon: weather.icon
                  }
                end,
            hourly_weather:
              data[:hourly_weather].map do |weather|
                  {
                    time: weather.time,
             temperature: weather.temperature,
              conditions: weather.conditions,
                    icon: weather.icon
                  }
                end
  	           }
            }
    }
  end
end
