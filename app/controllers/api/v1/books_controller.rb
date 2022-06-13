class Api::V1::BooksController < ApplicationController
  def index
    geocode = MapQuestFacade.find_geocode(params[:location])
    weather_info = WeatherFacade.get_weather(geocode)
    books= BookFacade.find_books(params[:location], params[:quantity])

  	render json: BookSerializer.format_book(books,weather_info,params[:location]), status: :ok
  end
end
