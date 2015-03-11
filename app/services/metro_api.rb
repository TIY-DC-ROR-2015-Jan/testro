class MetroApi
  include HTTParty
  base_uri "https://api.wmata.com"
  default_params api_key: ENV["WMATA_API_KEY"]

  class << self
    def trains
      get("/Rail.svc/json/jStations")["Stations"]
    end

    def buses
      get("/Bus.svc/json/jStops")["Stops"]
    end
  end
end
