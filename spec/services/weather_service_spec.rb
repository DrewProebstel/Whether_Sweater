require 'rails_helper'

RSpec.describe WeatherService do
  it 'returns data' do
  	data = WeatherService.get_weather(10.0000, 10.0000)

	expect(data).to be_a(Hash)

	expect(data[:current_weather]).to be_a(Hash)
	expect(data[:current_weather][:dt]).to be_an(Integer)
	expect(data[:current_weather][:sunrise]).to be_an(Integer)
	expect(data[:current_weather][:sunset]).to be_an(Integer)
	expect(data[:current_weather][:temp]).to be_a(Float)
	expect(data[:current_weather][:feels_like]).to be_a(Float)
	expect(data[:current_weather][:humidity]).to be_an(Integer)
	expect(data[:current_weather][:visibility]).to be_an(Integer)
	expect(data[:current_weather][:uvi]).to be_a(Float)
	expect(data[:current_weather][:weather]).to be_an(Array)
	expect(data[:current_weather][:weather][0]).to be_a(Hash)
	expect(data[:current_weather][:weather][0][:description]).to be_a(String)
	expect(data[:current_weather][:weather][0][:icon]).to be_a(String)

	expect(data[:daily_weather]).to be_an(Array)
	expect(data[:daily_weather][0][:dt]).to be_an(Integer)
	expect(data[:daily_weather][0][:sunrise]).to be_an(Integer)
	expect(data[:daily_weather][0][:sunset]).to be_an(Integer)
	expect(data[:daily_weather][0][:temp]).to be_a(Hash)
	expect(data[:daily_weather][0][:temp][:max]).to be_a(Float)
	expect(data[:daily_weather][0][:temp][:min]).to be_a(Float)
	expect(data[:daily_weather][0][:weather]).to be_an(Array)
	expect(data[:daily_weather][0][:weather][0]).to be_a(Hash)
	expect(data[:daily_weather][0][:weather][0][:description]).to be_a(String)
	expect(data[:daily_weather][0][:weather][0][:icon]).to be_a(String)

	expect(data[:hourly_weather]).to be_an(Array)
	expect(data[:hourly_weather][0][:dt]).to be_an(Integer)
	expect(data[:hourly_weather][0][:temp]).to be_an(Float)
	expect(data[:hourly_weather][0][:weather][0]).to be_a(Hash)
	expect(data[:hourly_weather][0][:weather][0][:description]).to be_a(String)
	expect(data[:hourly_weather][0][:weather][0][:icon]).to be_a(String)
  end
end
