require 'rails_helper'

describe Metro do
  it "can sync from the WMATA API" do
    Metro.sync_from_api!
    expect(Metro.count).to eq 95
  end
end
