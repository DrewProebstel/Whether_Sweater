class Api::V1::WeatherController < ApplicationController
  def index
    geocode = MapQuestFacade.find_geocode(params[:location])
    test = weather_info = WeatherFacade.get_weather(geocode)
    render json: WeatherSerializer.format_weather(weather_info), status: :ok
  end
end
