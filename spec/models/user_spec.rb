require 'rails_helper'

describe User do
  it "can favorite metros" do
    user  = FactoryGirl.create :user
    metro = FactoryGirl.create :metro

    expect(user.favorite_metros.count).to eq 0

    user.add_favorite_metro metro
    expect(user.favorite_metros.count).to eq 1
    expect(user.favorite_metros.first).to eq metro

    user.add_favorite_metro metro
    expect(user.favorite_metros.count).to eq 1
  end
end
