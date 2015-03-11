class BikeShare
  include HTTParty
  base_uri "http://www.capitalbikeshare.com"

  def self.stations
    get("/data/stations/bikeStations.xml")["stations"]["station"]
  end
end
