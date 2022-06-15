class MapQuestFacade
  def self.find_geocode(location)
  	data = MapQuestService.get_geocode(location)
    data[:results][0][:locations][0][:latLng]
  end

  def self.find_route(origin, destination)
    cities = {locations: [origin, destination]}.to_json
    road_trip = MapQuestService.get_route(cities)
    RoadTrip.new(road_trip, origin, destination)
  end
end
