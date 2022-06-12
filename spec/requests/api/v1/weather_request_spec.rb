require 'rails_helper'

describe "Weather API" do
  it "sends the weather for a city" do
    # create_list(:weather, 1)

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end
end
