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

    json = JSON.parse(response.body)
    expect(json.class).to eq Array
    expect(json.count).to eq 5
    expect(json.last["name"]).to eq "Metro 5"
  end

  it "can list favorited metros"
  it "can favorite metros"
  it "can unfavorite metros"
  it "requires login to see favorite metros"
  it "handles bad requests gracefully"
  # favorite one that doesn't exist
  # unfavorite one not favorited
end
