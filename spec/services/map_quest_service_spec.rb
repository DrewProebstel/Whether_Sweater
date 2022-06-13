require 'rails_helper'

RSpec.describe MapQuestService do
  it 'returns data' do
  	data = MapQuestService.get_geocode("denver,co")

  expect(data).to be_a(Hash)
	expect(data[:results][0][:locations][0][:latLng]).to be_a(Hash)
	expect(data[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
	expect(data[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
  end
end
