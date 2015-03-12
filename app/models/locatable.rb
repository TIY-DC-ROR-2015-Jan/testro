# Has a latitude and longitude
module Locatable
  def distance_to lat, long
    Haversine.distance(latitude, longitude, Float(lat), Float(long)).to_miles
  end
end
