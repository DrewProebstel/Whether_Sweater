class MapQuestFacade
  def self.find_geocode(location)
  	data = MapQuestService.get_geocode(location)
    data[:results][0][:locations][0][:latLng]
  end
end
