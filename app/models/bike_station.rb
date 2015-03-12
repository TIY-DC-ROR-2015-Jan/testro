class BikeStation
  attr_reader :bike_share_id, :location, :available, :open

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

  include Concerns::Locatable
  def latitude;  @lat;  end
  def longitude; @long; end
end
