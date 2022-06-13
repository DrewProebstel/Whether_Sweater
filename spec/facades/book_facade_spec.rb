require 'rails_helper'

RSpec.describe BookFacade do
  it 'returns an array of books information' do
    VCR.use_cassette("book_facade") do
    	results = BookFacade.find_books("denver,co", 5)

    	expect(results).to be_a(Array)
    	expect(results.length).to eq(5)
    	expect(results[0]).to be_an_instance_of(Book)
    	expect(results[0].isbn).to eq(["9780762507849","0762507845"])
    	expect(results[0].title).to eq("Denver, Co")
    	expect(results[0].publisher).to eq(["Universal Map Enterprises"])

    end
  end
end
