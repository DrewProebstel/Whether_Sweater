class MapQuestService
  def self.get_geocode(city)
  	  response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address") do |faraday|
				faraday.params['key'] = ENV.fetch('map_quest_api_key', nil)
				faraday.params['location'] = city
  	  end
  	  JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_route(json)
    response = Faraday.get("http://www.mapquestapi.com/directions/v2/optimizedroute?json=#{json}") do |faraday|
      faraday.params['key'] = ENV.fetch('map_quest_api_key', nil)
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
