class MetrosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @metros = Metro.all
  end

  def favorite
    metro = Metro.where(code: params[:station_code]).first!
    current_user.add_favorite_metro metro
    head :ok
  end

  def favorites
    @metros = current_user.favorite_metros
    render :index
  end
end
