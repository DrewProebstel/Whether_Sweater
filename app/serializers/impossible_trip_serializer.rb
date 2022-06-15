class ImpossibleTripSerializer
  def self.format_impossible_trip(road_trip)
      {
        data: {
          id: nil,
          type: 'roadtrip',
          attributes: {
            start_city: road_trip.start_city,
            end_city: road_trip.end_city,
            travel_time: road_trip.travel_time,
          }
        }
      }
  end
end
