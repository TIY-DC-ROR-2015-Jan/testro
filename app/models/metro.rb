class Metro < ActiveRecord::Base
  validates_presence_of :name, :code, :latitude, :longitude
  validates_uniqueness_of :code

  has_many :favorites
  has_many :users, through: :favorites
end
