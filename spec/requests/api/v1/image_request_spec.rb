require 'rails_helper'

describe "Image API" do
  it "sends a picture" do
    VCR.use_cassette("image_request") do

      get '/api/v1/backgrounds?location=denver,co'

      image_info = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(image_info[:type]).to eq("image")
      expect(image_info[:attributes][:image][:image_url]).to eq("https://images.unsplash.com/photo-1584214125984-136f851428b9?ixid=MnwzMzczNDB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjbyUyMGNpdHl8ZW58MHx8fHwxNjU1MDkxNDc1&ixlib=rb-1.2.1")
      expect(image_info[:attributes][:image][:credit][:source]).to eq("https://www.vineramazani.com/entry")
      expect(image_info[:attributes][:image][:credit][:author]).to eq("Vine Ramazani")
    end
  end
end
