class BikeStation
  attr_reader :bike_share_id, :location, :available, :open

  def self.closest_to opts={}
    lat, long = opts.fetch(:lat), opts.fetch(:long)
    limit  = opts[:limit] || 50
    radius = opts[:radius] || Float::INFINITY
    BikeStation.all.
      sort_by { |s| s.distance_to lat, long }.
      first(limit).
      select { |s| s.distance_to(lat, long) < radius }
  end

  def self.all
    BikeShare.stations.map { |api_data| BikeStation.new api_data }
  end

  def initialize api_data
    @bike_share_id = api_data.fetch("id")
    @location      = api_data.fetch("name")

    @available = Integer api_data.fetch("nbBikes")
    @open      = Integer api_data.fetch("nbEmptyDocks")

    @lat  = Float api_data.fetch("lat")
    @long = Float api_data.fetch("long")
  end

  def distance_to lat, long
    Haversine.distance(@lat, @long, Float(lat), Float(long)).to_miles
  end
end
