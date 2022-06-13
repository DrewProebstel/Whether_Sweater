require 'rails_helper'

RSpec.describe BookService do
  it 'returns data' do
    VCR.use_cassette("book_service") do
    	data = BookService.get_books("denver,co")

      expect(data).to be_a(Hash)
    	expect(data[:numfound]).to be_a(Integer)
    	expect(data[:docs][0][:isbn][0]).to be_a(Integer)
    	expect(data[:docs][0][:title]).to be_a(String)
    	expect(data[:docs][0][:publisher][0]).to be_a(String)
    end
  end
end
