require 'rails_helper'

RSpec.describe 'Roadtrip API' do
    it 'sends trip info' do
      VCR.use_cassette("road_request") do
      user = User.create!(email: 'drew3@drew.com', password: 'drew', password_confirmation: "drew", api_key: "aaaaa" )

      params =
      {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": user.api_key
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(200)
      trip_info = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(trip_info).to be_a(Hash)
      expect(trip_info[:type]).to eq('roadtrip')
      expect(trip_info[:attributes][:start_city]).to eq('Denver,CO')
      expect(trip_info[:attributes][:end_city]).to eq('Pueblo,CO')
      expect(trip_info[:attributes][:travel_time]).to eq('01h45m')
      expect(trip_info[:attributes][:weather_at_eta][:temperature]).to eq(94.1)
      expect(trip_info[:attributes][:weather_at_eta][:conditions]).to eq('clear sky')
    end
  end
end
