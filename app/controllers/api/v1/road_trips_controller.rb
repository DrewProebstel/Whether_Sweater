class Api::V1::RoadTripsController < ApplicationController
  def index
    if User.find_by(api_key: params[:api_key])
      road_trip_data = MapQuestFacade.find_route(params[:origin], params[:destination])
      geocode = MapQuestFacade.find_geocode(params[:destination])
      weather_data = WeatherFacade.get_weather_for_trip(geocode)
      if road_trip_data.travel_time == "impossible"
        render json: ImpossibleTripSerializer.format_impossible_trip(road_trip_data, weather_data), status: :ok
      else
        render json: RoadTripSerializer.format_road_trip(road_trip_data, weather_data), status: :ok
      end
    else
      render json: {error: "Unacceptable Authorization"}, status: 401
    end
  end
end
