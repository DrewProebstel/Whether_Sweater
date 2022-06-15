require 'rails_helper'

RSpec.describe MapQuestFacade do
  it 'returns a longitude and latitude' do
    VCR.use_cassette("map_quest_facade") do
    	results = MapQuestFacade.find_geocode("portland,or")

    	expect(results).to be_a(Hash)
      expect(results[:lat]).to eq(45.516018)
      expect(results[:lng]).to eq(-122.681425)
    end
  end

  it 'returns route data for a doable drive' do
    VCR.use_cassette("map_quest_facade_route") do
      json_response = File.read('spec/fixtures/route_return.json')
      stub_request(:get, "http://www.mapquestapi.com/directions/v2/optimizedroute?json={ locations: ['portland,or', 'weed,ca'] }").to_return(status: 200, body: json_response)

      results = MapQuestFacade.find_route('portland,or', 'weed,ca')

      expect(results.travel_time).to eq("05h35m")
      expect(results.eta).to eq(6)
      expect(results.start_city).to eq("portland,or")
      expect(results.end_city).to eq("weed,ca")
    end
  end
  it 'returns bad data for an impossible drive' do
    VCR.use_cassette("map_quest_facade_route_hawaiis") do
      json_response = File.read('spec/fixtures/hawaii_route.json')
      stub_request(:get, "http://www.mapquestapi.com/directions/v2/optimizedroute?json={ locations: ['portland,or', 'honolulu,hi'] }").to_return(status: 200, body: json_response)

      results = MapQuestFacade.find_route('portland,or', 'honolulu,hi')

      expect(results.start_city).to eq("portland,or")
      expect(results.end_city).to eq("honolulu,hi")
      expect(results.travel_time).to eq("impossible")

    end
  end
end
