class BikeShare
  include HTTParty
  base_uri "http://www.capitalbikeshare.com"

  def self.stations
    r = get("/data/stations/bikeStations.xml")
    r["stations"]["station"]
  end
end
