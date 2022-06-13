require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'returns a hash of different type of weathers' do
    VCR.use_cassette("Image_facade") do
    	results = ImageFacade.find_image("denver,co")

    	expect(results).to be_an_instance_of(Image)
    	expect(results.author).to be_a(String)
    	expect(results.id).to be_a(String)
    	expect(results.image_url).to be_a(String)
    	expect(results.source).to be_a(String)
    end
  end
end
