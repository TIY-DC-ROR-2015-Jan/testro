class BusesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_before_action :hardcode_json_format

  def index
    # @user = User.new email: "<script>alert('Gotchya!');</script>"
    @buses = if params[:favorites]
      current_user.bus_stops.page(params[:page])
    else
      BusStop.page(params[:page])
    end
    @favorites = current_user.bus_stops.pluck :id
  end

  def favorite
    stop = BusStop.find params[:id]
    FavoriteBusStop.
      where(user: current_user, bus_stop: stop).
      first_or_create!
    redirect_to :back, success: "Favorite saved"
  end

  def unfavorite
    current_user.
      favorite_bus_stops.
      where(bus_stop_id: params[:id]).
      delete_all
    redirect_to :back, danger: "Favorite deleted"
  end
end
