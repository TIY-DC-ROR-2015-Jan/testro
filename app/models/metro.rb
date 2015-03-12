class Metro < ActiveRecord::Base
  include Concerns::Locatable

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
end
