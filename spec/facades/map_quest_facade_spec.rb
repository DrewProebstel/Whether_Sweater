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

  it 'returns route data' do
    json_response = File.read('spec/fixtures/route_return.json')
    stub_request(:get, "http://www.mapquestapi.com/directions/v2/optimizedroute?json={ locations: ['portland,or', 'weed,ca'] }").to_return(status: 200, body: json_response)
    # allow(MapQuestService).to receive(:get_route).and_return(data)

    trip = MapQuestFacade.get_route('portland,or', 'weed,ca')

    expect(trip).to be_a(Trip)
    expect(trip.start_city).to eq('denver,co')
    expect(trip.end_city).to eq('los angeles,ca')
    expect(trip.travel_time).to eq('40 hours, 16 minutes')
    expect(trip.destination_geocode).to eq({ lat: 41.596916, lng: -118.244469 })
  end
end
