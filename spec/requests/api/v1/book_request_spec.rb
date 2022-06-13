require 'rails_helper'

describe "Book API" do
  it "sends book info" do
    VCR.use_cassette("book_request2") do

    get '/api/v1/book-search?location=denver,co&quantity=5'
    expect(response).to be_successful
    end
  end
end
