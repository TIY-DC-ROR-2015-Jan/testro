class MetrosController < ApplicationController
  def index
    @metros = Metro.all
  end

  def favorite
    metro = Metro.find_by_code params[:station_code]
    current_user.add_favorite_metro metro
    head :ok
  end
end
