class Image
attr_reader :id, :image_url, :source, :author
  def initialize(data)
  	@id = data[:photos][:results][0][:id]
  	@image_url = data[:photos][:results][0][:urls][:raw]
  	@author = data[:photos][:results][0][:user][:name]
  	@source = data[:photos][:results][0][:user][:portfolio_url]
  end
end
