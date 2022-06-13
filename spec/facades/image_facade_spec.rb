require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'returns a hash of different type of weathers' do
    VCR.use_cassette("Image_facade") do
    	results = ImageFacade.find_image("denver,co")

    	expect(results).to be_an_instance_of(Image)
    	expect(results.author).to eq("Vine Ramazani")
    	expect(results.id).to eq("s1Ki521ZcP0")
    	expect(results.image_url).to eq("https://images.unsplash.com/photo-1584214125984-136f851428b9?ixid=MnwzMzczNDB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjbyUyMGNpdHl8ZW58MHx8fHwxNjU1MDkxNDc1&ixlib=rb-1.2.1")
    	expect(results.source).to eq("https://www.vineramazani.com/entry")
    end
  end
end
