require 'rails_helper'

RSpec.describe MapQuestService do
  it 'returns data on geocode' do
    VCR.use_cassette("map_quest_service") do
    	data = MapQuestService.get_geocode("denver,co")

      expect(data).to be_a(Hash)
    	expect(data[:results][0][:locations][0][:latLng]).to be_a(Hash)
    	expect(data[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
    	expect(data[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
    end
  end

  it 'returns route data' do
    VCR.use_cassette("map_quest_service_routes") do
      json = { locations: ['portland,or', 'weed,ca'] }.to_json
      data = MapQuestService.get_route(json)

      expect(data).to be_a(Hash)
      expect(data[:route]).to be_a(Hash)
      expect(data[:route][:boundingBox]).to be_a(Hash)
      expect(data[:route][:boundingBox]).to be_a(Hash)
      expect(data[:route][:boundingBox][:ul][:lng]).to be_a(Float)

    end
  end
end
