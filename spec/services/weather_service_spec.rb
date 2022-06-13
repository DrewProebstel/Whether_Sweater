require 'rails_helper'

RSpec.describe WeatherService, :vcr do
  it 'returns data' do
    VCR.use_cassette("weather_service") do
  	  data = WeatherService.get_weather(10.0000, 10.0000)

    	expect(data).to be_a(Hash)

    	expect(data[:current]).to be_a(Hash)
    	expect(data[:current][:dt]).to be_an(Integer)
    	expect(data[:current][:sunrise]).to be_an(Integer)
    	expect(data[:current][:sunset]).to be_an(Integer)
    	expect(data[:current][:temp]).to be_a(Float)
    	expect(data[:current][:feels_like]).to be_a(Float)
    	expect(data[:current][:humidity]).to be_an(Integer)
    	expect(data[:current][:visibility]).to be_an(Integer)
    	expect(data[:current][:uvi]).to be_a(Integer)
    	expect(data[:current][:weather]).to be_an(Array)
    	expect(data[:current][:weather][0]).to be_a(Hash)
    	expect(data[:current][:weather][0][:description]).to be_a(String)
    	expect(data[:current][:weather][0][:icon]).to be_a(String)

    	expect(data[:daily]).to be_an(Array)
    	expect(data[:daily][0][:dt]).to be_an(Integer)
    	expect(data[:daily][0][:sunrise]).to be_an(Integer)
    	expect(data[:daily][0][:sunset]).to be_an(Integer)
    	expect(data[:daily][0][:temp]).to be_a(Hash)
    	expect(data[:daily][0][:temp][:max]).to be_a(Float)
    	expect(data[:daily][0][:temp][:min]).to be_a(Float)
    	expect(data[:daily][0][:weather]).to be_an(Array)
    	expect(data[:daily][0][:weather][0]).to be_a(Hash)
    	expect(data[:daily][0][:weather][0][:description]).to be_a(String)
    	expect(data[:daily][0][:weather][0][:icon]).to be_a(String)

    	expect(data[:hourly]).to be_an(Array)
    	expect(data[:hourly][0][:dt]).to be_an(Integer)
    	expect(data[:hourly][0][:temp]).to be_an(Float)
    	expect(data[:hourly][0][:weather][0]).to be_a(Hash)
    	expect(data[:hourly][0][:weather][0][:description]).to be_a(String)
    	expect(data[:hourly][0][:weather][0][:icon]).to be_a(String)
    end
  end
end
