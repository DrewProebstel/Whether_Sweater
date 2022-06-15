require 'rails_helper'

describe "Weather API" do
  it "sends the weather for a city" do
    VCR.use_cassette("weather_request2") do
    get '/api/v1/forecast?location=denver,co'
    image_info = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(image_info[:type]).to eq("forecast")
    expect(image_info[:attributes][:current_weather][:temperature]).to eq(55.72)
    expect(image_info[:attributes][:daily_weather][3][:min_temp]).to eq(68.34)
    expect(image_info[:attributes][:hourly_weather][2][:conditions]).to eq("clear sky")
    expect(image_info[:attributes][:hourly_weather].length).to eq(8)
    expect(image_info[:attributes][:daily_weather].length).to eq(5)
    end
  end
end
