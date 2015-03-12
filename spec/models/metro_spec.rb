require 'rails_helper'

describe Metro do
  # before :all
  before :each do
    Metro.sync_from_api!
    @lat, @long = 38.8539240, -77.0491380
  end

  it "can sync from the WMATA API" do
    expect(Metro.count).to eq 95
  end

  it "can find closest to a location" do
    near = Metro.closest_to(lat: @lat, long: @long).first
    expect(near.name).to eq "National Arpt"
    expect(near.distance_to @lat, @long).to be < 1.0
  end
end
