json.array! @metros do |metro|
  # json.(metro, :name, :code, :latitude, :longitude)
  json.name metro.name
  json.code metro.code
  json.lat  metro.latitude
  json.long metro.longitude
end
