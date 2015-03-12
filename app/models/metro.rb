class Metro < ActiveRecord::Base
  include Locatable

  validates_presence_of :name, :code, :latitude, :longitude
  validates_uniqueness_of :code

  has_many :favorites
  has_many :users, through: :favorites

  def self.sync_from_api!
    MetroApi.trains.each do |t|
      Metro.where(code: t["Code"]).first_or_create! do |m|
        m.name      = t["Name"]
        m.latitude  = t["Lat"]
        m.longitude = t["Lon"]
      end
    end
  end

  def self.closest_to opts={}
    lat, long = opts.fetch(:lat), opts.fetch(:long)
    limit  = opts[:limit] || 50
    radius = opts[:radius] || Float::INFINITY
    self.all.
      sort_by { |s| s.distance_to lat, long }.
      first(limit).
      select { |s| s.distance_to(lat, long) < radius }
  end
end
