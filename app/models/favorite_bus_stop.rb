class FavoriteBusStop < ActiveRecord::Base
  belongs_to :user
  belongs_to :bus_stop
end
