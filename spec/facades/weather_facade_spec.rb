require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'returns a hash of different type of weathers' do
    VCR.use_cassette("weather_facade") do
    	results = WeatherFacade.get_weather({lat: 10, lng:10})

    	expect(results).to be_a(Hash)
    	expect(results[:current_weather]).to be_an_instance_of(CurrentWeather)
    	expect(results[:current_weather].conditions).to eq('broken clouds')

    	expect(results[:daily_weather][0]).to be_an_instance_of(DailyWeather)
    	expect(results[:daily_weather].length).to eq(5)
    	expect(results[:daily_weather][0].date).to eq('2022-06-14 04:00:00 -0700,')

      expect(results[:hourly_weather][0]).to be_an_instance_of(HourlyWeather)
      expect(results[:hourly_weather].count).to eq(8)
      expect(results[:hourly_weather][0].time).to be_a(String)
    end
  end
end
