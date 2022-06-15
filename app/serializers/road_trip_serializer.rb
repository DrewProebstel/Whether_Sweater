class RoadTripSerializer
  def self.format_road_trip(road_trip, weather)
      {
        data: {
          id: nil,
          type: 'roadtrip',
          attributes: {
            start_city: road_trip.start_city,
            end_city: road_trip.end_city,
            travel_time: road_trip.travel_time,
            weather_at_eta: {
              temperature: weather[road_trip.eta - 1].temperature,
              conditions: weather[road_trip.eta - 1].conditions
            }
          }
        }
      }
  end
end
