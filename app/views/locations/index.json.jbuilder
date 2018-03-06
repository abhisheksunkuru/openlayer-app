json.array!(@locations) do |location|
  json.extract! location, :id, :lonlat, :from, :to, :public
  json.url location_url(location, format: :json)
end
