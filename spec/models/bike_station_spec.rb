require 'rails_helper'

describe BikeStation do
  before :each do
    @lat, @long = 38.8539240, -77.0491380
  end

  it "knows its distance to a point" do
    station = BikeStation.new(
      "id"           => "",
      "name"         => "",
      "nbBikes"      => 0,
      "nbEmptyDocks" => 0,
      "lat"          => 38,
      "long"         => -77
    )
    expect(station.distance_to 39, -76).to be < 100
    expect(station.distance_to 38, -76).to be < station.distance_to(39, -76)
    expect(station.distance_to 38, -77).to be < 1
  end

  it "can look up by geo location" do
    near = BikeStation.closest_to lat: @lat, long: @long, limit: 25
    nearest = near.first

    expect(near.count).to eq 25
    expect(nearest.location).to eq "23rd & Crystal Dr"
    expect(nearest.available).to be >= 0
    expect(nearest.open).to be >= 0
  end

  it "can limit hits by radius" do
    near = BikeStation.closest_to lat: @lat, long: @long, radius: 0.5, limit: 25
    farthest = near.last

    expect(near.count).to be < 15
    expect(farthest.distance_to @lat, @long).to be <= 0.5
  end
end
