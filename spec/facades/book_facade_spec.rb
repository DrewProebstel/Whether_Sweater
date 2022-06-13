require 'rails_helper'

RSpec.describe BookFacade do
  it 'returns a hash of book information' do
    VCR.use_cassette("book_facade") do
    	results = BookFacade.get_books("denver,co")

    	expect(results).to be_a(Hash)
    	expect(results[0]).to be_an_instance_of(Book)
    	expect(results[0].isbn).to eq(["9780762507849","0762507845"])
    	expect(results[0].title).to eq("Denver, Co")
    	expect(results[0].publisher).to eq(["Universal Map Enterprises"])

    end
  end
end
