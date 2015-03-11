class BusStop < ActiveRecord::Base
  validates_presence_of :name, :stop_id, :latitude, :longitude
  validates_uniqueness_of :stop_id

  def self.sync_from_api!
    MetroApi.buses.each do |t|
      BusStop.where(stop_id: t["StopID"]).first_or_create! do |m|
        m.name      = t["Name"]
        m.latitude  = t["Lat"]
        m.longitude = t["Lon"]
      end
    end
  end
end
