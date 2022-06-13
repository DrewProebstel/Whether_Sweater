require 'rails_helper'

RSpec.describe BookService do
  it 'returns data' do
    VCR.use_cassette("book_service") do
    	data = BookService.get_books("denver,co",5)
      binding.pry
      expect(data).to be_a(Hash)
    	expect(data[:numFound]).to be_a(Integer)
    	expect(data[:docs][0][:isbn]).to be_a(Array)
    	expect(data[:docs][0][:title]).to be_a(String)
    	expect(data[:docs][0][:publisher]).to be_a(Array)
    end
  end
end
