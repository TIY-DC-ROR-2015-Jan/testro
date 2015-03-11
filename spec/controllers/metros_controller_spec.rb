require 'rails_helper'

describe MetrosController do
  render_views

  it "can list all the metros" do
    1.upto 5 do |i|
      FactoryGirl.create :metro, name: "Metro #{i}", code: "C#{i}"
    end

    get :index#, format: :json
    # expect(response).to be_successful
    expect(response.code.to_i).to eq 200

    json = response_json
    expect(json.class).to eq Array
    expect(json.count).to eq 5
    expect(json.last["name"]).to eq "Metro 5"
  end

  it "can favorite metros" do
    user = FactoryGirl.create :user
    login user

    metro = FactoryGirl.create :metro

    post :favorite, station_code: metro.code
    expect(response.code.to_i).to eq 200
    expect(user.favorite_metros).to include metro
  end

  it "rejects favorites for non-existant metros" do
    user = FactoryGirl.create :user
    login user

    expect do
      post :favorite, station_code: "NOTASTATION"
    end.to raise_error ActiveRecord::RecordNotFound
  end

  it "requires login before favoriting" do
    metro = FactoryGirl.create :metro

    post :favorite, station_code: metro.code
    expect(flash["alert"]).to include "sign in or sign up"
    expect(response.code.to_i).to eq 302
  end

  it "can list favorited metros" do
    user = FactoryGirl.create :user
    login user

    5.times { FactoryGirl.create :metro }
    favs = Metro.all.sample 3
    favs.each { |m| user.add_favorite_metro m }

    get :favorites
    expect(response_json.count).to eq 3
    # ...
  end

  it "can unfavorite metros"
  it "handles bad requests gracefully"
  # favorite one that doesn't exist
  # unfavorite one not favorited
end
