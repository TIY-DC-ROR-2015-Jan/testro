class MetrosController < ApplicationController
  def index
    @metros = Metro.all
  end

  def favorite
    metro = Metro.find_by_code params[:code]
    current_user.add_favorite_station metro
    head :ok
  end
end
