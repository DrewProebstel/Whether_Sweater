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
end
