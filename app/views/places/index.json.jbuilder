json.array!(@places) do |place|
  json.extract! place, :id, :name, :description, :details, :fees, :fees, :area, :kind, :activities, :keyword
  json.url place_url(place, format: :json)
end
