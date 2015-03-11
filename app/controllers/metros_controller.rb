class MetrosController < ApplicationController
  def index
    @metros = Metro.all
  end
end
