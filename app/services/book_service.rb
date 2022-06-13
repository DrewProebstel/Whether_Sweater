class BookService
  def self.get_books(city,limit)
  	  response = Faraday.get("http://openlibrary.org/search.json") do |faraday|
  	  				faraday.params['q'] = city
  	  				faraday.params['limit'] = limit
  	  end
  	  JSON.parse(response.body, symbolize_names: true)
  end
end
