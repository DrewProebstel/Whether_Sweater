class Api::V1::ImagesController < ApplicationController
  def index
  	image_data = ImageFacade.find_image(params[:location])
  	render json: ImageSerializer.format_image(image_data), status: :ok
  end
end
