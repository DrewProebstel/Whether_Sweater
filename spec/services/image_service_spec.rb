require 'rails_helper'

RSpec.describe ImageService do
  it 'returns data' do
    VCR.use_cassette("image_service") do
    	data = ImageService.get_background("denver,co")

      expect(data).to be_a(Hash)
    	expect(data[:photos][:results][0]).to be_a(Hash)
    	expect(data[:photos][:results][0][:id]).to be_a(String)
    	expect(data[:photos][:results][0][:urls][:raw]).to be_a(String)
    	expect(data[:photos][:results][0][:user][:name]).to be_a(String)
    	expect(data[:photos][:results][0][:user][:portfolio_url]).to be_a(String)

    end
  end
end
