class ImageFacade
  def self.find_image(city)
  	data = ImageService.get_background(city)
    Image.new(data)
  end
end
