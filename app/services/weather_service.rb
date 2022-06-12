class WeatherService

  def self.conn
    Faraday.new('https://www.dnd5eapi.co')
  end
end
