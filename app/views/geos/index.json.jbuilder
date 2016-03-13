json.array!(@geos) do |geo|
  json.extract! geo, :id, :address, :latitude, :longitude
  json.url geo_url(geo, format: :json)
end
