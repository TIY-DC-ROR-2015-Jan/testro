require 'rails_helper'

describe BusStop do
  it "can sync from the WMATA API" do
    BusStop.sync_from_api!
    expect(BusStop.count).to eq 10894
  end
end
