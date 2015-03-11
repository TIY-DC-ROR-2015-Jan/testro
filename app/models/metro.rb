class Metro < ActiveRecord::Base
  validates_presence_of :name, :code, :latitude, :longitude
end
