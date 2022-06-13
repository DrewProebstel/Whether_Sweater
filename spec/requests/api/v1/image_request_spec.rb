require 'rails_helper'

describe "Image API" do
  it "sends a picture" do
    VCR.use_cassette("image_request") do

    get '/api/v1/backgrounds?location=denver,co'
    expect(response).to be_successful
    end
  end
end
