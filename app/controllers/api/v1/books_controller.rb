class Api::V1::BooksController < ApplicationController
  def index
    geocode = MapQuestFacade.find_geocode(params[:location])
    weather_info = WeatherFacade.get_weather(geocode)
    book_info= BookFacade.find_books(params[:location], parmas[:quantity])
  	render json: BookSerializer.format_image(image_data), status: :ok
  end
end
