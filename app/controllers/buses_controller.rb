class BusesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_before_action :hardcode_json_format

  def index
    @user = User.new email: "<script>alert('Gotchya!');</script>"
    @buses = BusStop.page(params[:page])
  end
end
