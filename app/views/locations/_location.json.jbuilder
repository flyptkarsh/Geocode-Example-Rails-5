json.extract! location, :id, :latitude, :longitude, :name, :created_at, :updated_at
json.url location_url(location, format: :json)
