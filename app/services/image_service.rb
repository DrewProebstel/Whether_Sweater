class ImageService
  def self.get_background(city)
  	  response = Faraday.get("https://api.unsplash.com/search") do |faraday|
  	  				faraday.params['client_id'] = ENV.fetch('image_api_key', nil)
  	  				faraday.params['query'] = city + " city"
  	  end
  	  test = JSON.parse(response.body, symbolize_names: true)
  end
end
