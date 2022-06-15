class RoadTrip
  attr_reader :start_city, :end_city, :travel_time, :destination_geocode, :eta

  def initialize(road_trip, origin, destination)
    @start_city = origin
    @end_city = destination
    @travel_time = readable_time(road_trip[:route][:formattedTime])
    @destination_geocode = road_trip[:route][:boundingBox][:ul]
    @eta = hours_to_arrive(road_trip[:route][:formattedTime])
  end

  def readable_time(time)
    time = time[0..1] +'h' + time[3..4] + 'm'
  end

  def hours_to_arrive(time)
    # returns the hours to arrive. Rounds up if more than 30 min
    if time[3..4].to_i > 30
      return time[0..1].to_i + 1
    end
      return time[0..1].to_i
  end
end
