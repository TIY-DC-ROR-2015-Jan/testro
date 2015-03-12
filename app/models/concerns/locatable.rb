# Has class#all and instance #latitude and #longitude
module Concerns::Locatable
  extend ActiveSupport::Concern

  class_methods do
    def closest_to opts={}
      lat, long = opts.fetch(:lat), opts.fetch(:long)
      limit  = opts[:limit] || 50
      radius = opts[:radius] || Float::INFINITY
      all.
        sort_by { |s| s.distance_to lat, long }.
        first(limit).
        select { |s| s.distance_to(lat, long) < radius }
    end
  end

  def distance_to lat, long
    Haversine.distance(latitude, longitude, Float(lat), Float(long)).to_miles
  end
end
